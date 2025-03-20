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

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

dl_prefix = sys.argv[1]
print(dl_prefix)
dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"

def shuffle_fp(vvv):
    shuffle = vvv.copy()
    shuffled = list(shuffle["FixedOrPoly"].sample(frac = 1, replace = False))
    shuffle["FixedOrPoly"] = shuffled
    return shuffle

v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 0)

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

out = open("StratifySpecSup_Results/StratifiedBySpecSup_FilterNewTEs_" + dl_prefix + ".txt", 'w')
out.write("SpecSup447_Cutoff\tMetric\tMedian fixed absolute log fold-change\tNumber fixed variants\tMedian polymorphic absolute log fold-change\tNumber polymorphic variants\tFisher exact p-value\tMWU p-value\tFisher exact p-value; alt greater\tMWU p-value; alt greater\talpha\tCutoff\t[[dc1, du1], [pc1, pu1]]\t[[dc2, du2], [pc2, pu2]]\tProportion\tTop_20th\tIteration\tTypeOfSampling\n")
cutoffs = [19, 104, 187, 242]

#Determine numbers to downsample to
v_sizes = []
yvalls_sizes = []
v_sizes_20 = []
yvalls_sizes_20 = []
for i in range(len(cutoffs) + 1):
    if i == 0:
        v_test = v[v["SpecSup447"].astype(int) <= cutoffs[i]]
        yvalls_test = yvalls[yvalls["SpecSup447"].astype(int) <= cutoffs[i]]
    elif i == 4:
        v_test = v[v["SpecSup447"].astype(int) > cutoffs[i-1]]
        yvalls_test = yvalls[yvalls["SpecSup447"].astype(int) > cutoffs[i-1]]
    else:
        v_test = v[(v["SpecSup447"].astype(int) > cutoffs[i - 1]) & (v["SpecSup447"].astype(int) <= cutoffs[i])]
        yvalls_test = yvalls[(yvalls["SpecSup447"].astype(int) > cutoffs[i - 1]) & (yvalls["SpecSup447"].astype(int) <= cutoffs[i])]
    v_test2 = v_test[v_test["Position"].isin(dl_fixed.index)]
    yvalls_test2 = yvalls_test[yvalls_test["Position"].isin(dl_poly.index)]
    print(v_test.shape[0], yvalls_test.shape[0], v_test2.shape[0], yvalls_test2.shape[0], i)
    v_sizes.append(v_test.shape[0])
    yvalls_sizes.append(yvalls_test.shape[0])
    v_sizes_20.append(v_test2.shape[0])
    yvalls_sizes_20.append(yvalls_test2.shape[0])

v_size = min(v_sizes)
yvalls_size = min(yvalls_sizes)
v_size_20 = min(v_sizes_20)
yvalls_size_20 = min(yvalls_sizes_20)
print(v_size, yvalls_size, v_size_20, yvalls_size_20)

