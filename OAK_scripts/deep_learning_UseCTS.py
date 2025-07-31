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

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

dl_prefix = sys.argv[1]
tau  = int(sys.argv[2])
group = int(sys.argv[3])
spec_sup = int(sys.argv[4])
to_strat = sys.argv[5].replace("_", " ")
dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"

if tau:
    cts_metric = "Tau"
else:
    cts_metric = "EE"

if to_strat == "abs logfc":
    cutoff_name = "LFC_Cutoff"
elif to_strat == "PhyloP447":
    cutoff_name = "PhyloP_Cutoff"


if dl_prefix not in os.listdir("UseCTS_Results_New"):
    os.mkdir("UseCTS_Results_New/" + dl_prefix)
out = open("UseCTS_Results_New/" + dl_prefix + "/UseCTS_FilterNewTEs_" + cts_metric + "_" + "Group" + str(group) + "_" + "SpecSup" + str(spec_sup) + "_" + to_strat.replace(" ", "_") + "_" + dl_prefix + ".txt", 'w')
out.write(cutoff_name + "\tMetric\tCutNum\tMedian fixed metric\tNumber fixed variants\tMedian polymorphic metric\tNumber polymorphic variants\tFisher exact p-value\tMWU p-value\tFisher exact p-value; alt greater\tMWU p-value; alt greater\talpha\tCutoff\t[[dc1, du1], [pc1, pu1]]\t[[dc2, du2], [pc2, pu2]]\tProportion\tTop_20th\tIteration\tTypeOfSampling\n")


v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = spec_sup)

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

#Read in correct cell type-specificity metric
if tau:
    cts_metric = "Tau"
    if group == 1:
        cts_fixed = pd.read_csv(dl_path + "Taus_HumanDerived_Group1_WithNeuron.txt", sep = "\t").set_index("Position")
        
        cts_poly = pd.read_csv(dl_path + "Taus_Polymorphic_Group1_WithNeuron.txt", sep = "\t").set_index("Position")
    elif group == 2:
        cts_fixed = pd.read_csv(dl_path + "Taus_HumanDerived_Group2_WithNeuron.txt", sep = "\t").set_index("Position")
        cts_poly = pd.read_csv(dl_path + "Taus_Polymorphic_Group2_WithNeuron.txt", sep = "\t").set_index("Position")
    cts_fixed["Mean_CTS"] = np.mean(cts_fixed[["Tau_Allele1", "Tau_Allele2"]], axis = 1)
    cts_poly["Mean_CTS"] = np.mean(cts_poly[["Tau_Allele1", "Tau_Allele2"]], axis = 1)
    cts_fixed = cts_fixed[["Mean_CTS", "Tau_abs_logfc"]]
    cts_fixed.columns = ["Mean_CTS", "Mean_CTS_Effect"]
    cts_poly = cts_poly[["Mean_CTS", "Tau_abs_logfc"]]
    cts_poly.columns = ["Mean_CTS", "Mean_CTS_Effect"]
else:
    cts_metric = "EE"
    cts_fixed = pd.read_csv(dl_path + dl_prefix + "_EEs_HumanDerived_WithNeuron.txt", sep = "\t").set_index("Position")
    cts_poly = pd.read_csv(dl_path + dl_prefix + "_EEs_Polymorphic_WithNeuron.txt", sep = "\t").set_index("Position")
    cts_fixed["Mean_CTS"] = np.mean(cts_fixed[["EE_Allele1", "EE_Allele2"]], axis = 1)
    cts_poly["Mean_CTS"] = np.mean(cts_poly[["EE_Allele1", "EE_Allele2"]], axis = 1)
    cts_fixed = cts_fixed[["Mean_CTS", "EE_abs_logfc"]]
    cts_fixed.columns = ["Mean_CTS", "Mean_CTS_Effect"]
    cts_poly = cts_poly[["Mean_CTS", "EE_abs_logfc"]]
    cts_poly.columns = ["Mean_CTS", "Mean_CTS_Effect"]
print(dl_prefix)


v = v.join(cts_fixed).dropna().drop_duplicates("Position")
yvalls = yvalls.join(cts_poly).dropna().drop_duplicates("Position")
print(v)
print(yvalls)
yvalls = add_unfold(yvalls)

yvalls_ref = yvalls[yvalls["Human ref"] == yvalls["Chimp ref"]]
yvalls_alt = yvalls[yvalls["Human alt"] == yvalls["Chimp ref"]]
yvalls_ref["fixed logfc"] = -yvalls_ref["logfc"].astype(float)
yvalls_alt["fixed logfc"] = yvalls_alt["logfc"].astype(float)
yvalls = pd.concat([yvalls_ref, yvalls_alt])


v.index = v["Position"]

yvalls.index = yvalls["Position"]

