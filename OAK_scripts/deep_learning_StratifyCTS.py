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
dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"
print(dl_prefix, tau, group, spec_sup)

if tau:
    cts_metric = "Tau"
else:
    cts_metric = "EE"

if dl_prefix not in os.listdir("StratifyCTS"):
    os.mkdir("StratifyCTS/" + dl_prefix)

out = open("StratifyCTS/" + dl_prefix + "/StratifyCTS_FilterNewTEs_" + cts_metric + "_" + "Group" + str(group) + "_" + "SpecSup" + str(spec_sup) + "_" + dl_prefix + ".txt", 'w')
out.write("CTS_Cutoff\tMetric\tCutNum\tMedian fixed accessibility\tMedian fixed absolute log fold-change\tNumber fixed variants\tMedian polymorphic accessibility\tMedian polymorphic absolute log fold-change\tNumber polymorphic variants\tFisher exact p-value\tMWU p-value\tFisher exact p-value; alt greater\tMWU p-value; alt greater\talpha\tCutoff\t[[dc1, du1], [pc1, pu1]]\t[[dc2, du2], [pc2, pu2]]\tProportion\tTop_20th\tIteration\tTypeOfSampling\tEffectOrTotal\n")


def shuffle_fp(vvv):
    shuffle = vvv.copy()
    shuffled = list(shuffle["FixedOrPoly"].sample(frac = 1, replace = False))
    shuffle["FixedOrPoly"] = shuffled
    return shuffle

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

cutoffs_num = [50000, 250000, 500000, 1000000]

