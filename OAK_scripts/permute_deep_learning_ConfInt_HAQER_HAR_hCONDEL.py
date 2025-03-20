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
from math import floor

def shuffle_fp(vvv):
    shuffle = vvv.copy()
    shuffled = list(shuffle["FixedOrPoly"].sample(frac = 1, replace = False))
    shuffle["FixedOrPoly"] = shuffled
    return shuffle

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

dl_prefix = sys.argv[1]
region_type = sys.argv[2]
metric = " ".join(sys.argv[3].split("_"))
print(dl_prefix)
dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"

if metric == "abs logfc":
    spec_sup = 0
    metric_name = "Absolute log fold-change"
elif metric == "jsd":
    spec_sup = 0
    metric_name = "JSD"
else:
    spec_sup = 250
    metric_name = metric
v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = spec_sup)

#Trying it with the deep learning predictions
dl_fixed = pd.read_csv(dl_path + dl_prefix + "_HumanDerived.txt", sep = "\t")
dl_fixed = dl_fixed.set_index("variant_id")
dl_fixed = dl_fixed[["logfc", "allele1_pred_counts", "allele2_pred_counts", "jsd"]]
dl_fixed = dl_fixed[dl_fixed["logfc"] != "logfc"]
dl_fixed["abs logfc"] = np.abs(dl_fixed["logfc"].astype(float))
dl_fixed["jsd"] = dl_fixed["jsd"].astype(float)
v.index = v["Position"]

dl_poly = pd.read_csv(dl_path + dl_prefix + "_Polymorphic.txt", sep = "\t")
dl_poly = dl_poly.set_index("variant_id")
dl_poly = dl_poly[["logfc", "allele1_pred_counts", "allele2_pred_counts", "jsd"]]
dl_poly = dl_poly[dl_poly["logfc"] != "logfc"]
dl_poly["abs logfc"] = np.abs(dl_poly["logfc"].astype(float))
dl_poly["jsd"] = dl_poly["jsd"].astype(float)
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

yvalls_ref = yvalls[yvalls["Human ref"] == yvalls["Chimp ref"]]
yvalls_alt = yvalls[yvalls["Human alt"] == yvalls["Chimp ref"]]
yvalls_ref["fixed logfc"] = -yvalls_ref["logfc"].astype(float)
yvalls_alt["fixed logfc"] = yvalls_alt["logfc"].astype(float)
yvalls = pd.concat([yvalls_ref, yvalls_alt])

v.index = v["Position"]
#v_cnep = pd.read_csv("HumChp_NC_Final_Rmdup_CREs_NoHLA_CNEP_CSS-CNEP.txt", sep = "\t").set_index("Position")
#v = v.join(v_cnep)
#v = v[~((v["CNEP"].isin(["."])) | (v["CSS-CNEP"].isin(["."])))]
#v["CNEP"] = v["CNEP"].astype(float)
#v["CSS-CNEP"] = v["CSS-CNEP"].astype(float)
#v_cnep = 0

yvalls.index = yvalls["Position"]
#yvalls_cnep = pd.read_csv("HumPoly_NC_Final_CREs_NoHLA_CNEP_CSS-CNEP.txt", sep = "\t").set_index("Position")
#yvalls = yvalls.join(yvalls_cnep)
#yvalls = yvalls[~((yvalls["CNEP"].isin(["."])) | (yvalls["CSS-CNEP"].isin(["."])))]
#yvalls["CNEP"] = yvalls["CNEP"].astype(float)
#yvalls["CSS-CNEP"] = yvalls["CSS-CNEP"].astype(float)
#yvalls_cnep = 0

print(v.shape[0], yvalls.shape[0])

