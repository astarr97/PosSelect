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

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

metric = " ".join(sys.argv[1].split("_"))

def shuffle_fp(vvv):
    shuffle = vvv.copy()
    shuffled = list(shuffle["FixedOrPoly"].sample(frac = 1, replace = False))
    shuffle["FixedOrPoly"] = shuffled
    return shuffle

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

elif metric == "CNEP":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 250)
    v.index = v["Position"]
    v_cnep = pd.read_csv("HumChp_NC_Final_Rmdup_CREs_NoHLA_CNEP_CSS-CNEP.txt", sep = "\t").set_index("Position")
    v = v.join(v_cnep)
    v = v[~((v["CNEP"].isin(["."])) | (v["CSS-CNEP"].isin(["."])))]
    v["CNEP"] = v["CNEP"].astype(float)
    v["CSS-CNEP"] = v["CSS-CNEP"].astype(float)
    v_cnep = 0
    
    yvalls.index = yvalls["Position"]
    yvalls_cnep = pd.read_csv("HumPoly_NC_Final_CREs_NoHLA_CNEP_CSS-CNEP.txt", sep = "\t").set_index("Position")
    yvalls = yvalls.join(yvalls_cnep)
    yvalls = yvalls[~((yvalls["CNEP"].isin(["."])) | (yvalls["CSS-CNEP"].isin(["."])))]
    yvalls["CNEP"] = yvalls["CNEP"].astype(float)
    yvalls["CSS-CNEP"] = yvalls["CSS-CNEP"].astype(float)
    yvalls_cnep = 0
    yvalls = add_unfold(yvalls)
elif metric == "jsd":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 0)
    dl_prefix = sys.argv[2]
    dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"

    #Trying it with the deep learning predictions
    dl_fixed = pd.read_csv(dl_path + dl_prefix + "_HumanDerived.txt", sep = "\t")
    dl_fixed = dl_fixed.set_index("variant_id")
    dl_fixed = dl_fixed[["logfc", "allele1_pred_counts", "allele2_pred_counts", "jsd"]]
    dl_fixed = dl_fixed[dl_fixed["logfc"] != "logfc"]
    dl_fixed["jsd"] = dl_fixed["jsd"].astype(float)
    dl_fixed["abs logfc"] = np.abs(dl_fixed["logfc"].astype(float))
    v.index = v["Position"]
    
    dl_poly = pd.read_csv(dl_path + dl_prefix + "_Polymorphic.txt", sep = "\t")
    dl_poly = dl_poly.set_index("variant_id")
    dl_poly = dl_poly[["logfc", "allele1_pred_counts", "allele2_pred_counts", "jsd"]]
    dl_poly = dl_poly[dl_poly["logfc"] != "logfc"]
    dl_poly["jsd"] = dl_poly["jsd"].astype(float)
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
    
elif metric == "BGS":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 0)
    yvalls = add_unfold(yvalls)
    v.index = v["Position"]
    yvalls.index = yvalls["Position"]
    bgs_v = pd.read_csv("HumChp_NC_Final_Rmdup_CREs_NoHLA_Intersect_BGS.txt", sep = "\t", header = None).set_index(0)
    bgs_v.columns = ["BGS"]
    v = v.join(bgs_v).dropna()
    v = v[~v["BGS"].isin(["."])]
    v["BGS"] = v["BGS"].astype(float)
    
    bgs_vv = pd.read_csv("HumPoly_NC_Final_CREs_NoHLA_Intersect_BGS.txt", sep = "\t", header = None).set_index(0)
    bgs_vv.columns = ["BGS"]
    yvalls = yvalls.join(bgs_vv).dropna()
    yvalls = yvalls[~yvalls["BGS"].isin(["."])]
    yvalls["BGS"] = yvalls["BGS"].astype(float)
    
    v = v.drop_duplicates("Position")
    yvalls = yvalls.drop_duplicates("Position")


print(v.shape[0], yvalls.shape[0])

#Running in general
maf_cut = 0.25
phylop_cut = -100
pc = -1

hpo = pd.read_csv("/oak/stanford/groups/hbfraser/astarr/PosSelect_New/GeneSets/HPO_AccelEvol_Input.txt", sep= "\t")
d_HPO = {}

