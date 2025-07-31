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
chpreffed = int(sys.argv[4])

#Argument not used
permute = int(sys.argv[5])

if permute:
    print("Running 100 permutations")

#If it is the neuron swapped files, we need to swap the groups
if swap_neur and dl_prefix == "ITL23":
    group = 1

if swap_neur and dl_prefix == "LiangSteinNeuron":
    group = 2

if chpreffed:
    suff = "_Chpreffed"
else:
    suff = ""

dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"
print(dl_prefix, group, swap_neur)

v, vv = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 0)


#Trying it with the deep learning predictions
dl_fixed = pd.read_csv(dl_path + dl_prefix + "_HumanDerived" + suff + ".txt", sep = "\t")
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

v = v.join(dl_fixed).dropna()
v = v.drop_duplicates("Position")

vv = vv.join(dl_poly).dropna()
vv = vv.drop_duplicates("Position")

print(v.shape[0])

cts_metric = "EE"

#Trying with SwapNeur
if swap_neur:
    cts_fixed = pd.read_csv(dl_path + dl_prefix + "_EEs_HumanDerived" + suff + "SwapNeur.txt", sep = "\t").set_index("Position")
#Original files
else:
    cts_fixed = pd.read_csv(dl_path + dl_prefix + "_EEs_HumanDerived" + suff + "_WithNeuron.txt", sep = "\t").set_index("Position")
    cts_poly = pd.read_csv(dl_path + dl_prefix + "_EEs_Polymorphic_WithNeuron.txt", sep = "\t").set_index("Position")

cts_fixed = cts_fixed[["EE_Allele1", "EE_Allele2"]]
cts_poly = cts_poly[["EE_Allele1", "EE_Allele2"]]

vv = vv.join(cts_poly).dropna().drop_duplicates("Position")
vv = add_unfold(vv)

vv_ref = vv[vv["Human ref"] == vv["Chimp ref"]]
vv_alt = vv[vv["Human alt"] == vv["Chimp ref"]]
vv_ref["fixed logfc"] = -vv_ref["logfc"].astype(float)
vv_alt["fixed logfc"] = vv_alt["logfc"].astype(float)
vv = pd.concat([vv_ref, vv_alt])

v = v.join(cts_fixed).dropna().drop_duplicates("Position")

print(v.shape[0])

v.index = v["Position"]

v["EE_Allele1"] = v["EE_Allele1"].astype(float)
v["EE_Allele2"] = v["EE_Allele2"].astype(float)

vv.index = vv["Position"]

vv["EE_Allele1"] = vv["EE_Allele1"].astype(float)
vv["EE_Allele2"] = vv["EE_Allele2"].astype(float)

#Need to switch sign here to keep ancestral and derived log fold-change sign consistent
if chpreffed:
    v["EE_Dif"] = v["EE_Allele2"] - v["EE_Allele1"]
    vv = vv[vv["fixed logfc"] != vv["logfc"]]
    vv["EE_Dif"] = vv["EE_Allele2"] - vv["EE_Allele1"]
else:
    v["EE_Dif"] = v["EE_Allele1"] - v["EE_Allele2"]
    vv = vv[vv["fixed logfc"] == vv["logfc"]]
    vv["EE_Dif"] = vv["EE_Allele1"] - vv["EE_Allele2"]

#Need to switch sign here to keep ancestral and derived log fold-change sign consistent
if chpreffed:
    v["logfc"] = -v["logfc"].astype(float)
else:
    v["logfc"] = v["logfc"].astype(float)
v["abs logfc"] = v["abs logfc"].astype(float)

v["Chrom"] = [x.split(":")[0] for x in v["Position"]]
v["Pos"] = [int(x.split(":")[1]) for x in v["Position"]]

startSpecSup = 0
ee_cutoff = 0.025
pos_cut = ee_cutoff
neg_cut = -ee_cutoff
v = v[v["SpecSup447"] > startSpecSup]