for i in range(len(cutoffs) + 1):
    if i == 0:
        v_test = v[v["SpecSup447"].astype(int) <= cutoffs[i]]
        yvalls_test = yvalls[yvalls["SpecSup447"].astype(int) <= cutoffs[i]]
        cut = "<= 19"
    elif i == 4:
        v_test = v[v["SpecSup447"].astype(int) > cutoffs[i-1]]
        yvalls_test = yvalls[yvalls["SpecSup447"].astype(int) > cutoffs[i-1]]
        cut = "> 242"
    else:
        v_test = v[(v["SpecSup447"].astype(int) > cutoffs[i-1]) & (v["SpecSup447"].astype(int) <= cutoffs[i])]
        yvalls_test = yvalls[(yvalls["SpecSup447"].astype(int) > cutoffs[i-1]) & (yvalls["SpecSup447"].astype(int) <= cutoffs[i])]
        cut = str(cutoffs[i-1]) + "-" + str(cutoffs[i])
        
    vvv = prepare_alpha(v_test, yvalls_test, stat = "abs logfc")
    metric = "abs logfc"
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99, 0.995]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([cut, "Absolute log fold-change", str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", "Real", "Real"]) + "\n")

    #shuffle = shuffle_fp(vvv)
    #alpha = compute_alpha_new(shuffle, plot = False, dn_cut = 0.05, window = [0, 1])
    #out.write("\t".join([cut, "Absolute log fold-change", str(alpha[0]), str(alpha[1]), str(alpha[2]), str(alpha[3]), str(alpha[4]), "All", "Real", "Permuted", str(vvv[vvv["FixedOrPoly"].isin(["Fixed"])].shape[0]), str(vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])].shape[0])]) + "\n")
    #print("\t".join([cut, "Absolute log fold-change", str(alpha[0]), str(alpha[1]), str(alpha[2]), str(alpha[3]), str(alpha[4]), "All", "Real", "Permuted", str(vvv[vvv["FixedOrPoly"].isin(["Fixed"])].shape[0]), str(vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])].shape[0])]) + "\n")
    
    
    v_test2 = v_test[v_test["Position"].isin(dl_fixed.index)]
    yvalls_test2 = yvalls_test[yvalls_test["Position"].isin(dl_poly.index)]
    
    vvv = prepare_alpha(v_test2, yvalls_test2, stat = "abs logfc")
    metric = "abs logfc"
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99, 0.995]:
        x = list(yvalls_test2.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([cut, "Absolute log fold-change", str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", "Real", "Real"]) + "\n")
        print("\t".join([cut, "Absolute log fold-change", str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", "Real", "Real"]) + "\n")

    #shuffle = shuffle_fp(vvv)
    #alpha = compute_alpha_new(shuffle, plot = False, dn_cut = 0.05, window = [0, 1])
    #out.write("\t".join([cut, "Absolute log fold-change", str(alpha[0]), str(alpha[1]), str(alpha[2]), str(alpha[3]), str(alpha[4]), "Top20th", "Real", "Permuted", str(vvv[vvv["FixedOrPoly"].isin(["Fixed"])].shape[0]), str(vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])].shape[0])]) + "\n")

    for iteration in range(1000):
        
        np.random.seed(iteration)
        v_run = v_test.sample(n = v_size, replace = True)
        yvalls_run = yvalls_test.sample(n = yvalls_size, replace = True)
        
        v_run2 = v_test2.sample(n = v_size_20, replace = True)
        yvalls_run2 = yvalls_test2.sample(n = yvalls_size_20, replace = True)
        
        vvv = prepare_alpha(v_run, yvalls_run, stat = "abs logfc")
        metric = "abs logfc"
        fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99, 0.995]:
            x = list(yvalls_run.sort_values(metric)[metric])
            cutoff = x[int(floor((len(x)*cuttt)))]
            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out.write("\t".join([cut, "Absolute log fold-change", str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", str(iteration), "Bootstrap"]) + "\n")


        #shuffle = shuffle_fp(vvv)
        #alpha = compute_alpha_new(shuffle, plot = False, dn_cut = 0.05, window = [0, 1])
        #out.write("\t".join([cut, "Absolute log fold-change", str(alpha[0]), str(alpha[1]), str(alpha[2]), str(alpha[3]), str(alpha[4]), "All", str(iteration), "Permuted", str(vvv[vvv["FixedOrPoly"].isin(["Fixed"])].shape[0]), str(vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])].shape[0])]) + "\n")

    
        vvv = prepare_alpha(v_run2, yvalls_run2, stat = "abs logfc")
        metric = "abs logfc"
        fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99, 0.995]:
            x = list(yvalls_run2.sort_values(metric)[metric])
            cutoff = x[int(floor((len(x)*cuttt)))]
            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out.write("\t".join([cut, "Absolute log fold-change", str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", str(iteration), "Bootstrap"]) + "\n")
            #print("\t".join([cut, "Absolute log fold-change", str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", str(iteration), "Bootstrap"]) + "\n")

        #shuffle = shuffle_fp(vvv)
        #alpha = compute_alpha_new(shuffle, plot = False, dn_cut = 0.05, window = [0, 1])
        #out.write("\t".join([cut, "Absolute log fold-change", str(alpha[0]), str(alpha[1]), str(alpha[2]), str(alpha[3]), str(alpha[4]), "Top20th", str(iteration), "Permuted", str(vvv[vvv["FixedOrPoly"].isin(["Fixed"])].shape[0]), str(vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])].shape[0])]) + "\n")

out.close()
