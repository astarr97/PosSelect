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

#Compute cutoff for top 20th percentile of accessible sites, not used
fixed_to_cut = pd.DataFrame(np.max(dl_fixed[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)).sort_values(0)
poly_to_cut = pd.DataFrame(np.max(dl_poly[["allele1_pred_counts", "allele2_pred_counts"]].astype(float), axis = 1)).sort_values(0)

cutoff_fixed = list(fixed_to_cut[0])[8*fixed_to_cut.shape[0]//10]
cutoff_poly = list(poly_to_cut[0])[8*poly_to_cut.shape[0]//10]
print(cutoff_fixed, cutoff_poly)
cutoff_to_use = (cutoff_fixed + cutoff_poly)/2

#Join with deep learning information
v = v.join(dl_fixed).dropna()
vv = vv.join(dl_poly).dropna()
vv = vv.drop_duplicates("Position")
v = v.drop_duplicates("Position")

#Unfold allele-freq
vv = add_unfold(vv)

#Correct the sign of the polymorphic logfc to be consistent about derived allele being denominator
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

#Make sure everything is a float
v["Chrom"] = [x.split(":")[0] for x in v["Position"]]
v["Pos"] = [int(x.split(":")[1]) for x in v["Position"]]

vv["Chrom"] = [x.split(":")[0] for x in vv["Position"]]
vv["Pos"] = [int(x.split(":")[1]) for x in vv["Position"]]

v["logfc"] = v["logfc"].astype(float)
v["abs logfc"] = v["abs logfc"].astype(float)

vv["logfc"] = vv["logfc"].astype(float)
vv["fixed logfc"] = vv["fixed logfc"].astype(float)
vv["abs logfc"] = vv["abs logfc"].astype(float)

#Read in the repeat information
rep_f = pd.read_csv("Pseudos_Repeats/HumChp_NC_Final_CREs_NoHLA_rmsk.txt", sep = "\t", header = None)
rep_p = pd.read_csv("Pseudos_Repeats/HumPoly_NC_Final_CREs_NoHLA_rmsk.txt", sep = "\t", header = None)

rep_f.columns = [0, "Repeat"]
rep_p.columns = [0, "Repeat"]

v.index = v["Position"]
v = v.join(rep_f.set_index(0)).drop_duplicates("Position").dropna()

vv.index = vv["Position"]
vv = vv.join(rep_p.set_index(0)).drop_duplicates("Position").dropna()

#Get only Alu elements
reps = Counter(list(v["Repeat"]) + list(vv["Repeat"]))
alu = []
for key in reps.keys():
    if key.startswith("Alu") or key.startswith("ALU"):
        alu.append(key)

va = v[v["Repeat"].isin(alu)]
vva = vv[vv["Repeat"].isin(alu)]
vna = v[~v["Repeat"].isin(alu)]
vvna = vv[~vv["Repeat"].isin(alu)]

def run(vx, vvx, suffix, out, cuttt, metric):
    vvv = prepare_alpha(vx, vvx, stat = metric)
    x2 = vx[metric]
    yvals2 = list(vvx[metric])
    if len(x2) >= 100 and len(yvals2) >= 50:
        yvals2.sort()
        cutoff = yvals2[int(floor((len(yvals2)*cuttt)))]
    
        try:
            alpha = compute_alpha_cutoff(vvv, plot = False, window = [0, 0.5], cutoff = cutoff)
            table1 = alpha[2]
            table2 = alpha[3]
            
            out.write("\t".join([str(iii) for iii in [suffix, metric, \
                                 np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, \
                                 mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, \
                                 mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt]]) + "\n")
        except:
            out.write("\t".join([str(iii) for iii in [suffix, metric, \
                                 np.median(x2), len(x2), np.median(yvals2), len(yvals2), "NA", \
                                 mwu(x2, yvals2)[1], "NA", \
                                 mwu(x2, yvals2, alternative = "greater")[1], "NA", "NA", "NA", "NA", cuttt]]) + "\n")

out = open("Alu/" + dl_prefix + "_Alu_Top20th.txt", 'w')
out.write("ID\tMetric\tMedian Fixed PhyloP\tNumber Fixed Variants\tMedian Polymorphic PhyloP\tNumber Polymorphic Variants\tFisher exact p-value\tMWU p-value\tFisher exact p-value; alt greater\tMWU p-value; alt greater\talpha\tCutoff\t[[dc1, du1], [pc1, pu1]]\t[[dc2, du2], [pc2, pu2]]\tProportion\n")

#Test across parameters, do for Alu elements and then non-Alu and non-Alu new repeats
for cuttt in [0.6, 0.7, 0.8, 0.9, 0.95, 0.99]:
    vx = va.copy()
    vvx = vva.copy()
    run(vx, vvx, "All alu", out, cuttt, "abs logfc")
    
    vx = va.copy()
    vvx = vva[vva["fixed logfc"] == vva["logfc"]].copy()
    run(vx, vvx, "All alu, FiLogfcEqualLogc", out, cuttt, "abs logfc")
    
    vx = vna.copy()
    vvx = vvna.copy()
    run(vx, vvx, "All non-alu", out, cuttt, "abs logfc")
    
    vx = vna.copy()
    vvx = vvna[vvna["fixed logfc"] == vvna["logfc"]].copy()
    run(vx, vvx, "All non-alu, FiLogfcEqualLogc", out, cuttt, "abs logfc")
    
    vx = vna[(vna["SpecSup447"] < 240) & (vna["Repeat"] != ".")].copy()
    vvx = vvna[(vvna["SpecSup447"] < 240) & (vvna["Repeat"] != ".")].copy()
    run(vx, vvx, "All non-alu, Rep240", out, cuttt, "abs logfc")
    
    vx = vna[(vna["SpecSup447"] < 240) & (vna["Repeat"] != ".")].copy()
    vvx = vvna[(vvna["SpecSup447"] < 240) & (vvna["Repeat"] != ".") & (vvna["fixed logfc"] == vvna["logfc"])].copy()
    run(vx, vvx, "All non-alu, FiLogfcEqualLogc, Rep240", out, cuttt, "abs logfc")
    
    reps = Counter(va["Repeat"])
    repsp = Counter(vva["Repeat"])
    
    for i in reps.keys():
        if reps[i] >= 500 and repsp[i] >= 100:
            vx = va[va["Repeat"] == i].copy()
            vvx = vva[vva["Repeat"] == i].copy()
            run(vx, vvx, i, out, cuttt, "abs logfc")
            vvx = vvx[vvx["logfc"] == vvx["fixed logfc"]].copy()
            run(vx, vvx, i + ", FiLogfcEqualLogc", out, cuttt, "abs logfc")
    
group1 = ["KosoyRoussosControlMicroglia", "LiangSteinNeuron", "AdultHeartVentricularCardiomyocyte", "AdultProximalTubule", "FetalArterialECs", "FetalChondrocytes", "SertoliMale", "ASCT"]
group2 = ["FetalGonadImmuneFemale", "ITL23", "AdultHeartSmoothMuscle", "AdultLoopOfHenle", "FetalHeartPericytes", "FetalHeartCardiacFibroblasts", "preGC_IIaFemale", "FetalBrainCOP"]

out.close()

