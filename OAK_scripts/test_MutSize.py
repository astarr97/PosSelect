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
from math import floor
from collections import Counter

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

dl_prefix = sys.argv[1]

print(dl_prefix)

dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"

v, vv = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 0)

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
vv.index = vv["Position"]


fixed_to_cut = pd.DataFrame(np.max(dl_fixed[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)).sort_values(0)
poly_to_cut = pd.DataFrame(np.max(dl_poly[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)).sort_values(0)

cutoff_fixed = list(fixed_to_cut[0])[8*fixed_to_cut.shape[0]//10]
cutoff_poly = list(poly_to_cut[0])[8*poly_to_cut.shape[0]//10]
print(cutoff_fixed, cutoff_poly)
cutoff_to_use = (cutoff_fixed + cutoff_poly)/2

v = v.join(dl_fixed).dropna()
vv = vv.join(dl_poly).dropna()
vv = vv.drop_duplicates("Position")
v = v.drop_duplicates("Position")

vv = add_unfold(vv)

vv_ref = vv[vv["Human ref"] == vv["Chimp ref"]]
vv_alt = vv[vv["Human alt"] == vv["Chimp ref"]]
vv_ref["fixed logfc"] = -vv_ref["logfc"].astype(float)
vv_alt["fixed logfc"] = vv_alt["logfc"].astype(float)
vv = pd.concat([vv_ref, vv_alt])

v.index = v["Position"]
vv.index = vv["Position"]

print(v.shape[0], vv.shape[0])

dl_fixed = dl_fixed[(dl_fixed["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_fixed["allele2_pred_counts"].astype(float) > cutoff_to_use)]
dl_poly = dl_poly[(dl_poly["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_poly["allele2_pred_counts"].astype(float) > cutoff_to_use)]

v["Chrom"] = [x.split(":")[0] for x in v["Position"]]
v["Pos"] = [int(x.split(":")[1]) for x in v["Position"]]

vv["Chrom"] = [x.split(":")[0] for x in vv["Position"]]
vv["Pos"] = [int(x.split(":")[1]) for x in vv["Position"]]

out2 = open("MutTargetSize/" + dl_prefix + "_Alpha.txt", 'w')
out2.write("ID\tStartSpecSup\tBig_Cutoff\tPosLFC_Cutoff\tNegLFC_Cutoff\tMetric\tMedian Fixed PhyloP\tNumber Fixed Variants\tMedian Polymorphic PhyloP\tNumber Polymorphic Variants\tFisher exact p-value\tMWU p-value\tFisher exact p-value; alt greater\tMWU p-value; alt greater\talpha\tCutoff\t[[dc1, du1], [pc1, pu1]]\t[[dc2, du2], [pc2, pu2]]\tProportion\n")

print(v)
print(vv)

v["logfc"] = v["logfc"].astype(float)
v["abs logfc"] = v["abs logfc"].astype(float)

vv["logfc"] = vv["logfc"].astype(float)
vv["fixed logfc"] = vv["fixed logfc"].astype(float)
vv["abs logfc"] = vv["abs logfc"].astype(float)

#Must be in ascending order!
for startSpecSup in [0, 250]:
    v = v[v["SpecSup447"] > startSpecSup]
    vv = vv[vv["SpecSup447"] > startSpecSup]
    for lfc_cut in [15000, 30000, 50000, 100000, 250000, 500000, 1000000, "All"]:
        
        
        if lfc_cut == "All":
            v_use = v.copy()
            vv_use = vv.copy()
            neg_cut = 0
            pos_cut = 0
        else:
            neg_cut = list(v.sort_values("logfc")["logfc"])[lfc_cut]
            pos_cut = list(v.sort_values("logfc")["logfc"])[-lfc_cut-1]
            
            v_use = v[(v["logfc"] >= pos_cut) | (v["logfc"] <= neg_cut)]
            vv_use = vv[(vv["fixed logfc"] >= pos_cut) | (vv["fixed logfc"] <= neg_cut)]
        
        suffix = "NoChange"
        for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9, 0.95]:
            vvv = prepare_alpha(v_use, vv_use, stat = "abs logfc")
            x2 = v_use["abs logfc"]
            yvals2 = list(vv_use["abs logfc"])
            yvals2.sort()
            cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
    
            alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "Absolute log fold-change", \
                                 np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                                 mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                                 mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
            
            vvv = prepare_alpha(v_use, vv_use, stat = "PhyloP447")
            x2 = v_use["PhyloP447"]
            yvals2 = list(vv_use["PhyloP447"])
            yvals2.sort()
            cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
    
            alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "PhyloP447", \
                                 np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                                 mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                                 mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")

        
        v_use2, vv_use2 = remove_repeats(v_use, vv_use)
        v_use2, vv_use2 = remove_pseudos(v_use2, vv_use2)
        
        suffix = "NoRepeatsNoPseudos"
        for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9, 0.95]:
            vvv = prepare_alpha(v_use2, vv_use2, stat = "abs logfc")
            x2 = v_use2["abs logfc"]
            yvals2 = list(vv_use2["abs logfc"])
            yvals2.sort()
            cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
    
            alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "Absolute log fold-change", \
                                 np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                                 mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                                 mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
            
            vvv = prepare_alpha(v_use2, vv_use2, stat = "PhyloP447")
            x2 = v_use2["PhyloP447"]
            yvals2 = list(vv_use2["PhyloP447"])
            yvals2.sort()
            cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
    
            alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "PhyloP447", \
                                 np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                                 mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                                 mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")

out2.close()
