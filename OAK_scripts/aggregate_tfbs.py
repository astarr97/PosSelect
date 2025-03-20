import pandas as pd
import sys
import os
import numpy as np
from scipy.stats import norm
from statsmodels.stats.multitest import fdrcorrection

path = sys.argv[1]
file = sys.argv[2]

path="/oak/stanford/groups/hbfraser/astarr/PosSelect_Clean/TFBS_Results_Permute/AdultProximalTubule/"
file="TFBS_SpecSup0_PS_PhastCons-1_Unpaired_MAFCut0.25_TEST_AdultProximalTubule_AbsLogfc_HrefDneCrefOnly_All"

x = pd.read_csv(path + file + ".txt", sep = "\t")

old = 0
ind = 1
for f in os.listdir(path + "Permutations"):
    if file in f:
        new = pd.read_csv(path + "Permutations/" + f, sep = "\t")
        new = new.set_index("TF_JASPAR_ID")[["alpha"]]
        new.columns = ["alpha" + str(f.replace(file, "").replace(".txt", ""))]
        if ind:
            old = new
            ind = 0
        else:
            old = new.join(old, how = "outer")

x.index = x["TF_JASPAR_ID"]
x = x.sort_index()
old = old.sort_index()

zs = []
ps = []
for index, row in x.iterrows():
    shuffle_alphas = list(old.loc[index])
    z = (row["alpha"] - np.mean(shuffle_alphas))/np.std(shuffle_alphas)
    permute_p = norm.sf(z)
    zs.append(z)
    ps.append(permute_p)

x["Z-score"] = zs
x["P-value"] = ps
x = x[x["Tag"] == "dc > 0.1, likely stable"]
x["FDR"] = fdrcorrection(x["P-value"])[1]
x.sort_values("P-value").to_csv(path + "/" + file + "_WithPermute2.txt", sep = "\t")