dl_fixed = dl_fixed[(dl_fixed["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_fixed["allele2_pred_counts"].astype(float) > cutoff_to_use)]
dl_poly = dl_poly[(dl_poly["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_poly["allele2_pred_counts"].astype(float) > cutoff_to_use)]

if region_type + "s_Results_Permute" not in os.listdir():
    os.mkdir(region_type + "s_Results_Permute")

out = open(region_type + "s_Results_Permute/" + region_type + "s_" + metric.replace(" ", "") + "_FilterNewTEs_" + dl_prefix + ".txt", 'w')
out.write("Distance_bin\tMetric\tMetric\tMedian fixed metric\tNumber fixed variants\tMedian polymorphic metric\tNumber polymorphic variants\tFisher exact p-value\tMWU p-value\tFisher exact p-value; alt greater\tMWU p-value; alt greater\talpha\tCutoff\t[[dc1, du1], [pc1, pu1]]\t[[dc2, du2], [pc2, pu2]]\tProportion\tTop_20th\tLFC_Cutoff\tIteration\tTypeOfSampling\n")

if region_type == "HAQER":
    region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HAQERs.bed", sep = "\t", header = None)
    region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HAQERs.bed", sep = "\t", header = None)
    location = "InHAQERs"
elif region_type == "HAR":
    region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HARs.bed", sep = "\t", header = None)
    region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HARs.bed", sep = "\t", header = None)
    location = "InHARs"
elif region_type == "hCONDEL":
    region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_hCONDELs_1kbWindow.bed", sep = "\t", header = None)
    region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_hCONDELs_1kbWindow.bed", sep = "\t", header = None)
    location = "hCONDEL_1kb_Window"

v_region = v[v["Position"].isin(region_fixed[0] + ":" + region_fixed[2].astype(str))].copy()
v_region["fixed logfc"] = v_region["logfc"].astype(float)
yvalls_region = yvalls[yvalls["Position"].isin(region_poly[0] + ":" + region_poly[2].astype(str))].copy()

v_region2 = v_region[v_region["Position"].isin(dl_fixed.index)].copy()
yvalls_region2 = yvalls_region[yvalls_region["Position"].isin(dl_poly.index)].copy()

def run_perm_boot(i, location, metric_name):
    np.random.seed(i)
    v_region_samp = v_region.sample(frac = 1, replace = True).copy()
    yvalls_region_samp = yvalls_region.sample(frac = 1, replace = True).copy()
    
    vvv = prepare_alpha(v_region_samp, yvalls_region_samp, stat = metric)
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_region_samp.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "All", "NoLFCutoff", str(i), "Bootstrap"]]) + "\n")

    v_test = v_region_samp[v_region_samp["logfc"].astype(float) < 0].copy()
    yvalls_test = yvalls_region_samp[yvalls_region_samp["fixed logfc"].astype(float) < 0].copy()
    vvv = prepare_alpha(v_test, yvalls_test, stat = metric)
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "All", "LessThan0", str(i), "Bootstrap"]]) + "\n")
    
    v_test = v_region_samp[v_region_samp["logfc"].astype(float) > 0].copy()
    yvalls_test = yvalls_region_samp[yvalls_region_samp["fixed logfc"].astype(float) > 0].copy()
    vvv = prepare_alpha(v_test, yvalls_test, stat = metric)
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "All", "GreaterThan0", str(i), "Bootstrap"]]) + "\n")
    
    v_region_samp = v_region2.sample(frac = 1, replace = True)
    yvalls_region_samp = yvalls_region2.sample(frac = 1, replace = True)
    vvv = prepare_alpha(v_region_samp, yvalls_region_samp, stat = metric)
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_region_samp.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "Top20th", "NoLFCutoff", str(i), "Bootstrap"]]) + "\n")
    
    v_test = v_region_samp[v_region_samp["logfc"].astype(float) < 0].copy()
    yvalls_test = yvalls_region_samp[yvalls_region_samp["fixed logfc"].astype(float) < 0].copy()
    vvv = prepare_alpha(v_test, yvalls_test, stat = metric)
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "Top20th", "LessThan0", str(i), "Bootstrap"]]) + "\n")
        #print("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "Top20th", "LessThan0", str(i), "Bootstrap"]]) + "\n")

    v_test = v_region_samp[v_region_samp["logfc"].astype(float) > 0].copy()
    yvalls_test = yvalls_region_samp[yvalls_region_samp["fixed logfc"].astype(float) > 0].copy()
    vvv = prepare_alpha(v_test, yvalls_test, stat = metric)
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "Top20th", "GreaterThan0", str(i), "Bootstrap"]]) + "\n")
        #print("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "Top20th", "GreaterThan0", str(i), "Bootstrap"]]) + "\n")

