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
from scipy.stats import zscore
import sys

chpreffed = int(sys.argv[1])
derived = sys.argv[2]

if chpreffed:
    suff = "_Chpreffed"
else:
    suff = ""
    
dl_path = "/oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Variants_Grouped/"


o = open("Config_ToRun.txt")


group1 = ["KosoyRoussosControlMicroglia", "LiangSteinNeuron", "AdultHeartVentricularCardiomyocyte", "AdultProximalTubule", "FetalArterialECs", "FetalChondrocytes", "SertoliMale", "ASCT"]
group2 = ["FetalGonadImmuneFemale", "ITL23", "AdultHeartSmoothMuscle", "AdultLoopOfHenle", "FetalHeartPericytes", "FetalHeartCardiacFibroblasts", "preGC_IIaFemale", "FetalBrainCOP"]

use = group1 + group2

dls = []
for line in o:
    if line.replace("\n", "") in use:
        dls.append(line.replace("\n", ""))
        
o.close()

if chpreffed:
    out = open("All_Chpreffed_" + derived + "_EE_dif_0.025.txt", 'w')
    out2 = open("All_Chpreffed_" + derived + "_EE_dif_-0.025.txt", 'w')
else:
    out = open("All_Humreffed_" + derived + "EE_dif_0.025.txt", 'w')
    out2 = open("All_Humreffed_" + derived + "EE_dif_-0.025.txt", 'w')

print(dls)

new_v = 0
ind = 1

for dl_prefix in dls:
    print(dl_prefix)
    if derived == "ChimpDerived":
        v = pd.read_csv("Chimp_For_RCAG_Filtered.txt", sep = "\t")

        v = v[v["NearestGene"] != "."]
        v = v[v["NearestDist"] != "."]
    elif derived == "HumanDerived":
        v, vv = read_noncoding_data_fast(path = "./", maf_cut = 0.25, spec_sup = 0)
        
        vv = 0
    else:
        print("Not a valid derived")
        assert(False)
    
    #Trying it with the deep learning predictions
    dl_fixed = pd.read_csv(dl_path + dl_prefix + "_" + derived + suff + ".txt", sep = "\t")
    dl_fixed = dl_fixed.set_index("variant_id")
    dl_fixed = dl_fixed[["logfc", "allele1_pred_counts", "allele2_pred_counts"]]
    dl_fixed = dl_fixed[dl_fixed["logfc"] != "logfc"]
    dl_fixed["abs logfc"] = np.abs(dl_fixed["logfc"].astype(float))
    v.index = v["Position"]
    
    v = v.join(dl_fixed).dropna()
    v = v.drop_duplicates("Position")
    
    cts_metric = "EE"
    
    cts_fixed = pd.read_csv(dl_path + dl_prefix + "_EEs_" + derived + suff + "_WithNeuron.txt", sep = "\t").set_index("Position")
    
    cts_fixed = cts_fixed[["EE_Allele1", "EE_Allele2"]]
    
    v = v.join(cts_fixed).dropna().drop_duplicates("Position")
    
    v.index = v["Position"]
    
    v["EE_Allele1"] = v["EE_Allele1"].astype(float)
    v["EE_Allele2"] = v["EE_Allele2"].astype(float)
    
    
    
    if derived == "HumanDerived":
        if chpreffed:
            v["logfc"] = -v["logfc"].astype(float)
            v["abs logfc"] = v["abs logfc"].astype(float)
            v["EE_Dif"] = v["EE_Allele2"] - v["EE_Allele1"]
        else:
            v["logfc"] = v["logfc"].astype(float)
            v["abs logfc"] = v["abs logfc"].astype(float)
            v["EE_Dif"] = v["EE_Allele1"] - v["EE_Allele2"]
    elif derived == "ChimpDerived":
        if chpreffed:
            v["logfc"] = v["logfc"].astype(float)
            v["abs logfc"] = v["abs logfc"].astype(float)
            v["EE_Dif"] = v["EE_Allele1"] - v["EE_Allele2"]
        else:
            v["logfc"] = -v["logfc"].astype(float)
            v["abs logfc"] = v["abs logfc"].astype(float)
            v["EE_Dif"] = v["EE_Allele2"] - v["EE_Allele1"]
    
    v["allele1_pred_counts"] = v["allele1_pred_counts"].astype(float)
    v["allele2_pred_counts"] = v["allele2_pred_counts"].astype(float)
    
    startSpecSup = 0
    ee_cutoff = 0.025
    pos_cut = ee_cutoff
    neg_cut = -ee_cutoff
    v = v[v["SpecSup447"] > startSpecSup]
    
    print(ee_cutoff, -ee_cutoff)
    
    v_bl = v[v["EE_Dif"] <= neg_cut]
    v_bg = v[v["EE_Dif"] >= pos_cut]
    
    for index, row in v_bg.iterrows():
        out.write("\t".join([row["Position"], dl_prefix]) + "\n")
    for index, row in v_bl.iterrows():
        out2.write("\t".join([row["Position"], dl_prefix]) + "\n")
    
    
out.close()
out2.close()