print(v.shape[0], yvalls.shape[0])

dl_fixed = dl_fixed[(dl_fixed["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_fixed["allele2_pred_counts"].astype(float) > cutoff_to_use)]
dl_poly = dl_poly[(dl_poly["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_poly["allele2_pred_counts"].astype(float) > cutoff_to_use)]

cutoffs_num = [1000000]
print(v.shape[0], yvalls.shape[0])

v["logfc"] = v["logfc"].astype(float)
v["abs logfc"] = v["abs logfc"].astype(float)

yvalls["logfc"] = yvalls["logfc"].astype(float)
yvalls["fixed logfc"] = yvalls["fixed logfc"].astype(float)
yvalls["abs logfc"] = yvalls["abs logfc"].astype(float)

#Restrict to only PhyloP447 > 0
if to_strat == "PhyloP447":
    v = v[v[to_strat] >= 0]
    yvalls = yvalls[yvalls[to_strat] >= 0]
    
    #Restrict to top 1000000 effect sizes for PhyloP 
    v_cut1 = v[["abs logfc"]]
    vv_cut1 = yvalls[["abs logfc"]]
    vvv_cut1 = pd.concat([v_cut1, vv_cut1])
    lll1 = list(vvv_cut1.sort_values("abs logfc", ascending = False)["abs logfc"])
    cut11 = lll1[cutoffs_num[1]]
    v = v[v["abs logfc"] >= cut11]
    yvalls = yvalls[yvalls["abs logfc"] >= cut11]

print(v.shape[0], yvalls.shape[0])

if to_strat == "PhyloP447":
    cutoffs_num = [200000]

v_cut = v[[to_strat]]
vv_cut = yvalls[[to_strat]]
vvv_cut = pd.concat([v_cut, vv_cut])
lll = list(vvv_cut.sort_values(to_strat, ascending = False)[to_strat])
cut1 = lll[cutoffs_num[0]]


cutoffs = [cut1]
print(cutoffs)

#Determine numbers to downsample to
v_sizes = []
yvalls_sizes = []
v_sizes_20 = []
yvalls_sizes_20 = []
for i in range(len(cutoffs) + 1):
    if i == 0:
        v_test = v[v[to_strat].astype(float) < cutoffs[i]]
        yvalls_test = yvalls[yvalls[to_strat].astype(float) < cutoffs[i]]
        cut = "< " + str(cutoffs[i])
    #Switch back to 4 if uncomment above
    elif i == 1:
        v_test = v[v[to_strat].astype(float) > cutoffs[i-1]]
        yvalls_test = yvalls[yvalls[to_strat].astype(float) > cutoffs[i-1]]
        cut = "> " + str(cutoffs[i-1])
    else:
        v_test = v[(v[to_strat].astype(float) > cutoffs[i - 1]) & (v[to_strat].astype(float) <= cutoffs[i])]
        yvalls_test = yvalls[(yvalls[to_strat].astype(float) > cutoffs[i - 1]) & (yvalls[to_strat].astype(float) <= cutoffs[i])]
    v_test2 = v_test[v_test["Position"].isin(dl_fixed.index)]
    yvalls_test2 = yvalls_test[yvalls_test["Position"].isin(dl_poly.index)]
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
        v_test = v[v[to_strat].astype(float) < cutoffs[i]]
        yvalls_test = yvalls[yvalls[to_strat].astype(float) < cutoffs[i]]
        cut = "< " + str(cutoffs[i])
    #Switch back to 4 if uncomment above
    elif i == 1:
        v_test = v[v[to_strat].astype(float) > cutoffs[i-1]]
        yvalls_test = yvalls[yvalls[to_strat].astype(float) > cutoffs[i-1]]
        cut = "> " + str(cutoffs[i-1])
    else:
        v_test = v[(v[to_strat].astype(float) > cutoffs[i-1]) & (v[to_strat].astype(float) <= cutoffs[i])]
        yvalls_test = yvalls[(yvalls[to_strat].astype(float) > cutoffs[i-1]) & (yvalls[to_strat].astype(float) <= cutoffs[i])]
        cut = str(cutoffs[i-1]) + "-" + str(cutoffs[i])
    vvv = prepare_alpha(v_test.copy(), yvalls_test.copy(), stat = "Mean_CTS_Effect")
    metric = "Mean_CTS_Effect"
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    vvv_all_stable_phylop = vvv.copy()
    
    if i == 0:
        cut_num = "Rest"
    elif i == 1:
        cut_num = str(cutoffs_num[0])
    else:
        cut_num = "Rest"
        
    #Run for cell type-specificity of effect
    for cuttt in [0.3, 0.6, 0.8]:
        
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([cut, "Mean_CTS_Effect", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", "Real", "Real"]) + "\n")
        print("\t".join([cut, "Mean_CTS_Effect", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", "Real", "Real"]) + "\n")

    v_test2 = v_test[v_test["Position"].isin(dl_fixed.index)]
    yvalls_test2 = yvalls_test[yvalls_test["Position"].isin(dl_poly.index)]
    
    #Do the same thing with the top 20th percentile most accessible sites, not used
    vvv = prepare_alpha(v_test2.copy(), yvalls_test2.copy(), stat = "Mean_CTS_Effect")
    metric = "Mean_CTS_Effect"
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    vvv_top20th_stable_phylop = vvv.copy()
    for cuttt in [0.3, 0.6, 0.8]:
        
        x = list(yvalls_test2.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([cut, "Mean_CTS_Effect", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", "Real", "Real"]) + "\n")
        #print("\t".join([cut, "Mean_CTS_Effect", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", "Real", "Real"]) + "\n")

    #Repeat the above for abs logfc using the same cutoff
    vvv = prepare_alpha(v_test.copy(), yvalls_test.copy(), stat = "abs logfc")
    metric = "abs logfc"
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    vvv_all_stable_phylop = vvv.copy()
    for cuttt in [0.3, 0.6, 0.8]:
        x = list(yvalls_test.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", "Real", "Real"]) + "\n")
        print("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", "Real", "Real"]) + "\n")

    v_test2 = v_test[v_test["Position"].isin(dl_fixed.index)]
    yvalls_test2 = yvalls_test[yvalls_test["Position"].isin(dl_poly.index)]
    
    vvv = prepare_alpha(v_test2.copy(), yvalls_test2.copy(), stat = "abs logfc")
    metric = "abs logfc"
    fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
    poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
    vvv_top20th_stable_phylop = vvv.copy()
    for cuttt in [0.3, 0.6, 0.8]:
        
        x = list(yvalls_test2.sort_values(metric)[metric])
        cutoff = x[int(floor((len(x)*cuttt)))]
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out.write("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", "Real", "Real"]) + "\n")
        #print("\t".join([cut, "Mean_CTS_Effect", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", "Real", "Real"]) + "\n")
    
    #Repeat the above but bootstrapping 1000 times
    for iteration in range(1000):
        
        #Do bootstrapping to get our confidence interval
        np.random.seed(iteration)
        v_run = v_test.sample(n = v_size, replace = True)
        yvalls_run = yvalls_test.sample(n = yvalls_size, replace = True)
        
        v_run2 = v_test2.sample(n = v_size_20, replace = True)
        yvalls_run2 = yvalls_test2.sample(n = yvalls_size_20, replace = True)
        
        vvv = prepare_alpha(v_run.copy(), yvalls_run.copy(), stat = "Mean_CTS_Effect")
        metric = "Mean_CTS_Effect"
        fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        for cuttt in [0.3, 0.6, 0.8]:
            
            x = list(yvalls_run.sort_values(metric)[metric])
            cutoff = x[int(floor((len(x)*cuttt)))]
            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out.write("\t".join([cut, "Mean_CTS_Effect", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", str(iteration), "Bootstrap"]) + "\n")
            #print("\t".join([cut, "Mean_CTS_Effect", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", str(iteration), "Bootstrap"]) + "\n")

        #Repeat the above for only variants in the top 20% most accessible set
        vvv = prepare_alpha(v_run2.copy(), yvalls_run2.copy(), stat = "Mean_CTS_Effect")
        metric = "Mean_CTS_Effect"
        fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        for cuttt in [0.3, 0.6, 0.8]:
            
            x = list(yvalls_run2.sort_values(metric)[metric])
            cutoff = x[int(floor((len(x)*cuttt)))]
            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out.write("\t".join([cut, "Mean_CTS_Effect", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", str(iteration), "Bootstrap"]) + "\n")
        
        vvv = prepare_alpha(v_run.copy(), yvalls_run.copy(), stat = "abs logfc")
        metric = "abs logfc"
        fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        for cuttt in [0.3, 0.6, 0.8]:
            
            x = list(yvalls_run.sort_values(metric)[metric])
            cutoff = x[int(floor((len(x)*cuttt)))]
            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out.write("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", str(iteration), "Bootstrap"]) + "\n")
            #print("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", str(iteration), "Bootstrap"]) + "\n")

        #Repeat the above for only variants in the top 20% most accessible set
        vvv = prepare_alpha(v_run2.copy(), yvalls_run2.copy(), stat = "abs logfc")
        metric = "abs logfc"
        fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        for cuttt in [0.3, 0.6, 0.8]:
            
            x = list(yvalls_run2.sort_values(metric)[metric])
            cutoff = x[int(floor((len(x)*cuttt)))]
            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out.write("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", str(iteration), "Bootstrap"]) + "\n")

out.close()