for index, row in hpo.iterrows():
    d_HPO[row["Term"]] = row["Genes"].split(";")
    


def run_per_gene(v_test, yvalls_test):
    c = 0
    out = []
    v_test.index = v_test["NearestGene"]
    yvalls_test.index = yvalls_test["NearestGene"]
    for key in d_HPO.keys():
        if c%1000 == 0:
            print(c)
        if len(d_HPO[key]) >= 15 and len(d_HPO[key]) < 100:
            vk = v_test.loc[np.intersect1d(v_test.index, d_HPO[key])]
            vvk = yvalls_test.loc[np.intersect1d(yvalls_test.index, d_HPO[key])]
            x2 = [np.float64(x) for x in list(vk[metric])]
            yvals2 = [np.float64(j) for j in list(vvk[metric])]
            yvals2.sort()
            vvv = prepare_alpha(vk, vvk, stat = metric)
            if len(vk.index) > 100 and len(vvk.index) > 50:
                for cuttt in [0.6, 0.7, 0.8, 0.9, 0.95]:
                    cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv, dn_cut = 0.05, plot = False, cutoff = cutoff)
    
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out.append([key, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
                    #print([key, np.median(x2), len(x2), np.median(yvals2), len(yvals2), fisher_exact(table1)[1], mwu(x2, yvals2)[1], alpha[0], alpha[1], table1, cuttt])
            #shuffle_alphas = []
            #for i in range(1000):
                #if i % 100 == 0:
                    #print(i)
            #    shuffled = shuffle_fp(vvv)
            #    alpha_shuf = compute_alpha_new(shuffled, plot = False, dn_cut = 0.05)
            #    shuffle_alphas.append(alpha_shuf[0])
            #print(shuffle_alphas)
            #z = (alpha[0] - np.mean(shuffle_alphas))/np.std(shuffle_alphas)
            #permute_p = norm.sf(z)
        
            #out.append([gene, np.median(x2), len(x2), np.median(yvals2), len(yvals2), fisher_exact(table)[1], alpha[0], alpha[1], alpha[2], alpha[3], table, z, permute_p, np.median(shuffle_alphas)])
            
        c += 1
        #if c == 5:
        #    break
        
    from statsmodels.stats.multitest import fdrcorrection
    df = pd.DataFrame(out)
    df = df.sort_values(5)
    #df["FDR"] = fdrcorrection(df[5])[1]
    df.columns = ["Term", "Median Fixed PhyloP", "Number Fixed Variants", "Median Polymorphic PhyloP", "Number Polymorphic Variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]
    return df


if metric == "PhyloP447" or metric == "CNEP":
    df = run_per_gene(v, yvalls)
    df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    pc = 0
    df = run_per_gene(v[v["PhastCons447"].astype(float) > 0].copy(), yvalls[yvalls["PhastCons447"].astype(float) > 0].copy())
    df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    v, yvalls = remove_pseudos(v, yvalls)
    v, yvalls = remove_repeats(v, yvalls)
    
    pc = -1
    df = run_per_gene(v, yvalls)
    df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NoPseudosNoRepeats_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #pc = 0
    #df = run_per_gene(v[v["PhastCons447"].astype(float) > 0].copy(), yvalls[yvalls["PhastCons447"].astype(float) > 0].copy())
    #df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NoPseudosNoRepeats_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
elif metric == "abs logfc" or metric == "jsd":
    try:
        os.mkdir("PerGeneSet_Unfold_Permute/" + dl_prefix)
    except:
        pass
    
    df = run_per_gene(v, yvalls)
    df.to_csv("PerGeneSet_Unfold_Permute/" + dl_prefix + "/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_All_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    df = run_per_gene(v[v["Position"].isin(dl_fixed.index)].copy(), yvalls[yvalls["Position"].isin(dl_poly.index)].copy())
    df.to_csv("PerGeneSet_Unfold_Permute/" + dl_prefix + "/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_Top20th_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #v_low = v[v["SpecSup447"] < 105].copy()
    #yvalls_low = yvalls[yvalls["SpecSup447"] < 105]
    #df = run_per_gene(v_low, yvalls_low)
    #df.to_csv("PerGeneSet_Unfold_Permute/" + dl_prefix + "/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_All_MAFCut" + str(maf_cut) + "_SpecSupLT105_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #df = run_per_gene(v_low[v_low["Position"].isin(dl_fixed.index)].copy(), yvalls_low[yvalls_low["Position"].isin(dl_poly.index)].copy())
    #df.to_csv("PerGeneSet_Unfold_Permute/" + dl_prefix + "/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_Top20th_MAFCut" + str(maf_cut) + "_SpecSupLT105_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #v_low = 0
    #yvalls_low = 0
    
    #pc = 0
    #df = run_per_gene(v[(v["PhastCons447"].astype(float) > 0) & (v["SpecSup447"].astype(float) > 250)].copy(), yvalls[(yvalls["PhastCons447"].astype(float) > 0) & (yvalls["SpecSup447"].astype(float) > 250)].copy())
    #df.to_csv("PerGeneSet_Unfold_Permute/" + dl_prefix + "/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_All_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #df = run_per_gene(v[(v["Position"].isin(dl_fixed.index)) & (v["PhastCons447"].astype(float) > 0) & (v["SpecSup447"].astype(float) > 250)].copy(), yvalls[(yvalls["Position"].isin(dl_poly.index)) & (yvalls["PhastCons447"].astype(float) > 0) & (yvalls["SpecSup447"].astype(float) > 250)].copy())
    #df.to_csv("PerGeneSet_Unfold_Permute/" + dl_prefix + "/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_Top20th_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    #if metric == "abs logfc":
    #    pc = -1
    #    v = v[v["abs logfc"] > 0.1]
    #    yvalls = yvalls[yvalls["abs logfc"] > 0.1]
    #    df = run_per_gene(v, yvalls)
    #    df.to_csv("PerGeneSet_Unfold_Permute/" + dl_prefix + "/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_All_AbsGreater0.1_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
        
    #    df = run_per_gene(v[v["Position"].isin(dl_fixed.index)].copy(), yvalls[yvalls["Position"].isin(dl_poly.index)].copy())
    #    df.to_csv("PerGeneSet_Unfold_Permute/" + dl_prefix + "/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_Top20th_AbsGreater0.1_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
elif metric == "BGS":
    df = run_per_gene(v, yvalls)
    df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #pc = 0
    #df = run_per_gene(v[v["PhastCons447"].astype(float) > 0].copy(), yvalls[yvalls["PhastCons447"].astype(float) > 0].copy())
    #df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #v2, yvalls2 = remove_pseudos(v, yvalls)
    #v2, yvalls2 = remove_repeats(v, yvalls)
    
    #pc = -1
    #df = run_per_gene(v2, yvalls2)
    #df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NoPseudosNoRepeats_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #pc = 0
    #df = run_per_gene(v2[v2["PhastCons447"].astype(float) > 0].copy(), yvalls2[yvalls2["PhastCons447"].astype(float) > 0].copy())
    #df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NoPseudosNoRepeats_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #v2 = 0
    #yvalls2 = 0
    
    pc = -1
    v = v[v["SpecSup447"].astype(int) > 250]
    yvalls = yvalls[yvalls["SpecSup447"].astype(int) > 250]
    df = run_per_gene(v, yvalls)
    df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #pc = 0
    #df = run_per_gene(v[v["PhastCons447"].astype(float) > 0].copy(), yvalls[yvalls["PhastCons447"].astype(float) > 0].copy())
    #df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #v, yvalls = remove_pseudos(v, yvalls)
    #v, yvalls = remove_repeats(v, yvalls)
    
    #pc = -1
    #df = run_per_gene(v, yvalls)
    #df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NoPseudosNoRepeats_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    #pc = 0
    #df = run_per_gene(v[v["PhastCons447"].astype(float) > 0].copy(), yvalls[yvalls["PhastCons447"].astype(float) > 0].copy())
    #df.to_csv("PerGeneSet_Unfold_Permute/Finalizing_HPO_FilterNewTEs_FisherExact_NoPseudosNoRepeats_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)

    
    