for stratifier in ["Mean_CTS", "Mean_CTS_Effect"]:

    v_cut = v[[stratifier]]
    vv_cut = yvalls[[stratifier]]
    vvv_cut = pd.concat([v_cut, vv_cut])
    lll = list(vvv_cut.sort_values(stratifier, ascending = True)[stratifier])
    cut1 = lll[cutoffs_num[0]]
    cut2 = lll[cutoffs_num[1]]
    cut3 = lll[cutoffs_num[2]]
    cut4 = np.median(lll)
    cut5 = lll[-cutoffs_num[2]]
    cut6 = lll[-cutoffs_num[1]]
    cut7 = lll[-cutoffs_num[0]]
    
    cutoffs = [cut1, cut2, cut3, cut4, cut5, cut6, cut7]
    print(cutoffs)
    #Determine numbers to downsample to
    v_sizes = []
    yvalls_sizes = []
    v_sizes_20 = []
    yvalls_sizes_20 = []
    for i in range(len(cutoffs) + 1):
        if i == 0:
            v_test = v[v[stratifier].astype(float) < cutoffs[i]]
            yvalls_test = yvalls[yvalls[stratifier].astype(float) < cutoffs[i]]
            cut = "< " + str(cutoffs[i])
        elif i == 7:
            v_test = v[v[stratifier].astype(float) > cutoffs[i-1]]
            yvalls_test = yvalls[yvalls[stratifier].astype(float) > cutoffs[i-1]]
            cut = "> " + str(cutoffs[i-1])
        else:
            v_test = v[(v[stratifier].astype(float) > cutoffs[i - 1]) & (v[stratifier].astype(float) <= cutoffs[i])]
            yvalls_test = yvalls[(yvalls[stratifier].astype(float) > cutoffs[i - 1]) & (yvalls[stratifier].astype(float) <= cutoffs[i])]
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
            v_test = v[v[stratifier].astype(float) < cutoffs[i]]
            yvalls_test = yvalls[yvalls[stratifier].astype(float) < cutoffs[i]]
            cut = "< " + str(cutoffs[i])
        elif i == 7:
            v_test = v[v[stratifier].astype(float) > cutoffs[i-1]]
            yvalls_test = yvalls[yvalls[stratifier].astype(float) > cutoffs[i-1]]
            cut = "> " + str(cutoffs[i-1])
        else:
            v_test = v[(v[stratifier].astype(float) > cutoffs[i-1]) & (v[stratifier].astype(float) <= cutoffs[i])]
            yvalls_test = yvalls[(yvalls[stratifier].astype(float) > cutoffs[i-1]) & (yvalls[stratifier].astype(float) <= cutoffs[i])]
            cut = str(cutoffs[i-1]) + "-" + str(cutoffs[i])
        
                
        if i == 0 or i == 7:
            cut_num = str(cutoffs_num[0])
        elif i == 1 or i == 6:
            cut_num = str(cutoffs_num[1])
        elif i == 2 or i == 5:
            cut_num = str(cutoffs_num[2])
        else:
            cut_num = "Rest"
        fixed_tot = np.mean(v_test[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)
        poly_tot = np.mean(yvalls_test[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)

        if spec_sup == 250:
            vvv = prepare_alpha(v_test.copy(), yvalls_test.copy(), stat = "PhyloP447")
            metric = "PhyloP447"
            fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
            poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                
            for cuttt in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
                
                x = list(yvalls_test.sort_values(metric)[metric])
                cutoff = x[int(floor((len(x)*cuttt)))]
                alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                table1 = alpha[2]
                table2 = alpha[3]
                out.write("\t".join([cut, "PhyloP447", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", "Real", "Real", stratifier]) + "\n")
                print("\t".join([cut, "PhyloP447", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", "Real", "Real", stratifier]) + "\n")
    
        vvv = prepare_alpha(v_test.copy(), yvalls_test.copy(), stat = "abs logfc")
        metric = "abs logfc"
        fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        for cuttt in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
            
            x = list(yvalls_test.sort_values(metric)[metric])
            cutoff = x[int(floor((len(x)*cuttt)))]
            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out.write("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", "Real", "Real", stratifier]) + "\n")
            print("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", "Real", "Real", stratifier]) + "\n")
        
        v_test2 = v_test[v_test["Position"].isin(dl_fixed.index)]
        yvalls_test2 = yvalls_test[yvalls_test["Position"].isin(dl_poly.index)]
        fixed_tot = np.mean(v_test2[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)
        poly_tot = np.mean(yvalls_test2[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)

        if spec_sup == 250:
            vvv = prepare_alpha(v_test2.copy(), yvalls_test2.copy(), stat = "PhyloP447")
            metric = "PhyloP447"
            fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
            poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
            
                
            for cuttt in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
                
                x = list(yvalls_test2.sort_values(metric)[metric])
                cutoff = x[int(floor((len(x)*cuttt)))]
                alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                table1 = alpha[2]
                table2 = alpha[3]
                out.write("\t".join([cut, "PhyloP447", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", "Real", "Real", stratifier]) + "\n")
                #print("\t".join([cut, "PhyloP447", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", "Real", "Real", stratifier]) + "\n")
        
        
        vvv = prepare_alpha(v_test2.copy(), yvalls_test2.copy(), stat = "abs logfc")
        metric = "abs logfc"
        fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
        poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
        for cuttt in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
            
            x = list(yvalls_test2.sort_values(metric)[metric])
            cutoff = x[int(floor((len(x)*cuttt)))]
            alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            out.write("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", "Real", "Real", stratifier]) + "\n")
    
        for iteration in range(1000):
            
            #Do bootstrapping to get our confidence interval
            #Permute the fixed and polymorphic labels to get the correction factor
            np.random.seed(iteration)
            v_run = v_test.sample(n = v_size, replace = True)
            yvalls_run = yvalls_test.sample(n = yvalls_size, replace = True)
            
            v_run2 = v_test2.sample(n = v_size_20, replace = True)
            yvalls_run2 = yvalls_test2.sample(n = yvalls_size_20, replace = True)
            
            fixed_tot = np.mean(v_run[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)
            poly_tot = np.mean(yvalls_run[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)

            if spec_sup == 250:
                vvv = prepare_alpha(v_run.copy(), yvalls_run.copy(), stat = "PhyloP447")
                metric = "PhyloP447"
                fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
                    
                    x = list(yvalls_run.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out.write("\t".join([cut, "PhyloP447", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", str(iteration), "Bootstrap", stratifier]) + "\n")
                    #print("\t".join([cut, "PhyloP447", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", str(iteration), "Bootstrap", stratifier]) + "\n")
    
            
            vvv = prepare_alpha(v_run.copy(), yvalls_run.copy(), stat = "abs logfc")
            metric = "abs logfc"
            fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
            poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
            for cuttt in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
                
                x = list(yvalls_run.sort_values(metric)[metric])
                cutoff = x[int(floor((len(x)*cuttt)))]
                alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                table1 = alpha[2]
                table2 = alpha[3]
                out.write("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "All", str(iteration), "Bootstrap", stratifier]) + "\n")
            
            fixed_tot = np.mean(v_run2[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)
            poly_tot = np.mean(yvalls_run2[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)

            
            #Repeat the above for only variants in the top 20% most accessible set
            if spec_sup == 250:
                vvv = prepare_alpha(v_run2.copy(), yvalls_run2.copy(), stat = "PhyloP447")
                metric = "PhyloP447"
                fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
                    
                    x = list(yvalls_run2.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out.write("\t".join([cut, "PhyloP447", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", str(iteration), "Bootstrap", stratifier]) + "\n")
            
            vvv = prepare_alpha(v_run2.copy(), yvalls_run2.copy(), stat = "abs logfc")
            metric = "abs logfc"
            fixed_stat = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
            poly_stat = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
            for cuttt in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
                
                x = list(yvalls_run2.sort_values(metric)[metric])
                cutoff = x[int(floor((len(x)*cuttt)))]
                alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                table1 = alpha[2]
                table2 = alpha[3]
                out.write("\t".join([cut, "Absolute log fold-change", cut_num, str(np.median(fixed_tot)), str(np.median(fixed_stat)), str(len(list(fixed_stat))), str(np.median(poly_tot)), str(np.median(poly_stat)), str(len(list(poly_stat))), str((fisher_exact(table1)[1] + fisher_exact(table2)[1])/2), str(mwu(fixed_stat, poly_stat)[1]), str((fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2), str(mwu(fixed_stat, poly_stat, alternative = "greater")[1]), str(alpha[0]), str(alpha[1]), str(table1), str(table2), str(cuttt), "Top20th", str(iteration), "Bootstrap", stratifier]) + "\n")
            
out.close()