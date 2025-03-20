from PosSelect_Functions import *
import seaborn as sns
import matplotlib.pyplot as plt
from scipy.stats import gaussian_kde
import pandas as pd
import numpy as np
import copy
import seaborn as sns
from statsmodels.stats.multitest import fdrcorrection
from scipy.stats import wilcoxon
from scipy.optimize import curve_fit
from scipy.stats import fisher_exact
import sys
import os
from math import floor

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

metric = sys.argv[1].replace("_", " ")

if metric == "PhyloP447":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 250)
    yvalls = add_unfold(yvalls)
elif metric == "abs logfc":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 0)
    dl_prefix = sys.argv[2]
    dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"

    #Trying it with the deep learning predictions
    dl_fixed = pd.read_csv(dl_path + dl_prefix + "_HumanDerived.txt", sep = "\t")
    dl_fixed = dl_fixed.set_index("variant_id")
    dl_fixed = dl_fixed[["logfc", "allele1_pred_counts", "allele2_pred_counts"]]
    dl_fixed = dl_fixed[dl_fixed["logfc"] != "logfc"]
    dl_fixed["abs logfc"] = np.abs(dl_fixed["logfc"].astype(float))
    v.index = v["Position"]
    
    dl_poly = pd.read_csv(dl_path + dl_prefix + "_Polymorphic.txt", sep = "\t")
    dl_poly = dl_poly.set_index("variant_id")
    dl_poly = dl_poly[["logfc", "allele1_pred_counts", "allele2_pred_counts"]]
    dl_poly = dl_poly[dl_poly["logfc"] != "logfc"]
    dl_poly["abs logfc"] = np.abs(dl_poly["logfc"].astype(float))
    yvalls.index = yvalls["Position"]

    fixed_to_cut = pd.DataFrame(np.max(dl_fixed[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)).sort_values(0)
    poly_to_cut = pd.DataFrame(np.max(dl_poly[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)).sort_values(0)
    
    cutoff_fixed = list(fixed_to_cut[0])[8*fixed_to_cut.shape[0]//10]
    cutoff_poly = list(poly_to_cut[0])[8*poly_to_cut.shape[0]//10]
    print(cutoff_fixed, cutoff_poly)
    cutoff_to_use = (cutoff_fixed + cutoff_poly)/2

    v = v.join(dl_fixed).dropna()
    yvalls = yvalls.join(dl_poly).dropna()
    yvalls = yvalls.drop_duplicates("Position")
    v = v.drop_duplicates("Position")
    yvalls = add_unfold(yvalls)
    dl_fixed = dl_fixed[(dl_fixed["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_fixed["allele2_pred_counts"].astype(float) > cutoff_to_use)]
    dl_poly = dl_poly[(dl_poly["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_poly["allele2_pred_counts"].astype(float) > cutoff_to_use)]

v.index = v["Position"]
yvalls.index = yvalls["Position"]

v, yvalls = remove_pseudos(v, yvalls)
v, yvalls = remove_repeats(v, yvalls)

v["Chrom"] = [x.split(":")[0] for x in v["Position"]]
yvalls["Chrom"] = [x.split(":")[0] for x in yvalls["Position"]]

chroms = ["chr" + str(i) for i in range(1, 23)] + ["chrX"]
out = []
for chrom in chroms:
    vk = v[v["Chrom"].isin([chrom])].copy()
    vvk = yvalls[yvalls["Chrom"].isin([chrom])].copy()
    vvv = prepare_alpha(vk, vvk, stat = metric)
    x2 = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    yvals2 = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99]:
        x = list(vvk.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.append([chrom, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
    print(chrom, alpha[0])
df = pd.DataFrame(out)
df.columns = ["Chrom", "Median Fixed PhyloP", "Number Fixed Variants", "Median Polymorphic PhyloP", "Number Polymorphic Variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]
df = df.sort_values("alpha", ascending = False)
if metric == "abs logfc":
    df.to_csv("PerChrom_Results/PerChrom_FilterNewTEs_NoPseudosNoRepeats_" + dl_prefix + "_" + metric.replace(" ", "_") + "_SpecSup0_MAFCut0.25.txt", sep = "\t", index = False)
else:
    df.to_csv("PerChrom_Results/PerChrom_FilterNewTEs_NoPseudosNoRepeats_" + metric.replace(" ", "_") + "_SpecSup250_MAFCut0.25.txt", sep = "\t", index = False)

#Get a confidence interval for chromosome X using 1000 iterations
out = []
for chrom in chroms:
    for iteration in range(1000):
        np.random.seed(iteration)
        v_chr = v[v["Chrom"].isin([chrom])].copy()
        yvalls_chr = yvalls[yvalls["Chrom"].isin([chrom])].copy()
    
        v_sample = v_chr.sample(frac = 1, replace = True)
        yvalls_sample = yvalls_chr.sample(frac = 1, replace = True)
    
        vvv = prepare_alpha(v_sample, yvalls_sample, stat = metric)
        x2 = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        yvals2 = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99]:
            x = list(yvalls_sample.sort_values(metric)[metric])
            cutoff = x[int(floor((len(x)*cuttt)))]
            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out.append([chrom, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, iteration])
df = pd.DataFrame(out)
df.columns = ["Chrom", "Median Fixed PhyloP", "Number Fixed Variants", "Median Polymorphic PhyloP", "Number Polymorphic Variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion", "Iteration"]
df = df.sort_values("alpha", ascending = False)
if metric == "abs logfc":
    df.to_csv("PerChrom_Results/PerChrom_FilterNewTEs_NoPseudosNoRepeats_" + dl_prefix + "_" + metric.replace(" ", "_") + "_SpecSup0_MAFCut0.25_AllChroms_Bootstrap.txt", sep = "\t", index = False)
else:
    df.to_csv("PerChrom_Results/PerChrom_FilterNewTEs_NoPseudosNoRepeats_" + metric.replace(" ", "_") + "_SpecSup250_MAFCut0.25_AllChroms_Bootstrap.txt", sep = "\t", index = False)

