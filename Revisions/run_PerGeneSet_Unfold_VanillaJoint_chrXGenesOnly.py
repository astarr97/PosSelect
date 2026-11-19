from PosSelect_Functions import *
import seaborn as sns
import matplotlib.pyplot as plt
from scipy.stats import gaussian_kde
import pandas as pd
import numpy as np
import copy
import seaborn as sns
from scipy.stats import mannwhitneyu as mwu
from scipy.stats import ttest_ind
from scipy.stats import ttest_rel
from statsmodels.stats.multitest import fdrcorrection
from scipy.stats import wilcoxon
from scipy.optimize import curve_fit
from scipy.stats import fisher_exact
import sys
import os
from scipy.stats import norm
from math import floor

# Unrestricted (vanilla) gene-label permutations.
# Prespecified discovery rule: one-sided MWU BH-FDR < 0.05 AND
# one-sided Fisher's exact p < 0.05 at the 90th percentile.
# chrX defaults to the corrected chrX_Permutation_Input.csv.
# Observed results are recomputed, not copied from the supplied table.
def run_joint_permutations():
    import argparse
    import csv
    import json
    from pathlib import Path

    parser = argparse.ArgumentParser(description="Non-coding HPO permutations: BH-adjusted MWU AND nominal Fisher at 90th percentile")
    parser.add_argument("metric", choices=["PhyloP447"])
    parser.add_argument("--scope", choices=["genome", "chrX"], required=True)
    parser.add_argument("--terms-file", default=None, help="Observed results CSV; defaults to Supplemental_Table_2.csv for genome, chrX_Permutation_Input.csv for chrX")
    parser.add_argument("--n-permutations", type=int, default=1000)
    parser.add_argument("--start", type=int, default=0)
    parser.add_argument("--out", required=True, help="Per-permutation discovery counts CSV")
    parser.add_argument("--all-pvalues-out", default=None, help="Full term-wise CSV including MWU, BH FDR and Fisher p values")
    parser.add_argument("--observed-only", action="store_true", help="Compute only the actual unpermuted discovery count")
    args = parser.parse_args()
    if args.start < 0 or args.n_permutations < 1:
        parser.error("--start must be nonnegative and --n-permutations at least 1")
    out_path = Path(args.out)
    term_path = Path(args.all_pvalues_out) if args.all_pvalues_out else out_path.with_name(out_path.stem + "_all_pvalues.csv")
    if out_path.resolve() == term_path.resolve():
        parser.error("The full results CSV must have a different path than --out")
    out_path.parent.mkdir(parents=True, exist_ok=True)
    term_path.parent.mkdir(parents=True, exist_ok=True)

    if args.terms_file is None:
        args.terms_file = "chrX_Permutation_Input.csv" if args.scope == "chrX" else "Supplemental_Table_2.csv"
    results = pd.read_csv(args.terms_file)
    if "Term" not in results:
        raise ValueError("Terms file must include a 'Term' column")
    terms = list(dict.fromkeys(results["Term"].dropna().astype(str)))
    if args.scope == "chrX":
        # A useful reference check, but not a substitute for reproducing
        # the corrected observed statistics from the underlying variant data.
        qcol = "MWU FDR"
        pcol = "Fisher exact p-value; alt greater"
        if qcol in results.columns and pcol in results.columns:
            ref_both = results.loc[
                (pd.to_numeric(results[qcol], errors="coerce") < 0.05)
                & (pd.to_numeric(results[pcol], errors="coerce") < 0.05), "Term"
            ].dropna().astype(str).tolist()
            print(f"Corrected chrX input: {len(terms)} terms; {len(ref_both)} reference joint discoveries: {ref_both}", flush=True)
    hpo = pd.read_csv("/oak/stanford/groups/hbfraser/astarr/PosSelect_New/GeneSets/HPO_AccelEvol_Input.txt", sep="\t")
    hpo_map = {str(r.Term): set(str(r.Genes).split(";")) for r in hpo.itertuples(index=False)}
    missing = [t for t in terms if t not in hpo_map]
    if missing:
        raise ValueError(f"Missing HPO terms: {missing[:10]}")
    universe = sorted(set().union(*(hpo_map[t] for t in terms)))
    gene_index = {g:i for i,g in enumerate(universe)}
    term_ids = [np.array([gene_index[g] for g in hpo_map[t] if g in gene_index], dtype=np.int32) for t in terms]

    fixed, poly = read_noncoding_data_fast(path="./", maf_cut=0.25, spec_sup=250)
    poly = add_unfold(poly)
    if args.scope == "chrX":
        def x_filter(frame):
            for column in ["Chromosome", "Chrom", "Chr", "chr"]:
                if column in frame:
                    return frame[column].astype(str).str.replace("chr", "", regex=False).str.upper().eq("X")
            position = frame["Position"].astype(str)
            mask = position.str.match(r"(?i)^(chr)?X[:_-]")
            if not mask.any():
                raise ValueError("Could not identify chrX from Position")
            return mask
        fixed = fixed.loc[x_filter(fixed)].copy()
        poly = poly.loc[x_filter(poly)].copy()

    def make_groups(frame):
        tmp = frame.loc[frame["NearestGene"].isin(gene_index), ["NearestGene", args.metric]].copy()
        tmp[args.metric] = pd.to_numeric(tmp[args.metric], errors="coerce")
        tmp = tmp.dropna(subset=["NearestGene", args.metric])
        values = tmp[args.metric].to_numpy(dtype=float)
        idx_by_gene = [[] for _ in universe]
        for j, gene in enumerate(tmp["NearestGene"]):
            idx_by_gene[gene_index[gene]].append(j)
        return values, [np.array(a, dtype=np.int32) for a in idx_by_gene]

    fixed_values, fixed_by_gene = make_groups(fixed)
    poly_values, poly_by_gene = make_groups(poly)
    # For chrX, shuffle ONLY genes that have at least one chrX fixed or
    # polymorphic variant. Non-chrX genes have no variant observations and
    # remain unchanged. This preserves the chrX-gene occupancy of each HPO
    # term while still allowing genes with only one variant class to shuffle.
    # For genome-wide analyses, shuffle every gene as previously.
    eligible_gene_indices = np.array([
        i for i in range(len(universe))
        if len(fixed_by_gene[i]) or len(poly_by_gene[i])
    ], dtype=np.int32) if args.scope == "chrX" else np.arange(len(universe), dtype=np.int32)
    print(
        f"Permutation universe: {len(eligible_gene_indices)} variant-bearing "
        f"{'chrX' if args.scope == 'chrX' else 'genome-wide'} genes "
        f"out of {len(universe)} annotated genes; "
        f"{len(universe) - len(eligible_gene_indices)} held fixed",
        flush=True,
    )

    def make_permutation(rep):
        perm = np.arange(len(universe), dtype=np.int32)
        perm[eligible_gene_indices] = eligible_gene_indices[
            np.random.RandomState(rep).permutation(len(eligible_gene_indices))
        ]
        return perm

    min_fixed = 100 if args.scope == "chrX" else 101
    min_poly = 50 if args.scope == "chrX" else 51

    def term_stats(source_ids):
        # Preserve all genes assigned to the term. A gene with variants in only
        # one class still contributes those variants; intersecting gene sets
        # artificially removes chrX polymorphisms and changes observed tests.
        fparts = [fixed_by_gene[g] for g in source_ids if len(fixed_by_gene[g])]
        pparts = [poly_by_gene[g] for g in source_ids if len(poly_by_gene[g])]
        nf = sum(map(len, fparts)); npoly = sum(map(len, pparts))
        if nf < min_fixed or npoly < min_poly:
            return nf, npoly, float("nan"), float("nan")
        fv = fixed_values[np.concatenate(fparts)]
        pv = poly_values[np.concatenate(pparts)]
        mwu_p = float(mwu(fv, pv, alternative="greater").pvalue)
        # Two adjacent boundary conventions, as in compute_alpha_cutoff.
        cutoff = np.sort(pv)[int(floor(len(pv)*0.9))]
        f_gt = int(np.count_nonzero(fv > cutoff)); p_gt = int(np.count_nonzero(pv > cutoff))
        f_ge = int(np.count_nonzero(fv >= cutoff)); p_ge = int(np.count_nonzero(pv >= cutoff))
        fisher_gt = fisher_exact([[f_gt, len(fv)-f_gt], [p_gt, len(pv)-p_gt]], alternative="greater").pvalue
        fisher_ge = fisher_exact([[f_ge, len(fv)-f_ge], [p_ge, len(pv)-p_ge]], alternative="greater").pvalue
        fisher_p = (float(fisher_gt) + float(fisher_ge))/2.0
        return nf, npoly, mwu_p, fisher_p

    summary_columns = ["permutation", "n_eligible_terms", "n_MWU_BH_FDR_lt_0.05", "n_Fisher_p_lt_0.05", "n_joint_discoveries", "joint_terms", "min_MWU_p"]
    detail_columns = ["permutation", "Term", "n_fixed_variants", "n_poly_variants", "one_sided_MWU_p", "MWU_BH_FDR", "one_sided_Fisher_p_90pct", "passes_both"]
    with out_path.open("w", newline="") as sf, term_path.open("w", newline="") as df:
        sw = csv.writer(sf); dw = csv.writer(df)
        sw.writerow(summary_columns); dw.writerow(detail_columns)
        iterations = [(-1, None)] if args.observed_only else [(-1, None)] + [(i, make_permutation(i)) for i in range(args.start, args.start + args.n_permutations)]
        for rep, perm in iterations:
            inverse = None if perm is None else np.argsort(perm)
            records = []
            for term, target_ids in zip(terms, term_ids):
                source = target_ids if inverse is None else inverse[target_ids]
                nf, npoly, mp, fp = term_stats(source)
                records.append((term, nf, npoly, mp, fp))
            mwu_ps = np.array([r[3] for r in records], dtype=float)
            fisher_ps = np.array([r[4] for r in records], dtype=float)
            valid = np.isfinite(mwu_ps) & np.isfinite(fisher_ps)
            qvals = np.full(len(terms), np.nan)
            if valid.any():
                qvals[valid] = fdrcorrection(mwu_ps[valid], alpha=0.05, method="indep")[1]
            mpass = valid & (qvals < 0.05)
            fpass = valid & (fisher_ps < 0.05)
            both = mpass & fpass
            joint_terms = [terms[i] for i in np.where(both)[0]]
            sw.writerow([rep, int(valid.sum()), int(mpass.sum()), int(fpass.sum()), len(joint_terms), ";".join(joint_terms), float(np.nanmin(mwu_ps)) if valid.any() else float("nan")])
            for i, (term, nf, npoly, mp, fp) in enumerate(records):
                dw.writerow([rep, term, nf, npoly, mp, qvals[i], fp, int(both[i])])
            sf.flush(); df.flush()
            if rep == -1:
                print(f"OBSERVED: {len(joint_terms)} joint discoveries; {valid.sum()} eligible terms; {int(mpass.sum())} MWU BH-significant; {int(fpass.sum())} Fisher-significant", flush=True)
                if args.scope == "chrX" and "ref_both" in locals():
                    reference = set(ref_both)
                    reconstructed = set(joint_terms)
                    if reference != reconstructed:
                        print(
                            "WARNING: Corrected chrX table and recomputed observed joint discoveries disagree. "
                            f"Only in table: {sorted(reference - reconstructed)}; "
                            f"only in recomputation: {sorted(reconstructed - reference)}. "
                            "Do not interpret permutation results until variant filtering and Fisher/BH tests agree.",
                            flush=True
                        )
            elif (rep - args.start + 1) % 10 == 0:
                print(f"{args.scope} permutation {rep}: joint discoveries={len(joint_terms)}", flush=True)
    if not args.observed_only:
        sums = pd.read_csv(out_path)
        observed = int(sums.loc[sums["permutation"] == -1, "n_joint_discoveries"].iloc[0])
        null = sums.loc[sums["permutation"] >= 0, "n_joint_discoveries"]
        count = int((null >= observed).sum())
        empirical = (count+1)/(len(null)+1)
        print(f"Observed discoveries={observed}; permutations with >= observed={count}/{len(null)}; plus-one empirical upper-tail p={empirical:.6g}", flush=True)
        out_path.with_suffix(".json").write_text(json.dumps({"scope":args.scope,"observed_joint_discoveries":observed,"n_permutations":len(null),"permutations_at_least_observed":count,"plus_one_empirical_p":empirical,"interpretation":"global empirical test of number of joint discoveries; not an FDR estimate","fisher_cutoff": "90th percentile of each term's polymorphic PhyloP values"}, indent=2))

if __name__ == "__main__":
    run_joint_permutations()
