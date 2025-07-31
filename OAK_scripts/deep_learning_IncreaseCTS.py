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
import os
from scipy.stats import binomtest

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

dl_prefix = sys.argv[1]
group = int(sys.argv[2])
swap_neur = int(sys.argv[3])

#If it is the neuron swapped files, we need to swap the groups
if swap_neur and dl_prefix == "ITL23":
    group = 1

if swap_neur and dl_prefix == "LiangSteinNeuron":
    group = 2

dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"
print(dl_prefix, group, swap_neur)


if swap_neur:
    out = open("IncreaseCTS/IncreaseCTS_" + dl_prefix + "_SwapNeur.txt", 'w')
else:
    out = open("IncreaseCTS/IncreaseCTS_" + dl_prefix + ".txt", 'w')
out.write("ID\tSpecSup447\tEE_Cut\tPhyloP447Cutoff\tMetric\tMedian fixed EE_Dif\tNumber fixed variants\tMedian polymorphic EE_Dif\tNumber polymorphic variants\tFisher exact p-value\tMWU p-value\tFisher exact p-value; alt greater\tMWU p-value; alt greater\talpha\tCutoff\t[[dc1, du1], [pc1, pu1]]\t[[dc2, du2], [pc2, pu2]]\tNum Fixed EE_Dif > 0.1\tNum Fixed EE_Dif < -0.1\tBinom p-value\tMean Fixed EE_Dif\tFixed EE_Dif Z-score rel 0\tProportion\n")

#Read in data and deep learning data
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

cts_metric = "EE"

#Read in the cell type-specificity information
#Trying with SwapNeur
if swap_neur:
    cts_fixed = pd.read_csv(dl_path + dl_prefix + "_EEs_HumanDerivedSwapNeur.txt", sep = "\t").set_index("Position")
    cts_poly = pd.read_csv(dl_path + dl_prefix + "_EEs_PolymorphicSwapNeur.txt", sep = "\t").set_index("Position")
#Original files
else:
    cts_fixed = pd.read_csv(dl_path + dl_prefix + "_EEs_HumanDerived_WithNeuron.txt", sep = "\t").set_index("Position")
    cts_poly = pd.read_csv(dl_path + dl_prefix + "_EEs_Polymorphic_WithNeuron.txt", sep = "\t").set_index("Position")

cts_fixed = cts_fixed[["EE_Allele1", "EE_Allele2"]]
cts_poly = cts_poly[["EE_Allele1", "EE_Allele2"]]

#Join and correct to make derived allele always denominator
v = v.join(cts_fixed).dropna().drop_duplicates("Position")
vv = vv.join(cts_poly).dropna().drop_duplicates("Position")
print(v)
print(vv)
vv = add_unfold(vv)

vv_ref = vv[vv["Human ref"] == vv["Chimp ref"]]
vv_alt = vv[vv["Human alt"] == vv["Chimp ref"]]
vv_ref["fixed logfc"] = -vv_ref["logfc"].astype(float)
vv_alt["fixed logfc"] = vv_alt["logfc"].astype(float)
vv = pd.concat([vv_ref, vv_alt])

v.index = v["Position"]
vv.index = vv["Position"]

v["EE_Allele1"] = v["EE_Allele1"].astype(float)
v["EE_Allele2"] = v["EE_Allele2"].astype(float)
vv["EE_Allele1"] = vv["EE_Allele1"].astype(float)
vv["EE_Allele2"] = vv["EE_Allele2"].astype(float)

#Compute difference in EE
v["EE_Dif"] = v["EE_Allele1"] - v["EE_Allele2"]
vv["EE_Dif"] = vv["EE_Allele1"] - vv["EE_Allele2"]

print(v.shape[0], vv.shape[0])

v["logfc"] = v["logfc"].astype(float)
v["abs logfc"] = v["abs logfc"].astype(float)

vv["logfc"] = vv["logfc"].astype(float)
vv["fixed logfc"] = vv["fixed logfc"].astype(float)
vv["abs logfc"] = vv["abs logfc"].astype(float)

signs = []
for index, row in vv.iterrows():
    if np.sign(row["logfc"]) == np.sign(row["fixed logfc"]):
        signs.append(1)
    else:
        signs.append(-1)
