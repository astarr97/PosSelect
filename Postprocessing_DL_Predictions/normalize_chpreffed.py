import pandas as pd
import numpy as np
from scipy.stats import zscore
import os

for file in os.listdir():
    if "HumanDerived" in file or "ChimpDerived" in file:
        if "Chpreffed.fixed.txt" in file:
            print(file)
            v = pd.read_csv(file, sep = "\t")
            v = v.sort_values("variant_id")
            v["allele1_pred_counts"] = (v["allele1_pred_counts"]*1000000)/np.sum(v["allele1_pred_counts"])
            v["allele2_pred_counts"] = (v["allele2_pred_counts"]*1000000)/np.sum(v["allele2_pred_counts"])
            v["logfc"] = zscore(v["logfc"])
            v["abs logfc"] = zscore(np.abs(v["logfc"]))
            v["jsd"] = zscore(v["jsd"])
            v.to_csv(file.replace(".txt", ".normed.sort.txt"), sep = "\t", index = False)