def run_real(location, metric_name):
    #Run it on all sites using abs logfc
    #Not enough data to run it on > 0.1 and < -0.1, so we will run it on > 0 and < 0
    vvv = prepare_alpha(v_region, yvalls_region, stat = metric)
    vvv_all_stable = vvv.copy()
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_region.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "All", "NoLFCutoff", "Real", "Real"]]) + "\n")
        print("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "All", "NoLFCutoff", "Real", "Real"]]) + "\n")

    v_test = v_region[v_region["logfc"].astype(float) < 0].copy()
    yvalls_test = yvalls_region[yvalls_region["fixed logfc"].astype(float) < 0].copy()
    vvv = prepare_alpha(v_test, yvalls_test, stat = metric)
    vvv_all_L0_stable = vvv.copy()
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "All", "LessThan0", "Real", "Real"]]) + "\n")
        print("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "All", "LessThan0", "Real", "Real"]]) + "\n")

    v_test = v_region[v_region["logfc"].astype(float) > 0].copy()
    yvalls_test = yvalls_region[yvalls_region["fixed logfc"].astype(float) > 0].copy()
    vvv = prepare_alpha(v_region[v_region["logfc"].astype(float) > 0], yvalls_region[yvalls_region["fixed logfc"].astype(float) > 0], stat = metric)
    vvv_all_G0_stable = vvv.copy()
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "All", "GreaterThan0", "Real", "Real"]]) + "\n")
        print("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "All", "GreaterThan0", "Real", "Real"]]) + "\n")

    #Rerunning for Top20th
    vvv = prepare_alpha(v_region2, yvalls_region2, stat = metric)
    vvv_top20th_stable = vvv.copy()
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_region2.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "Top20th", "NoLFCutoff", "Real", "Real"]]) + "\n")
    
    v_test = v_region2[v_region2["logfc"].astype(float) < 0].copy()
    yvalls_test = yvalls_region2[yvalls_region2["fixed logfc"].astype(float) < 0].copy()
    vvv = prepare_alpha(v_test, yvalls_test, stat = metric)
    vvv_top20th_L0_stable = vvv.copy()
    
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "Top20th", "LessThan0", "Real", "Real"]]) + "\n")
    
    v_test = v_region2[v_region2["logfc"].astype(float) > 0].copy()
    yvalls_test = yvalls_region2[yvalls_region2["fixed logfc"].astype(float) > 0].copy()
    vvv = prepare_alpha(v_test, yvalls_test, stat = metric)
    vvv_top20th_G0_stable = vvv.copy()
    
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([str(x) for x in [location, metric_name, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(fixed_stat, poly_stat)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(fixed_stat, poly_stat, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "Top20th", "GreaterThan0", "Real", "Real"]]) + "\n")

    return vvv_all_stable, vvv_all_L0_stable, vvv_all_G0_stable, vvv_top20th_stable, vvv_top20th_L0_stable, vvv_top20th_G0_stable

vvv_all_stable, vvv_all_L0_stable, vvv_all_G0_stable, vvv_top20th_stable, vvv_top20th_L0_stable, vvv_top20th_G0_stable = run_real(location, metric_name)

for i in range(10000):
    run_perm_boot(i, location, metric_name)

if region_type == "HAQER":
    region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HAQERs_5kbWindow_NoGap.bed", sep = "\t", header = None)
    region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HAQERs_5kbWindow_NoGap.bed", sep = "\t", header = None)
    location = "5kbWindow_NoGap"
elif region_type == "HAR":
    region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HARs_5kbWindow_NoGap.bed", sep = "\t", header = None)
    region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HARs_5kbWindow_NoGap.bed", sep = "\t", header = None)
    location = "5kbWindow_NoGap"
elif region_type == "hCONDEL":
    region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_hCONDELs_5kbWindow.bed", sep = "\t", header = None)
    region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_hCONDELs_5kbWindow.bed", sep = "\t", header = None)
    location = "hCONDEL_5kb_Window"

v_region = v[v["Position"].isin(region_fixed[0] + ":" + region_fixed[2].astype(str))].copy()
v_region["fixed logfc"] = v_region["logfc"].astype(float)
yvalls_region = yvalls[yvalls["Position"].isin(region_poly[0] + ":" + region_poly[2].astype(str))].copy()

v_region2 = v_region[v_region["Position"].isin(dl_fixed.index)].copy()
yvalls_region2 = yvalls_region[yvalls_region["Position"].isin(dl_poly.index)].copy()

