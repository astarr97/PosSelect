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

window_size = int(sys.argv[1])
metric = " ".join(sys.argv[2].split("_"))

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
    dl_prefix = sys.argv[3]
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

print(v.shape[0], yvalls.shape[0])

v["Chrom"] = [x.split(":")[0] for x in v["Position"]]
v["Pos"] = [int(x.split(":")[1]) for x in v["Position"]]

yvalls["Chrom"] = [x.split(":")[0] for x in yvalls["Position"]]
yvalls["Pos"] = [int(x.split(":")[1]) for x in yvalls["Position"]]

#Running in general
maf_cut = 0.25
phylop_cut = -100
pc = -1


def run_per_gene(v2, vv2):
    out = []
    out_w = []
    c = 0
    for gene in np.intersect1d(v2["NearestGene"], vv2["NearestGene"]):
        
        if "-Dec" not in gene and "-Mar" not in gene and "-Sep" not in gene:
            vk = v2[v2["NearestGene"].isin([gene])].copy()
            vvk = vv2[vv2["NearestGene"].isin([gene])].copy()
    
            tot = list(vk["Pos"]) + list(vvk["Pos"])
            min_ = np.min(tot)
            max_ = np.max(tot)
    
            if max_ - min_ >= 150000:
                c += 1
                x2 = [np.float64(x) for x in list(vk[metric])]
                yvals2 = [np.float64(j) for j in list(vvk[metric])]
                yvals2.sort()
    
                vvv = prepare_alpha(vk, vvk, stat = metric)
                for cuttt in [0.6, 0.7, 0.8]:
                    cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv, dn_cut = 0.05, plot = False, cutoff = cutoff)
    
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out.append([gene, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, "Real"])
    
                while min_ < max_:
                    
                    if min_ + window_size < max_:
                        v2kw = vk[vk["Pos"].isin(range(min_, min_ + window_size))].copy()
                        vv2kw = vvk[vvk["Pos"].isin(range(min_, min_ + window_size))].copy()
                        if len(v2kw.index) >= 20 and len(vv2kw.index) >= 10:
                            window = list(v2kw["Chrom"])[0] + ":" + str(min_) + "-" + str(min_ + window_size)
                    else:
                        v2kw = vk[vk["Pos"].isin(range(min_, max_))].copy()
                        vv2kw = vvk[vvk["Pos"].isin(range(min_, max_))].copy()
                        min_ = max_
                        if len(v2kw.index) >= 20 and len(vv2kw.index) >= 10:
                            window = list(v2kw["Chrom"])[0] + ":" + str(min_) + "-" + str(max_)
    
                    x2 = [np.float64(x) for x in list(v2kw[metric])]
                    yvals2 = [np.float64(j) for j in list(vv2kw[metric])]
                    yvals2.sort()
                    vvv = prepare_alpha(v2kw, vv2kw, stat = metric)
                    if len(x2) >= 20 and len(yvals2) >= 10:
                        for cuttt in [0.6, 0.7, 0.8]:
                            cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
                            alpha = compute_alpha_cutoff(vvv, dn_cut = 0.05, plot = False, cutoff = cutoff)
    
                            table1 = alpha[2]
                            table2 = alpha[3]
                            out_w.append([gene, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, window, "Real"])
    
                    min_ += window_size
                
                vk_shuf = vk.copy()
                vk_arr = np.array(vk_shuf["Pos"])
                np.random.shuffle(vk_arr)
                vk_shuf["Pos"] = vk_arr
                vvk_shuf = vvk.copy()
                vvk_arr = np.array(vvk_shuf["Pos"])
                np.random.shuffle(vvk_arr)
                vvk_shuf["Pos"] = vvk_arr
                
                tot = list(vk["Pos"]) + list(vvk["Pos"])
                min_ = np.min(tot)
                max_ = np.max(tot)
                
                while min_ < max_:
                    if min_ + window_size < max_:
                        v2kw = vk_shuf[vk_shuf["Pos"].isin(range(min_, min_ + window_size))].copy()
                        vv2kw = vvk_shuf[vvk_shuf["Pos"].isin(range(min_, min_ + window_size))].copy()
                        if len(v2kw.index) >= 20 and len(vv2kw.index) >= 10:
                            window = list(v2kw["Chrom"])[0] + ":" + str(min_) + "-" + str(min_ + window_size)
                    else:
                        v2kw = vk_shuf[vk_shuf["Pos"].isin(range(min_, min_ + window_size))].copy()
                        vv2kw = vvk_shuf[vvk_shuf["Pos"].isin(range(min_, min_ + window_size))].copy()
                        min_ = max_
                        if len(v2kw.index) >= 20 and len(vv2kw.index) >= 10:
                            window = list(v2kw["Chrom"])[0] + ":" + str(min_) + "-" + str(max_)
    
                    x2 = [np.float64(x) for x in list(v2kw[metric])]
                    yvals2 = [np.float64(j) for j in list(vv2kw[metric])]
                    yvals2.sort()
                    vvv = prepare_alpha(v2kw, vv2kw, stat = metric)
                    if len(x2) >= 20 and len(yvals2) >= 10:
                        for cuttt in [0.6, 0.7, 0.8]:
                            cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
                            alpha = compute_alpha_cutoff(vvv, dn_cut = 0.05, plot = False, cutoff = cutoff)
    
                            table1 = alpha[2]
                            table2 = alpha[3]
                            out_w.append([gene, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt, window, "ShuffledPositions"])

                    min_ += window_size

    df = pd.DataFrame(out)
    df.columns = ["Term", "Median Fixed PhyloP", "Number Fixed Variants", "Median Polymorphic PhyloP", "Number Polymorphic Variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion", "ShufOrReal"]
    
    dfw = pd.DataFrame(out_w)
    dfw.columns = ["Term", "Median Fixed PhyloP", "Number Fixed Variants", "Median Polymorphic PhyloP", "Number Polymorphic Variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion", "Window", "ShufOrReal"]

    return df, dfw

