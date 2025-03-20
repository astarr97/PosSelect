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
from matplotlib.backends.backend_pdf import PdfPages
from math import floor

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

window = [0, 1]

dist = float(sys.argv[1])
pc = float(sys.argv[2])
maf_cut = float(sys.argv[3])
cutoffs = sys.argv[4]
rem_repeats = int(sys.argv[5])
v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = maf_cut, spec_sup = 0)
dl_prefix = sys.argv[6]
print(dl_prefix)
try:
    jsd = sys.argv[7]
except:
    jsd = False
dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"

print(v.shape[0], yvalls.shape[0])

phylop_cut = -100

try:
    os.mkdir("TFBS_Results/" + dl_prefix)
except:
    pass

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

print(v.shape[0], yvalls.shape[0])

v = v.join(dl_fixed).dropna()
yvalls = yvalls.join(dl_poly).dropna()
yvalls = yvalls.drop_duplicates("Position")
v = v.drop_duplicates("Position")

print(v.shape[0], yvalls.shape[0])

dl_fixed = dl_fixed[(dl_fixed["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_fixed["allele2_pred_counts"].astype(float) > cutoff_to_use)]
dl_poly = dl_poly[(dl_poly["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_poly["allele2_pred_counts"].astype(float) > cutoff_to_use)]

if rem_repeats:
    v, yvalls = remove_pseudos(v, yvalls)
    v, yvalls = remove_repeats(v, yvalls)

yvalls.index = yvalls["Position"]
yvalls = add_unfold(yvalls)

print(v.shape[0], yvalls.shape[0])

v.index = v["Position"]
yvalls.index = yvalls["Position"]
print(v.shape[0], yvalls.shape[0])

#Get the TFBS files, make sure they are in order and accounted for
fixed_files = os.listdir("TFBS_Fixed")
fixed_files.sort()
poly_files = os.listdir("TFBS_Poly")
poly_files.sort()
assert(len(fixed_files) == len(poly_files))

for i in range(len(poly_files)):
    assert(poly_files[i].split("_")[0] == fixed_files[i].split("_")[0])

def prepare_tfbs(file, forp):
    if forp == "Fixed":
        tf_fixed = pd.read_csv("TFBS_Fixed/" + file, sep = "\t", header = None, compression='gzip')
        tf_fixed.index = tf_fixed[0]
        tf_fixed = tf_fixed[[0, 1, 2, 4]].replace("<200", 200)
        tf_fixed[1] = tf_fixed[1].astype(float)
        tf_fixed[2] = tf_fixed[2].astype(float)
        tf_fixed[4] = tf_fixed[4].astype(float)
        return tf_fixed
    elif forp == "Poly":
        tf_poly = pd.read_csv("TFBS_Poly/" + file, sep = "\t", header = None, compression='gzip')
        tf_poly.index = tf_poly[0]
        tf_poly = tf_poly[[0, 1, 2, 3]].replace("<200", 200)
        tf_poly[1] = tf_poly[1].astype(float)
        tf_poly[2] = tf_poly[2].astype(float)
        tf_poly[3] = tf_poly[3].astype(float)
        return tf_poly
    else:
        assert(False)


out1 = []
out2 = []
out3 = []
out4 = []
out5 = []
out6 = []


if jsd:
    prefix1 = "TFBS_SpecSup0_PS_PhastCons-1_Unpaired_MAFCut0.25_FilterNewTEs_" + dl_prefix + "_JSD_All"
    prefix2 = prefix1.replace("JSD", "JSD_HrefDneCrefOnly")
    prefix3 = prefix1.replace("_All", "_Top20th")
    prefix4 = prefix2.replace("_All", "_Top20th")
    prefix5 = prefix1.replace("SpecSup0", "SpecSup250")
    prefix6 = prefix2.replace("SpecSup0", "SpecSup250")
else:
    prefix1 = "TFBS_SpecSup0_PS_PhastCons-1_Unpaired_MAFCut0.25_FilterNewTEs_" + dl_prefix + "_AbsLogfc_All"
    prefix2 = prefix1.replace("AbsLogfc", "AbsLogfc_HrefDneCrefOnly")
    prefix3 = prefix1.replace("_All", "_Top20th")
    prefix4 = prefix2.replace("_All", "_Top20th")
    prefix5 = prefix1.replace("SpecSup0", "SpecSup250")
    prefix6 = prefix2.replace("SpecSup0", "SpecSup250")
    
if rem_repeats:
    prefix1 = prefix1 + "_NoRepeatsNoPseudos"
    prefix2 = prefix2 + "_NoRepeatsNoPseudos"
    prefix3 = prefix3 + "_NoRepeatsNoPseudos"
    prefix4 = prefix4 + "_NoRepeatsNoPseudos"
    prefix5 = prefix5 + "_NoRepeatsNoPseudos"
    prefix6 = prefix6 + "_NoRepeatsNoPseudos"

if jsd:
    metric_name = "JSD"
else:
    metric_name = "abs logfc"

for i in range(len(poly_files)):
    fixed_file = fixed_files[i]
    poly_file = poly_files[i]
    tf = fixed_file.split("_")[0] + "_" + fixed_file.split("_")[1]
    
    #Read in TFBS information
    tf_fixed = prepare_tfbs(fixed_file, "Fixed")
    tf_poly = prepare_tfbs(poly_file, "Poly")
    #Iterate through the cutoffs, doing the test etc.
    for cut in cutoffs.split(","):
        cut = int(cut)
        tf_fixed_filt = tf_fixed[(tf_fixed[1] > cut) | ((tf_fixed[2] > cut) & (tf_fixed[4] > cut))].dropna()
        tf_poly_filt = tf_poly[(tf_poly[1] > cut) | ((tf_poly[2] > cut) & (tf_poly[3] > cut))].dropna()
        v_tf = v.join(tf_fixed_filt).dropna().drop_duplicates("Position").copy()
        v_tf3 = v_tf[v_tf["Position"].isin(dl_fixed.index)].copy()
        v_tf5 = v_tf[v_tf["SpecSup447"].astype(int) > 250].copy()
        
        yvalls_tf = yvalls.join(tf_poly_filt).dropna().drop_duplicates("Position").copy()
        yvalls_tf2 = yvalls_tf[yvalls_tf["Human ref"] != yvalls_tf["Chimp ref"]].copy()
        yvalls_tf3 = yvalls_tf[yvalls_tf["Position"].isin(dl_poly.index)].copy()
        yvalls_tf4 = yvalls_tf2[yvalls_tf2["Position"].isin(dl_poly.index)].copy()
        yvalls_tf5 = yvalls_tf[yvalls_tf["SpecSup447"].astype(int) > 250].copy()
        yvalls_tf6 = yvalls_tf2[yvalls_tf2["SpecSup447"].astype(int) > 250].copy()
        #Run with baseline settings
        
        if jsd:
            vvv1 = prepare_alpha(v_tf, yvalls_tf, "jsd")
            vvv2 = prepare_alpha(v_tf, yvalls_tf2, "jsd")
            vvv3 = prepare_alpha(v_tf3, yvalls_tf3, "jsd")
            vvv4 = prepare_alpha(v_tf3, yvalls_tf4, "jsd")
            vvv5 = prepare_alpha(v_tf5, yvalls_tf5, "jsd")
            vvv6 = prepare_alpha(v_tf5, yvalls_tf6, "jsd")
        else:
            vvv1 = prepare_alpha(v_tf, yvalls_tf, "abs logfc")
            vvv2 = prepare_alpha(v_tf, yvalls_tf2, "abs logfc")
            vvv3 = prepare_alpha(v_tf3, yvalls_tf3, "abs logfc")
            vvv4 = prepare_alpha(v_tf3, yvalls_tf4, "abs logfc")
            vvv5 = prepare_alpha(v_tf5, yvalls_tf5, "abs logfc")
            vvv6 = prepare_alpha(v_tf5, yvalls_tf6, "abs logfc")
        if v_tf.shape[0] >= 30 and yvalls_tf.shape[0] >= 30:
            if jsd:
                metric = "jsd"
                x2 = vvv1[vvv1["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv1[vvv1["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv1, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out1.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
            else:
                metric = "abs logfc"
                x2 = vvv1[vvv1["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv1[vvv1["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv1, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out1.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
        if v_tf.shape[0] >= 30 and yvalls_tf2.shape[0] >= 30:
            if jsd:
                metric = "jsd"
                x2 = vvv2[vvv2["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv2[vvv2["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf2.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv2, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out2.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
            else:
                metric = "abs logfc"
                x2 = vvv2[vvv2["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv2[vvv2["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf2.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv2, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out2.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
        if v_tf3.shape[0] >= 30 and yvalls_tf3.shape[0] >= 30:
            if jsd:
                metric = "jsd"
                x2 = vvv3[vvv3["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv3[vvv3["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf3.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv3, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out3.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
            else:
                metric = "abs logfc"
                x2 = vvv3[vvv3["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv3[vvv3["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf3.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv3, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out3.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
        if v_tf3.shape[0] >= 30 and yvalls_tf4.shape[0] >= 30:
            if jsd:
                metric = "jsd"
                x2 = vvv4[vvv4["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv4[vvv4["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf4.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv4, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out4.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
            else:
                metric = "abs logfc"
                x2 = vvv4[vvv4["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv4[vvv4["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf4.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv4, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out4.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
        if v_tf5.shape[0] >= 30 and yvalls_tf5.shape[0] >= 30:
            if jsd:
                metric = "jsd"
                x2 = vvv5[vvv5["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv5[vvv5["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf5.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv5, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out5.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
            else:
                metric = "abs logfc"
                x2 = vvv5[vvv5["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv5[vvv5["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf5.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv5, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out5.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
        if v_tf5.shape[0] >= 30 and yvalls_tf6.shape[0] >= 30:    
            if jsd:
                metric = "jsd"
                x2 = vvv6[vvv6["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv6[vvv6["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf6.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv6, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out6.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
            else:
                metric = "abs logfc"
                x2 = vvv6[vvv6["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv6[vvv6["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf6.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv6, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out6.append([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])

        #print([tf.split("_")[0], tf.split("_")[1], cut, metric_name, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
if jsd:
    metric_name = "JSD"
else:
    metric_name = "abs logfc"

df = pd.DataFrame(out1)
df.columns = ["TF_JASPAR_ID", "TF_Name", "Cutoff", "Statistic", "Median fixed " + metric_name, "Number fixed variants", "Median polymorphic " + metric_name, "Number polymorphic variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]
df.sort_values("Fisher exact p-value")
df.to_csv("TFBS_Results/" + dl_prefix + "/" + prefix1 + ".txt", sep = "\t", index = False)

df = pd.DataFrame(out2)
df.columns = ["TF_JASPAR_ID", "TF_Name", "Cutoff", "Statistic", "Median fixed " + metric_name, "Number fixed variants", "Median polymorphic " + metric_name, "Number polymorphic variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]
df.sort_values("Fisher exact p-value")
df.to_csv("TFBS_Results/" + dl_prefix + "/" + prefix2 + ".txt", sep = "\t", index = False)

df = pd.DataFrame(out3)
df.columns = ["TF_JASPAR_ID", "TF_Name", "Cutoff", "Statistic", "Median fixed " + metric_name, "Number fixed variants", "Median polymorphic " + metric_name, "Number polymorphic variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]
df.sort_values("Fisher exact p-value")
df.to_csv("TFBS_Results/" + dl_prefix + "/" + prefix3 + ".txt", sep = "\t", index = False)

df = pd.DataFrame(out4)
df.columns = ["TF_JASPAR_ID", "TF_Name", "Cutoff", "Statistic", "Median fixed " + metric_name, "Number fixed variants", "Median polymorphic " + metric_name, "Number polymorphic variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]
df.sort_values("Fisher exact p-value")
df.to_csv("TFBS_Results/" + dl_prefix + "/" + prefix4 + ".txt", sep = "\t", index = False)

df = pd.DataFrame(out5)
df.columns = ["TF_JASPAR_ID", "TF_Name", "Cutoff", "Statistic", "Median fixed " + metric_name, "Number fixed variants", "Median polymorphic " + metric_name, "Number polymorphic variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]
df.sort_values("Fisher exact p-value")
df.to_csv("TFBS_Results/" + dl_prefix + "/" + prefix5 + ".txt", sep = "\t", index = False)

df = pd.DataFrame(out6)
df.columns = ["TF_JASPAR_ID", "TF_Name", "Cutoff", "Statistic", "Median fixed " + metric_name, "Number fixed variants", "Median polymorphic " + metric_name, "Number polymorphic variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]
df.sort_values("Fisher exact p-value")
df.to_csv("TFBS_Results/" + dl_prefix + "/" + prefix6 + ".txt", sep = "\t", index = False)