#Run it on all sites using abs logfc
#Not enough data to run it on > 0.1 and < -0.1, so we will run it on > 0 and < 0
vvv_all_stable, vvv_all_L0_stable, vvv_all_G0_stable, vvv_top20th_stable, vvv_top20th_L0_stable, vvv_top20th_G0_stable = run_real(location, metric_name)

for i in range(10000):
    run_perm_boot(i, location, metric_name)

if region_type == "HAQER" or region_type == "HAR":

    if region_type == "HAQER":
        region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HAQERs_5kbWindow_5kbGap.bed", sep = "\t", header = None)
        region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HAQERs_5kbWindow_5kbGap.bed", sep = "\t", header = None)
        location = "5kbWindow_5kbGap"
    elif region_type == "HAR":
        region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HARs_5kbWindow_5kbGap.bed", sep = "\t", header = None)
        region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HARs_5kbWindow_5kbGap.bed", sep = "\t", header = None)
        location = "5kbWindow_5kbGap"
    
    v_region = v[v["Position"].isin(region_fixed[0] + ":" + region_fixed[2].astype(str))].copy()
    v_region["fixed logfc"] = v_region["logfc"].astype(float)
    yvalls_region = yvalls[yvalls["Position"].isin(region_poly[0] + ":" + region_poly[2].astype(str))].copy()
    
    v_region2 = v_region[v_region["Position"].isin(dl_fixed.index)].copy()
    yvalls_region2 = yvalls_region[yvalls_region["Position"].isin(dl_poly.index)].copy()
    
    #Run it on all sites using abs logfc
    #Not enough data to run it on > 0.1 and < -0.1, so we will run it on > 0 and < 0
    vvv_all_stable, vvv_all_L0_stable, vvv_all_G0_stable, vvv_top20th_stable, vvv_top20th_L0_stable, vvv_top20th_G0_stable = run_real(location, metric_name)

    for i in range(10000):
        run_perm_boot(i, location, metric_name)

if region_type == "HAQER" or region_type == "HAR":
    if region_type == "HAQER":
        region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HAQERs_5kbWindow_NoGap.bed", sep = "\t", header = None)
        region_fixed = pd.concat([region_fixed, pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HAQERs.bed", sep = "\t", header = None)])
        region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HAQERs_5kbWindow_NoGap.bed", sep = "\t", header = None)
        region_poly = pd.concat([region_poly, pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HAQERs.bed", sep = "\t", header = None)])
        location = "5kbWindow_Plus_Region"
    elif region_type == "HAR":
        region_fixed = pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HARs_5kbWindow_NoGap.bed", sep = "\t", header = None)
        region_fixed = pd.concat([region_fixed, pd.read_csv("hCONDELs_HAQERs_HARs/HumChp_NC_Final_Rmdup_CREs_NoHLA_HARs.bed", sep = "\t", header = None)])
        region_poly = pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HARs_5kbWindow_NoGap.bed", sep = "\t", header = None)
        region_poly = pd.concat([region_poly, pd.read_csv("hCONDELs_HAQERs_HARs/HumPoly_NC_Final_CREs_NoHLA_HARs.bed", sep = "\t", header = None)])
        location = "5kbWindow_Plus_Region"

    v_region = v[v["Position"].isin(region_fixed[0] + ":" + region_fixed[2].astype(str))].copy()
    v_region["fixed logfc"] = v_region["logfc"].astype(float)
    yvalls_region = yvalls[yvalls["Position"].isin(region_poly[0] + ":" + region_poly[2].astype(str))].copy()
    
    v_region2 = v_region[v_region["Position"].isin(dl_fixed.index)].copy()
    yvalls_region2 = yvalls_region[yvalls_region["Position"].isin(dl_poly.index)].copy()
    
    #Run it on all sites using abs logfc
    #Not enough data to run it on > 0.1 and < -0.1, so we will run it on > 0 and < 0
    vvv_all_stable, vvv_all_L0_stable, vvv_all_G0_stable, vvv_top20th_stable, vvv_top20th_L0_stable, vvv_top20th_G0_stable = run_real(location, metric_name)
   
    for i in range(10000):
        run_perm_boot(i, location, metric_name)

out.close()