if metric == "PhyloP447":
    df, dfw = run_per_gene(v, yvalls)
    df.to_csv("PerGene_Windows_TestBGS/PerGeneWindowsTestBGS_PerGene_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    dfw.to_csv("PerGene_Windows_TestBGS/PerGeneWindowsTestBGS_PerWindow_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)

    v, yvalls = remove_pseudos(v, yvalls)
    v, yvalls = remove_repeats(v, yvalls)
    
    pc = -1
    df, dfw = run_per_gene(v, yvalls)
    df.to_csv("PerGene_Windows_TestBGS/PerGeneWindowsTestBGS_PerGene_NoPseudosNoRepeats_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    dfw.to_csv("PerGene_Windows_TestBGS/PerGeneWindowsTestBGS_PerWindow_NoPseudosNoRepeats_NonCod_" + metric + "_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup250_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)

elif metric == "abs logfc":
    try:
        os.mkdir("PerGene_Windows_TestBGS/" + dl_prefix)
    except:
        pass
    
    df, dfw = run_per_gene(v, yvalls)
    df.to_csv("PerGene_Windows_TestBGS/" + dl_prefix + "/PerGeneWindowsTestBGS_PerGene_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_All_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    dfw.to_csv("PerGene_Windows_TestBGS/" + dl_prefix + "/PerGeneWindowsTestBGS_PerWindow_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_All_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)

    df, dfw = run_per_gene(v[v["Position"].isin(dl_fixed.index)].copy(), yvalls[yvalls["Position"].isin(dl_poly.index)].copy())
    df.to_csv("PerGene_Windows_TestBGS/" + dl_prefix + "/PerGeneWindowsTestBGS_PerGene_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_Top20th_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    dfw.to_csv("PerGene_Windows_TestBGS/" + dl_prefix + "/PerGeneWindowsTestBGS_PerWindow_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_Top20th_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    
    v, yvalls = remove_pseudos(v, yvalls)
    v, yvalls = remove_repeats(v, yvalls)
    
    df, dfw = run_per_gene(v, yvalls)
    df.to_csv("PerGene_Windows_TestBGS/" + dl_prefix + "/PerGeneWindowsTestBGS_PerGene_NoPseudosNoRepeats_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_All_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    dfw.to_csv("PerGene_Windows_TestBGS/" + dl_prefix + "/PerGeneWindowsTestBGS_PerWindow_NoPseudosNoRepeats_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_All_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)

    df, dfw = run_per_gene(v[v["Position"].isin(dl_fixed.index)].copy(), yvalls[yvalls["Position"].isin(dl_poly.index)].copy())
    df.to_csv("PerGene_Windows_TestBGS/" + dl_prefix + "/PerGeneWindowsTestBGS_PerGene_NoPseudosNoRepeats_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_Top20th_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)
    dfw.to_csv("PerGene_Windows_TestBGS/" + dl_prefix + "/PerGeneWindowsTestBGS_PerWindow_NoPseudosNoRepeats_NonCod_Dl" + dl_prefix + "_" + metric.replace(" ", "_") + "_Top20th_MAFCut" + str(maf_cut) + "_WindowSize" + str(window_size) + "_SpecSup0_PhyloPCut" + str(phylop_cut) + "_PhastConsCut" + str(pc) + ".csv", index = False)

    
