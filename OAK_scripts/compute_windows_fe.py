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
from matplotlib.backends.backend_pdf import PdfPages
from math import floor

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)
metric = " ".join(sys.argv[1].split("_"))
spec_sup = float(sys.argv[2])
pc = float(sys.argv[3])
maf_cut = float(sys.argv[4])
rem_repeats = int(sys.argv[5])
permute = int(sys.argv[6])
window_size = int(sys.argv[7])
out_file = sys.argv[-1]
phylop_cut = -100

def shuffle_fp(vvv):
    shuffle = vvv.copy()
    shuffled = list(shuffle["FixedOrPoly"].sample(frac = 1, replace = False))
    shuffle["FixedOrPoly"] = shuffled
    return shuffle

if metric == "PhyloP447":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = maf_cut, spec_sup = spec_sup)

elif metric == "abs logfc":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = maf_cut, spec_sup = spec_sup)
    dl_prefix = sys.argv[8]
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
    
    dl_fixed = dl_fixed[(dl_fixed["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_fixed["allele2_pred_counts"].astype(float) > cutoff_to_use)]
    dl_poly = dl_poly[(dl_poly["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_poly["allele2_pred_counts"].astype(float) > cutoff_to_use)]

elif metric == "CNEP":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = maf_cut, spec_sup = spec_sup)
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


if rem_repeats:
    v, yvalls = remove_pseudos(v, yvalls)
    v, yvalls = remove_repeats(v, yvalls)

yvalls = add_unfold(yvalls)


yvalls_ref = yvalls[yvalls["Human ref"] == yvalls["Chimp ref"]]
yvalls_alt = yvalls[yvalls["Human alt"] == yvalls["Chimp ref"]]
if metric == "abs logfc":
    yvalls_ref["fixed logfc"] = -yvalls_ref["logfc"].astype(float)
    yvalls_alt["fixed logfc"] = yvalls_alt["logfc"].astype(float)
yvalls = pd.concat([yvalls_ref, yvalls_alt])

#v.to_csv("Fixed_" + dl_prefix + ".txt", sep = "\t")
#yvalls.to_csv("Poly_MAF0.25_" + dl_prefix + ".txt", sep = "\t")
#print("Wrote out")
#assert(False)

v["Chrom"] = [x.split(":")[0] for x in list(v["Position"])]
yvalls["Chrom"] = [x.split(":")[0] for x in list(yvalls["Position"])]
print(v)
print(yvalls)
if metric != "PhyloP447":
    if dl_prefix not in os.listdir("Windows_Results"):
        os.mkdir("Windows_Results/" + dl_prefix)
if metric == "abs logfc":
    out_metric = open("Windows_Results/" + dl_prefix + "/Windows_FilterNewTEs_" + out_file, 'w')
else:
    out_metric = open("Windows_Results/Windows_FilterNewTEs_" + out_file, 'w')
out_metric.write("\t".join(["Window", "Statistic", "Median fixed " + metric, "Number fixed variants", "Median polymorphic " + metric, "Number polymorphic variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater"," MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]) + "\n")

chroms = ["chr" + str(x) for x in range(1, 23)] + ["chrX"]
for chrom in chroms:
    v_chr = v[v["Chrom"].isin([chrom])]
    vv_chr = yvalls[yvalls["Chrom"].isin([chrom])]
    v_chr["Loc"] = [int(x.split(":")[1]) for x in list(v_chr["Position"])]
    vv_chr["Loc"] = [int(x.split(":")[1]) for x in list(vv_chr["Position"])]

    start = 0
    end = max([int(x.split(":")[1]) for x in list(v_chr["Position"])] + [int(x.split(":")[1]) for x in list(vv_chr["Position"])])
    print(chrom, start, end)
    
    for i in range(start, end, window_size//2):
        #print(i)
        vk = v_chr[v_chr["Loc"].isin(list(range(i, i + window_size)))].copy()
        vvk = vv_chr[vv_chr["Loc"].isin(list(range(i, i + window_size)))].copy()
        vvv = prepare_alpha(vk.copy(), vvk.copy(), metric)

        if permute:
            vvv = shuffle_fp(vvv)
        fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        if len(fixed_stat) >= 20 and len(poly_stat) >= 20:
            for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                if permute:
                    x = list(vvk.sort_values(metric)[metric])
                else:
                    vvk2 = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])]
                    x = list(vvk2.sort_values("PhyloP")["PhyloP"])
                cutoff = x[int(floor((len(x)*cuttt)))]
                alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                table1 = alpha[2]
                table2 = alpha[3]
                out_metric.write("\t".join([str(x) for x in [chrom + ":" + str(i) + "-" + str(i+window_size), metric, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
                #print(table)
                #print("\t".join([str(x) for x in [chrom + ":" + str(i) + "-" + str(i+window_size), metric, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), fisher_exact(table)[1], alpha[0], mwu(fixed_stat, poly_stat)[1], alpha[1], table, cuttt]]) + "\n")

out_metric.close()

if metric == "abs logfc":
    try:
        os.mkdir("Windows_Results/" + dl_prefix)
    except:
        pass
    v = v[v["Position"].isin(dl_fixed.index)].copy()
    yvalls = yvalls[yvalls["Position"].isin(dl_poly.index)].copy()
    out_metric = open("Windows_Results/" + dl_prefix + "/" + "Windows_FilterNewTEs_" + out_file.replace(".txt", "_Top20th.txt"), 'w')
    out_metric.write("\t".join(["Window", "Statistic", "Median fixed " + metric, "Number fixed variants", "Median polymorphic " + metric, "Number polymorphic variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater"," MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]) + "\n")
    
    chroms = ["chr" + str(x) for x in range(1, 23)] + ["chrX"]
    for chrom in chroms:
        v_chr = v[v["Chrom"].isin([chrom])]
        vv_chr = yvalls[yvalls["Chrom"].isin([chrom])]
        v_chr["Loc"] = [int(x.split(":")[1]) for x in list(v_chr["Position"])]
        vv_chr["Loc"] = [int(x.split(":")[1]) for x in list(vv_chr["Position"])]
    
        start = 0
        end = max([int(x.split(":")[1]) for x in list(v_chr["Position"])] + [int(x.split(":")[1]) for x in list(vv_chr["Position"])])
        print(chrom, start, end)
        
        for i in range(start, end, window_size//2):
            #print(i)
            vk = v_chr[v_chr["Loc"].isin(list(range(i, i + window_size)))].copy()
            vvk = vv_chr[vv_chr["Loc"].isin(list(range(i, i + window_size)))].copy()
            vvv = prepare_alpha(vk.copy(), vvk.copy(), metric)
            
            if permute:
                vvv = shuffle_fp(vvv)
            fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
            poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
            if len(fixed_stat) >= 20 and len(poly_stat) >= 20:
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(vvk.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out_metric.write("\t".join([str(x) for x in [chrom + ":" + str(i) + "-" + str(i+window_size), metric, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
                    #print(table)
                    #print("\t".join([str(x) for x in [chrom + ":" + str(i) + "-" + str(i+window_size), metric, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), fisher_exact(table)[1], mwu(fixed_stat, poly_stat)[1], alpha[0], alpha[1], table, cuttt]]) + "\n")

    out_metric.close()
    
        