vv["SignFlip"] = signs
vv["Fixed EE_Dif"] = vv["SignFlip"]*vv["EE_Dif"]
v["Fixed EE_Dif"] = v["EE_Dif"]

v = v.drop_duplicates("Position")
vv = vv.drop_duplicates("Position")

#Test across a bunch of different parameter combinations to ensure robustness
def run_ee(v, vv, out):
    for spec_sup in [0, 250]:
        for ee_cut in [0, 0.1, 0.2, 0.3, 0.4, 0.5]:
            for rem_rep in [0, 1]:
                vk = v[(v["SpecSup447"] > spec_sup) & ((v["EE_Allele1"] > ee_cut) | (v["EE_Allele2"] > ee_cut))]
                vvk = vv[(vv["SpecSup447"] > spec_sup) & ((vv["EE_Allele1"] > ee_cut) | (vv["EE_Allele2"] > ee_cut))]
                suffix = "NoChange"
                if rem_rep:
                    vk, vvk = remove_pseudos(vk, vvk)
                    vk, vvk = remove_repeats(vk, vvk)
                    suffix = "NoRepeatsNoPseudos"
                for cuttt in [0.6, 0.7, 0.8, 0.9, 0.95, 0.99]:

                    mean_f = np.mean(vk["Fixed EE_Dif"])
                    z_f = np.mean(vk["Fixed EE_Dif"])/np.std(vk["Fixed EE_Dif"])
                    
                    
                    up_f = vk[vk["Fixed EE_Dif"] > 0.1].shape[0]
                    down_f = vk[vk["Fixed EE_Dif"] < -0.1].shape[0]
                    try:
                        bin = binomtest(up_f, up_f + down_f)
                    except:
                        bin = binomtest(1, 2)
                    x2 = vk["Fixed EE_Dif"]
                    yvals2 = list(vvk["Fixed EE_Dif"])
                    yvals2.sort()
                    try:
                        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
                        
                        vvv = prepare_alpha(vk, vvk, stat = "Fixed EE_Dif")
                        
                        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                        table1 = alpha[2]
                        table2 = alpha[3]
                    except:
                        cutoff = "NA"
                        alpha = ["NA", "NA"]
                        table1 = [[1, 1], [1, 1]]
                        table2 = [[1, 1], [1, 1]]
                        
                    out.write("\t".join([str(iii) for iii in [suffix, str(spec_sup), str(ee_cut), "NoChange", "EE_Dif", \
                                         np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                                         mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                                         mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, up_f, down_f, bin.pvalue, mean_f, z_f, cuttt]]) + "\n")
                    
                    if spec_sup == 250:
                        
                        vk2 = vk[vk["PhyloP447"] > 1]
                        vvk2 = vvk[vvk["PhyloP447"] > 1]
                        
                        mean_f = np.mean(vk2["Fixed EE_Dif"])
                        z_f = np.mean(vk2["Fixed EE_Dif"])/np.std(vk2["Fixed EE_Dif"])
                        
                        up_f = vk2[vk2["Fixed EE_Dif"] > 0.1].shape[0]
                        down_f = vk2[vk2["Fixed EE_Dif"] < -0.1].shape[0]
                        
                        try:
                            bin = binomtest(up_f, up_f + down_f)
                        except:
                            bin = binomtest(1, 2)
                        
                        x2 = vk2["Fixed EE_Dif"]
                        yvals2 = list(vvk2["Fixed EE_Dif"])
                        yvals2.sort()
                        try:
                            cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
                            
                            vvv = prepare_alpha(vk2, vvk2, stat = "Fixed EE_Dif")
                            
                            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                            table1 = alpha[2]
                            table2 = alpha[3]
                        except:
                            cutoff = "NA"
                            alpha = ["NA", "NA"]
                            table1 = [[1, 1], [1, 1]]
                            table2 = [[1, 1], [1, 1]]
                        out.write("\t".join([str(iii) for iii in [suffix, str(spec_sup), str(ee_cut), "PhyloPG1", "EE_Dif", \
                                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, up_f, down_f, bin.pvalue, mean_f, z_f, cuttt]]) + "\n")
                        

run_ee(v, vv, out)                
