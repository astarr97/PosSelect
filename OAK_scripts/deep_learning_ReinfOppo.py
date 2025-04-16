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

def run_reinf_oppo(v_bln, vv_bln, v_bgn, vv_bgn, out1, out2, suffix = "None"):
    
    for cut in [0.05, 0.1, 0.2]:
        vx = v_bln[v_bln["abs logfc"] < 0.4]
        f_reinf = vx[vx["logfc"] > cut].shape[0]
        f_oppo = vx[vx["logfc"] < -cut].shape[0]

        vvx = vv_bln[vv_bln["abs logfc"] < 0.4]
        p_reinf = vvx[vvx["fixed logfc"] > cut].shape[0]
        p_oppo = vvx[vvx["fixed logfc"] < -cut].shape[0]

        out1.write("\t".join([suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), str(cut), "Decreasing CA", "Magnitude restriction", str([[f_reinf, f_oppo], [p_reinf, p_oppo]]), str(fisher_exact([[f_reinf, f_oppo], [p_reinf, p_oppo]])[0]), str(fisher_exact([[f_reinf, f_oppo], [p_reinf, p_oppo]])[1])]) + "\n")

        f_reinf = v_bln[v_bln["logfc"] > cut].shape[0]
        f_oppo = v_bln[v_bln["logfc"] < -cut].shape[0]

        p_reinf = vv_bln[vv_bln["fixed logfc"] > cut].shape[0]
        p_oppo = vv_bln[vv_bln["fixed logfc"] < -cut].shape[0]

        out1.write("\t".join([suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), str(cut), "Decreasing CA", "No magnitude restriction", str([[f_reinf, f_oppo], [p_reinf, p_oppo]]), str(fisher_exact([[f_reinf, f_oppo], [p_reinf, p_oppo]])[0]), str(fisher_exact([[f_reinf, f_oppo], [p_reinf, p_oppo]])[1])]) + "\n")

        vx = v_bgn[v_bgn["abs logfc"] < 0.4]
        f_oppo = vx[vx["logfc"] > cut].shape[0]
        f_reinf = vx[vx["logfc"] < -cut].shape[0]

        vvx = vv_bgn[vv_bgn["abs logfc"] < 0.4]
        p_oppo = vvx[vvx["fixed logfc"] > cut].shape[0]
        p_reinf = vvx[vvx["fixed logfc"] < -cut].shape[0]

        out1.write("\t".join([suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), str(cut), "Increasing CA", "Magnitude restriction", str([[f_reinf, f_oppo], [p_reinf, p_oppo]]), str(fisher_exact([[f_reinf, f_oppo], [p_reinf, p_oppo]])[0]), str(fisher_exact([[f_reinf, f_oppo], [p_reinf, p_oppo]])[1])]) + "\n")

        f_oppo = v_bgn[v_bgn["logfc"] > cut].shape[0]
        f_reinf = v_bgn[v_bgn["logfc"] < -cut].shape[0]

        p_oppo = vv_bgn[vv_bgn["fixed logfc"] > cut].shape[0]
        p_reinf = vv_bgn[vv_bgn["fixed logfc"] < -cut].shape[0]

        out1.write("\t".join([suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), str(cut), "Increasing CA", "No magnitude restriction", str([[f_reinf, f_oppo], [p_reinf, p_oppo]]), str(fisher_exact([[f_reinf, f_oppo], [p_reinf, p_oppo]])[0]), str(fisher_exact([[f_reinf, f_oppo], [p_reinf, p_oppo]])[1])]) + "\n")
    
    v_bln["fixed logfc"] = v_bln["logfc"]
    v_bgn["fixed logfc"] = v_bgn["logfc"]
    
    for cuttt in [0.6, 0.7, 0.8, 0.9]:
        print("Selection on changes opposing loss of accessibility, no restriction on magnitude")

        vx = v_bln[v_bln["fixed logfc"] < 0].copy()
        vvx = vv_bln[vv_bln["fixed logfc"] < 0].copy()

        vvv = prepare_alpha(vx, vvx, stat = "abs logfc")
        x2 = vx["abs logfc"]
        yvals2 = list(vvx["abs logfc"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]

        alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "Absolute log fold-change", "Opposing decreasing CA", "No magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
    
        vvv = prepare_alpha(vx[vx["SpecSup447"] > 250].copy(), vvx[vvx["SpecSup447"] > 250].copy(), stat = "PhyloP447")
        x2 = vx["PhyloP447"]
        yvals2 = list(vvx["PhyloP447"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
        
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "PhyloP447", "Opposing decreasing CA", "No magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")

    
    
        print("Selection on changes opposing loss of accessibility, with restriction on magnitude")

        vx = v_bln[(v_bln["fixed logfc"] < 0) & (v_bln["abs logfc"] < 0.4)].copy()
        vvx = vv_bln[(vv_bln["fixed logfc"] < 0) & (vv_bln["abs logfc"] < 0.4)].copy()

        vvv = prepare_alpha(vx, vvx, stat = "abs logfc")
        x2 = vx["abs logfc"]
        yvals2 = list(vvx["abs logfc"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]

        alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "Absolute log fold-change", "Opposing decreasing CA", "Magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
    
        vvv = prepare_alpha(vx[vx["SpecSup447"] > 250].copy(), vvx[vvx["SpecSup447"] > 250].copy(), stat = "PhyloP447")
        x2 = vx["PhyloP447"]
        yvals2 = list(vvx["PhyloP447"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
        
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "PhyloP447", "Opposing decreasing CA", "Magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")



        print("Selection on changes reinforcing loss of accessibility, magnitude is already restricted")

        vx = v_bln[v_bln["fixed logfc"] > 0].copy()
        vvx = vv_bln[vv_bln["fixed logfc"] > 0].copy()

        vvv = prepare_alpha(vx, vvx, stat = "abs logfc")
        x2 = vx["abs logfc"]
        yvals2 = list(vvx["abs logfc"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]

        alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "Absolute log fold-change", "Reinforcing decreasing CA", "Magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
    
        vvv = prepare_alpha(vx[vx["SpecSup447"] > 250].copy(), vvx[vvx["SpecSup447"] > 250].copy(), stat = "PhyloP447")
        x2 = vx["PhyloP447"]
        yvals2 = list(vvx["PhyloP447"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
        
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "PhyloP447", "Reinforcing decreasing CA", "Magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")


        print("Selection on changes opposing gain of accessibility, no restriction on magnitude")

        vx = v_bgn[v_bgn["fixed logfc"] > 0].copy()
        vvx = vv_bgn[vv_bgn["fixed logfc"] > 0].copy()
        
        vvv = prepare_alpha(vx, vvx, stat = "abs logfc")
        x2 = vx["abs logfc"]
        yvals2 = list(vvx["abs logfc"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]

        alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "Absolute log fold-change", "Opposing increasing CA", "No magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
    
        vvv = prepare_alpha(vx[vx["SpecSup447"] > 250].copy(), vvx[vvx["SpecSup447"] > 250].copy(), stat = "PhyloP447")
        x2 = vx["PhyloP447"]
        yvals2 = list(vvx["PhyloP447"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
        
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "PhyloP447", "Opposing increasing CA", "No magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")

    
        print("Selection on changes opposing gain of accessibility, with restriction on magnitude")

        vx = v_bgn[(v_bgn["fixed logfc"] > 0) & (v_bgn["abs logfc"] < 0.4)].copy()
        vvx = vv_bgn[(vv_bgn["fixed logfc"] > 0) & (vv_bgn["abs logfc"] < 0.4)].copy()
        
        vvv = prepare_alpha(vx, vvx, stat = "abs logfc")
        x2 = vx["abs logfc"]
        yvals2 = list(vvx["abs logfc"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]

        alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "Absolute log fold-change", "Opposing increasing CA", "Magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
    
        vvv = prepare_alpha(vx[vx["SpecSup447"] > 250].copy(), vvx[vvx["SpecSup447"] > 250].copy(), stat = "PhyloP447")
        x2 = vx["PhyloP447"]
        yvals2 = list(vvx["PhyloP447"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
        
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "PhyloP447", "Opposing increasing CA", "Magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")

    
        print("Selection on changes reinforcing gain of accessibility, magnitude is already restricted")

        vx = v_bgn[v_bgn["fixed logfc"] < 0].copy()
        vvx = vv_bgn[vv_bgn["fixed logfc"] < 0].copy()

        vvv = prepare_alpha(vx, vvx, stat = "abs logfc")
        x2 = vx["abs logfc"]
        yvals2 = list(vvx["abs logfc"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]

        alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "Absolute log fold-change", "Reinforcing increasing CA", "Magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
    
        vvv = prepare_alpha(vx[vx["SpecSup447"] > 250].copy(), vvx[vvx["SpecSup447"] > 250].copy(), stat = "PhyloP447")
        x2 = vx["PhyloP447"]
        yvals2 = list(vvx["PhyloP447"])
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
        
        alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
        table1 = alpha[2]
        table2 = alpha[3]
        out2.write("\t".join([str(iii) for iii in [suffix, str(startSpecSup), str(lfc_cut), str(pos_cut), str(neg_cut), "PhyloP447", "Reinforcing increasing CA", "Magnitude restriction", \
                             np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                             mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                             mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")


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

out1 = open("ReinfOppo/" + dl_prefix + "_SYNGO_FE.txt", 'w')
out2 = open("ReinfOppo/" + dl_prefix + "_SYNGO_Alpha.txt", 'w')
out1.write("ID\tStartSpecSup\tBig_Cutoff\tPosLFC_Cutoff\tNegLFC_Cutoff\tLFC_Cutoff\tDecOrInc\tMagRestr\t[[fixed_reinf, fixed_oppo], [poly_reinf, poly_oppo]]\tFisher exact p-value\n")
out2.write("ID\tStartSpecSup\tBig_Cutoff\tPosLFC_Cutoff\tNegLFC_Cutoff\tMetric\tRefOppoDecInc\tMagRestr\tMedian Fixed PhyloP\tNumber Fixed Variants\tMedian Polymorphic PhyloP\tNumber Polymorphic Variants\tFisher exact p-value\tMWU p-value\tFisher exact p-value; alt greater\tMWU p-value; alt greater\talpha\tCutoff\t[[dc1, du1], [pc1, pu1]]\t[[dc2, du2], [pc2, pu2]]\tProportion\n")

print(v)
print(vv)

v["logfc"] = v["logfc"].astype(float)
v["abs logfc"] = v["abs logfc"].astype(float)

vv["logfc"] = vv["logfc"].astype(float)
vv["fixed logfc"] = vv["fixed logfc"].astype(float)
vv["abs logfc"] = vv["abs logfc"].astype(float)

#Must be in ascending order!
for startSpecSup in [0, 250]:
    for lfc_cut in [15000, 30000]:
        v = v[v["SpecSup447"] > startSpecSup]
        vv = vv[vv["SpecSup447"] > startSpecSup]
        
        neg_cut = list(v.sort_values("logfc")["logfc"])[lfc_cut]
        pos_cut = list(v.sort_values("logfc")["logfc"])[-lfc_cut-1]
        
        v_bl = v[v["logfc"] >= pos_cut]
        v_bg = v[v["logfc"] <= neg_cut]
        
        vv_bl = vv[vv["fixed logfc"] >= pos_cut]
        vv_bg = vv[vv["fixed logfc"] <= neg_cut]
        
        d_bl = {}
        d_bg = {}
        
        done = 0
        for index, row in v_bl.iterrows():
            if row["Chrom"] in d_bl.keys():
                d_bl[row["Chrom"]] = d_bl[row["Chrom"]] + list(range(row["Pos"]-500, row["Pos"]+500))
            else:
                d_bl[row["Chrom"]] = list(range(row["Pos"]-500, row["Pos"]+500))
            done += 1
            if done % 1000 == 0:
                print(done)
                
        done = 0
        for index, row in v_bg.iterrows():
            if row["Chrom"] in d_bg.keys():
                d_bg[row["Chrom"]] = d_bg[row["Chrom"]] + list(range(row["Pos"]-500, row["Pos"]+500))
            else:
                d_bg[row["Chrom"]] = list(range(row["Pos"]-500, row["Pos"]+500))
            done += 1
            if done % 1000 == 0:
                print(done)
                
        v_bln = pd.DataFrame()
        for key in d_bl.keys():
            v_blc = v_bl[v_bl["Chrom"].isin([key])]
            v_bln = pd.concat([v_bln, v[(v["Chrom"].isin([key])) & (v["Pos"].isin(d_bl[key])) & (~v["Pos"].isin(v_blc["Pos"]))]])
        
        vv_bln = pd.DataFrame()
        for key in d_bl.keys():
            vv_blc = vv_bl[vv_bl["Chrom"].isin([key])]
            vv_bln = pd.concat([vv_bln, vv[(vv["Chrom"].isin([key])) & (vv["Pos"].isin(d_bl[key])) & (~vv["Pos"].isin(vv_blc["Pos"]))]])
        
        v_bgn = pd.DataFrame()
        for key in d_bg.keys():
            v_bgc = v_bg[v_bg["Chrom"].isin([key])]
            v_bgn = pd.concat([v_bgn, v[(v["Chrom"].isin([key])) & (v["Pos"].isin(d_bg[key])) & (~v["Pos"].isin(v_bgc["Pos"]))]])
        
        vv_bgn = pd.DataFrame()
        for key in d_bg.keys():
            vv_bgc = vv_bg[vv_bg["Chrom"].isin([key])]
            vv_bgn = pd.concat([vv_bgn, vv[(vv["Chrom"].isin([key])) & (vv["Pos"].isin(d_bg[key])) & (~vv["Pos"].isin(vv_bgc["Pos"]))]])
        
        #pli = pd.read_csv("gnomad.v4.1.constraint_metrics.tsv", sep = "\t")
        #pli = pli.dropna()
        #pli = pli[pli["lof.pLI"] > 0.9]
        #keep_pli = pli["gene"]
        
        syngo = list(pd.read_csv("SYNGO.txt", sep = "\t", header = None)[0])
        
        run_reinf_oppo(v_bln[v_bln["NearestGene"].isin(syngo)], vv_bln[vv_bln["NearestGene"].isin(syngo)], v_bgn[v_bgn["NearestGene"].isin(syngo)], vv_bgn[vv_bgn["NearestGene"].isin(syngo)], out1, out2)
        #run_reinf_oppo(v_bln, vv_bln, v_bgn, vv_bgn, out1, out2)
        
        v_bln2, vv_bln2 = remove_repeats(v_bln, vv_bln)
        v_bln2, vv_bln2 = remove_pseudos(v_bln2, vv_bln2)
        
        v_bgn2, vv_bgn2 = remove_repeats(v_bgn, vv_bgn)
        v_bgn2, vv_bgn2 = remove_pseudos(v_bgn2, vv_bgn2)
        
        run_reinf_oppo(v_bln2[v_bln2["NearestGene"].isin(syngo)], vv_bln2[vv_bln2["NearestGene"].isin(syngo)], v_bgn2[v_bgn2["NearestGene"].isin(syngo)], vv_bgn2[vv_bgn2["NearestGene"].isin(syngo)], out1, out2, suffix = "NoRepeatsNoPseudos")
        #run_reinf_oppo(v_bln2, vv_bln2, v_bgn2, vv_bgn2, out1, out2, suffix = "NoRepeatsNoPseudos")

out1.close()
out2.close()
