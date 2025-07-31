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

hfont = {'fontname':'Arial'}
plt.rcParams["font.family"] = "Arial"

#Code borrowed heavily from here: https://stackoverflow.com/questions/62375034/find-non-overlapping-area-between-two-kde-plots
plt.rcParams.update(
    {"text.usetex": False}
)

metric = " ".join(sys.argv[1].split("_"))
spec_sup = float(sys.argv[2])
maf_cut = float(sys.argv[3])
idents = sys.argv[4].split(",")
cut = int(sys.argv[5])
phylop_cut = -100


if metric == "PhyloP447":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = maf_cut, spec_sup = spec_sup)
    yvalls = add_unfold(yvalls)
elif metric == "abs logfc":
    v, yvalls = read_noncoding_data_fast(path = "./", maf_cut = maf_cut, spec_sup = spec_sup)
    yvalls = add_unfold(yvalls)
    dl_prefix = sys.argv[6]
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
    
    dl_fixed = dl_fixed[(dl_fixed["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_fixed["allele2_pred_counts"].astype(float) > cutoff_to_use)]
    dl_poly = dl_poly[(dl_poly["allele1_pred_counts"].astype(float) > cutoff_to_use) | (dl_poly["allele2_pred_counts"].astype(float) > cutoff_to_use)]


def prepare_tfbs(file, forp):
    if forp == "Fixed":
        tf_fixed = pd.read_csv("TFBS_Fixed/" + file, sep = "\t", header = None)
        tf_fixed.index = tf_fixed[0]
        tf_fixed = tf_fixed[[0, 1, 2, 4]].replace("<200", 200)
        tf_fixed[1] = tf_fixed[1].astype(float)
        tf_fixed[2] = tf_fixed[2].astype(float)
        tf_fixed[4] = tf_fixed[4].astype(float)
        return tf_fixed
    elif forp == "Poly":
        tf_poly = pd.read_csv("TFBS_Poly/" + file, sep = "\t", header = None)
        tf_poly.index = tf_poly[0]
        tf_poly = tf_poly[[0, 1, 2, 3]].replace("<200", 200)
        tf_poly[1] = tf_poly[1].astype(float)
        tf_poly[2] = tf_poly[2].astype(float)
        tf_poly[3] = tf_poly[3].astype(float)
        return tf_poly
    else:
        assert(False)
        
fixed_files = os.listdir("TFBS_Fixed")
fixed_files.sort()
poly_files = os.listdir("TFBS_Poly")
poly_files.sort()
assert(len(fixed_files) == len(poly_files))

for i in range(len(poly_files)):
    assert(poly_files[i].split("_")[0] == fixed_files[i].split("_")[0])

for i in range(len(poly_files)):
    fixed_file = fixed_files[i]
    poly_file = poly_files[i]
    name = fixed_file.split("_")[0]
    if name in idents:
        
        tf = fixed_file.split("_")[0] + "_" + fixed_file.split("_")[1]
        print(tf)
        #Read in TFBS information
        tf_fixed = prepare_tfbs(fixed_file, "Fixed")
        tf_poly = prepare_tfbs(poly_file, "Poly")
        tf_fixed_filt = tf_fixed[(tf_fixed[1] > cut) | ((tf_fixed[2] > cut) & (tf_fixed[4] > cut))].dropna()
        tf_poly_filt = tf_poly[(tf_poly[1] > cut) | ((tf_poly[2] > cut) & (tf_poly[3] > cut))].dropna()
        v_tf = v.join(tf_fixed_filt).dropna().drop_duplicates("Position")
        print(v_tf)
        yvalls_tf = yvalls.join(tf_poly_filt).dropna().drop_duplicates("Position")
        v_tf.to_csv("TF_Data/" + tf + "_" + str(cut) + "_" + dl_prefix + "_Fixed.csv", sep = ",")
        yvalls_tf.to_csv("TF_Data/" + tf + "_" + str(cut) + "_" + dl_prefix + "_Poly.csv", sep = ",")