prop_up = vv[vv["EE_Dif"] >= pos_cut].shape[0]/vv.shape[0]
prop_down = vv[vv["EE_Dif"] <= neg_cut].shape[0]/vv.shape[0]

print(prop_up, prop_down)

print(ee_cutoff, -ee_cutoff)


v_bl = v[v["EE_Dif"] <= neg_cut]
v_bg = v[v["EE_Dif"] >= pos_cut]

print(v_bl.shape[0], v_bg.shape[0])

#Find hRAGs and hRALs as described in the methods
done = 0
out = []
for chrom in ["chrX"] + ['chr' + str(i) for i in range(1, 23)]:
    vc = v[v["Chrom"].isin([chrom])]
    v_bgc = v_bg[v_bg["Chrom"].isin([chrom])]
    
    for index, row in v_bgc.iterrows():
        window = list(range(row["Pos"]-500, row["Pos"]+500))
        vk = vc[vc["Pos"].isin(window)]
        num_up = vk[vk["EE_Dif"] >= pos_cut].shape[0]
        num_down = vk[vk["EE_Dif"] <= neg_cut].shape[0]
        if num_up >= 1:
            out.append([row["Position"], row["NearestGene"], num_up, ";".join(list(vk[vk["EE_Dif"] >= pos_cut]["Position"])), np.sum(vk["EE_Dif"]), vk.shape[0], binomtest(num_up, vk.shape[0], p = prop_up).pvalue, num_down])
            #print([row["Position"], row["NearestGene"], num_up, ";".join(list(vk[vk["EE_Dif"] >= pos_cut]["Position"])), np.sum(vk["EE_Dif"]), vk.shape[0], binomtest(num_up, vk.shape[0], p = prop_up).pvalue])
        done += 1
        if done % 1000 == 0:
            print(done)
df = pd.DataFrame(out)
df.columns = ["Position", "NearestGene", "NumUp", "Positions", "Summed EE_Dif", "TotalSites", "BinomPvalue", "NumDown"]
df = df.drop_duplicates("Positions")
df.to_csv("RHCTAGs/" + dl_prefix + "_RHCTAGs" + suff + "_AddSumLFC.txt", sep = "\t", index = False)

out = []
done = 0
for chrom in ["chrX"] + ['chr' + str(i) for i in range(1, 23)]:
    vc = v[v["Chrom"].isin([chrom])]
    v_blc = v_bl[v_bl["Chrom"].isin([chrom])]
    
    for index, row in v_blc.iterrows():
        window = list(range(row["Pos"]-500, row["Pos"]+500))
        vk = vc[vc["Pos"].isin(window)]
        num_up = vk[vk["EE_Dif"] >= pos_cut].shape[0]
        num_down = vk[vk["EE_Dif"] <= neg_cut].shape[0]
        if num_down >= 1:
            out.append([row["Position"], row["NearestGene"], num_down, ";".join(list(vk[vk["EE_Dif"] <= neg_cut]["Position"])), np.sum(vk["EE_Dif"]), vk.shape[0], binomtest(num_down, vk.shape[0], p = prop_down).pvalue, num_up])
            #print([row["Position"], row["NearestGene"], num_down, ";".join(list(vk[vk["EE_Dif"] <= neg_cut]["Position"])), np.sum(vk["EE_Dif"]), vk.shape[0], binomtest(num_down, vk.shape[0], p = prop_down).pvalue])
        done += 1
        if done % 1000 == 0:
            print(done)
df = pd.DataFrame(out)
df.columns = ["Position", "NearestGene", "NumDown", "Positions", "Summed EE_Dif", "TotalSites", "BinomPvalue", "NumUp"]
df = df.drop_duplicates("Positions")
df.to_csv("RHCTAGs/" + dl_prefix + "_RHCTALs" + suff + "_AddSumLFC.txt", sep = "\t", index = False)
