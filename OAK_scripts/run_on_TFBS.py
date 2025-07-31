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

metric = " ".join(sys.argv[1].split("_"))
if metric == "abs logfc" or metric == "CNEP":
    window = [0, 1]
elif metric == "PhyloP447":
    window = [-5, 12]

dist = float(sys.argv[2])
spec_sup = float(sys.argv[3])
pc = float(sys.argv[4])
maf_cut = float(sys.argv[5])
cutoffs = sys.argv[6]
rem_repeats = int(sys.argv[7])
paired = int(sys.argv[8])
href_dne_cref_only = int(sys.argv[9])

phylop_cut = -100


if metric == "PhyloP447":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = maf_cut, spec_sup = spec_sup)

elif metric == "abs logfc":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = maf_cut, spec_sup = spec_sup)
    dl_prefix = sys.argv[10]
    just_top20th = int(sys.argv[11])
    dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"
    
    try:
        os.mkdir("TFBS_Results/" + dl_prefix)
    except:
        pass
    
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
    
    if just_top20th:
        dl_fixed = dl_fixed[(dl_fixed["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_fixed["allele2_pred_counts"].astype(float) > cutoff_to_use)]
        dl_poly = dl_poly[(dl_poly["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_poly["allele2_pred_counts"].astype(float) > cutoff_to_use)]
        v = v[v["Position"].isin(dl_fixed.index)]
        yvalls = yvalls[yvalls["Position"].isin(dl_poly.index)]

if rem_repeats:
    v, yvalls = remove_pseudos(v, yvalls)
    v, yvalls = remove_repeats(v, yvalls)

yvalls.index = yvalls["Position"]
yvalls = add_unfold(yvalls)
if href_dne_cref_only:
    yvalls = yvalls[yvalls["Human ref"] != yvalls["Chimp ref"]]

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

out_and = []
out_or = []
out = []

if metric == "abs logfc":
    out_pdf = "TFBS_Results/" + dl_prefix + "/" + sys.argv[-2].replace(".txt", "_FilterNewTEs.txt")
    out_file = "TFBS_Results/" + dl_prefix + "/" + sys.argv[-1].replace(".txt", "_FilterNewTEs.txt")
else:
    out_pdf = "TFBS_Results/" + sys.argv[-2].replace(".txt", "_FilterNewTEs.txt")
    out_file = "TFBS_Results/" + sys.argv[-1].replace(".txt", "_FilterNewTEs.txt")
    
if not paired:
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
            v_tf = v.join(tf_fixed_filt).dropna().drop_duplicates("Position")
            yvalls_tf = yvalls.join(tf_poly_filt).dropna().drop_duplicates("Position")
            print(v_tf.shape[0], yvalls_tf.shape[0])
            vvv = prepare_alpha(v_tf, yvalls_tf, metric)
            if v_tf.shape[0] >= 30 and yvalls_tf.shape[0] >= 30:
                x2 = vvv[vvv["FixedOrPoly"].isin(["Fixed"])][metric].astype(float)
                yvals2 = vvv[vvv["FixedOrPoly"].isin(["Polymorphic"])][metric].astype(float)
                for cuttt in [0.5, 0.6, 0.7, 0.8, 0.9]:
                    x = list(yvalls_tf.sort_values(metric)[metric])
                    cutoff = x[int(floor((len(x)*cuttt)))]
                    alpha = compute_alpha_cutoff(vvv, plot = False, cutoff = cutoff)
                    table1 = alpha[2]
                    table2 = alpha[3]
                    out.append([tf.split("_")[0], tf.split("_")[1], cut, metric, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
                    print([tf.split("_")[0], tf.split("_")[1], cut, metric, np.median(x2), len(x2), np.median(yvals2), len(yvals2), (fisher_exact(table1)[1] + fisher_exact(table2)[1])/2, mwu(x2, yvals2)[1], (fisher_exact(table1, alternative = "greater")[1] + fisher_exact(table2, alternative = "greater")[1])/2, mwu(x2, yvals2, alternative = "greater")[1], alpha[0], alpha[1], table1, table2, cuttt])
    df = pd.DataFrame(out)
    df.columns = ["TF_JASPAR_ID", "TF_Name", "Cutoff", "Statistic", "Median fixed " + metric, "Number fixed variants", "Median polymorphic " + metric, "Number polymorphic variants", "Fisher exact p-value", "MWU p-value", "Fisher exact p-value; alt greater", "MWU p-value; alt greater", "alpha", "Cutoff", "[[dc1, du1], [pc1, pu1]]", "[[dc2, du2], [pc2, pu2]]", "Proportion"]
    df.sort_values("Fisher exact p-value")
    df.to_csv(out_file, sep = "\t", index = False)
#Currently not implemented!
else:
    #Read in the information on the closest variants
    o = open("HumChp_Closest_Poly.txt")
    ind = 0
    c = 0
    chroms = ["chr" + str(x) for x in range(1, 23)] + ["chrX", "chrY"]
    d_fixed = {}
    d_poly = {}
    for chrom in chroms:
        d_fixed[chrom] = []
        d_poly[chrom] = []
    for line in o:
        if ind:
            l = line.replace("\n", "").split("\t")
            chrom = l[0].split(":")[0]
            try:
                if int(l[2]) <= paired and l[0] not in d_fixed[chrom] and l[1] not in d_poly[chrom]:
                    d_fixed[chrom].append(l[0])
                    d_poly[chrom].append(l[1])
            except:
                pass
            c += 1
            if c/10 % 1000000 == 0:
                print(c//10)
        ind = 1
    o.close()
    
    keep_fixed = []
    keep_poly = []
    for key in d_fixed.keys():
        keep_fixed = keep_fixed + d_fixed[key]
        keep_poly = keep_poly + d_poly[key]
    
    print(len(keep_fixed), len(keep_poly))
    
    v = v[v["Position"].isin(keep_fixed)]
    yvalls = yvalls[yvalls["Position"].isin(keep_poly)]
    
    df_fixed_pair = pd.DataFrame(keep_fixed)
    df_fixed_pair["Pair"] = df_fixed_pair.index
    df_fixed_pair = df_fixed_pair.set_index(0)
    
    df_poly_pair = pd.DataFrame(keep_poly)
    df_poly_pair["Pair"] = df_poly_pair.index
    df_poly_pair = df_poly_pair.set_index(0)
    
    v = v.join(df_fixed_pair)
    yvalls = yvalls.join(df_poly_pair)
    v = v.set_index("Pair")
    v.columns = ["Position fixed", "MskHumPhyloP fixed"]
    yvalls = yvalls.set_index("Pair")
    yvalls.columns = ["Position poly", "MAFMaxAcrossAncestry", "MskHumPhyloP poly"]
    v = v.join(yvalls).dropna()
    print(v)
    fixed_stat = v["MskHumPhyloP fixed"].astype(float)
    poly_stat = v["MskHumPhyloP poly"].astype(float)
    dif_stat = np.array(fixed_stat) - np.array(poly_stat)
    up = len(list(np.where(dif_stat > 0)[0]))
    down = len(list(np.where(dif_stat < 0)[0]))
    out_and.append(["All sites", "NA", "NA", metric, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), np.median(dif_stat), wilcoxon(fixed_stat, poly_stat, alternative = "greater")[1], up, down, binom_test(up, up + down)])
    out_or.append(["All sites", "NA", "NA", metric, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), np.median(dif_stat), wilcoxon(fixed_stat, poly_stat, alternative = "greater")[1], up, down, binom_test(up, up + down)])
    print(out_and)
    for i in range(len(poly_files)):
        fixed_file = fixed_files[i]
        poly_file = poly_files[i]
        tf = fixed_file.split("_")[0] + "_" + fixed_file.split("_")[1]
        
        #Read in TFBS information
        tf_fixed = prepare_tfbs(fixed_file, "Fixed")
        tf_poly = prepare_tfbs(poly_file, "Poly")
        
        for cut in cutoffs.split(","):
            cut = int(cut)
            tf_fixed_filt = tf_fixed[(tf_fixed[1] > cut) | ((tf_fixed[2] > cut) & (tf_fixed[4] > cut))].dropna()
            tf_poly_filt = tf_poly[(tf_poly[1] > cut) | ((tf_poly[2] > cut) & (tf_poly[3] > cut))].dropna()
            
            v_tf = v[(v["Position fixed"].isin(tf_fixed_filt.index)) & (v["Position poly"].isin(tf_poly_filt.index))]
            if v_tf.shape[0] >= 100:
                fixed_stat = v_tf["MskHumPhyloP fixed"].astype(float)
                poly_stat = v_tf["MskHumPhyloP poly"].astype(float)
                dif_stat = np.array(fixed_stat) - np.array(poly_stat)
                up = len(list(np.where(dif_stat > 0)[0]))
                down = len(list(np.where(dif_stat < 0)[0]))
                out_and.append([tf.split("_")[0], tf.split("_")[1], cut, statistic, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), np.median(dif_stat), wilcoxon(fixed_stat, poly_stat, alternative = "greater")[1], up, down, binom_test(up, up + down, alternative = "greater")])
            
            v_tf = v[(v["Position fixed"].isin(tf_fixed_filt.index)) | (v["Position poly"].isin(tf_poly_filt.index))]
            if v_tf.shape[0] >= 100:
                fixed_stat = v_tf["MskHumPhyloP fixed"].astype(float)
                poly_stat = v_tf["MskHumPhyloP poly"].astype(float)
                dif_stat = np.array(fixed_stat) - np.array(poly_stat)
                up = len(list(np.where(dif_stat > 0)[0]))
                down = len(list(np.where(dif_stat < 0)[0]))
                out_or.append([tf.split("_")[0], tf.split("_")[1], cut, statistic, np.median(fixed_stat), len(list(fixed_stat)), np.median(poly_stat), len(list(poly_stat)), np.median(dif_stat), wilcoxon(fixed_stat, poly_stat, alternative = "greater")[1], up, down, binom_test(up, up + down, alternative = "greater")])
    out_file = sys.argv[-1]
    assert(".txt" in out_file)
    df = pd.DataFrame(out_and)
    df.columns = ["TF_JASPAR_ID", "TF_Name", "Cutoff", "Statistic", "Median fixed " + statistic, "Number fixed variants", "Median polymorphic " + statistic, "Number polymorphic variants", "Median difference PhyloP", "Wilcoxon signed p-value", "Number higher fixed PhyloP", "Number lower fixed PhyloP", "Binomial p-value"]
    df = df.sort_values("Wilcoxon signed p-value")
    df.to_csv(out_file.replace(".txt", "And.txt"), sep = "\t", index = False)
    
    df = pd.DataFrame(out_and)
    df.columns = ["TF_JASPAR_ID", "TF_Name", "Cutoff", "Statistic", "Median fixed " + statistic, "Number fixed variants", "Median polymorphic " + statistic, "Number polymorphic variants", "Median difference PhyloP", "Wilcoxon signed p-value", "Number higher fixed PhyloP", "Number lower fixed PhyloP", "Binomial p-value"]
    df = df.sort_values("Wilcoxon signed p-value")
    df.to_csv(out_file.replace(".txt", "Or.txt"), sep = "\t", index = False)
    