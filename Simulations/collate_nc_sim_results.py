import sys
import os
import pandas as pd
import numpy as np

prefix = sys.argv[1]
out_file = sys.argv[2]
out_dir = sys.argv[3]
suffix = sys.argv[4]

df = pd.DataFrame()
folder = "SubCoeffs" + suffix
files = os.listdir(folder)
ind = 0
c = 0
x = []


for file in files:
    if file.startswith(prefix):
        if prefix == "661_TEST_NONCOD_Bene0.":
            if len(file.split("_")) == 5:
                go = True
            else:
                go = False
        else:
            go = True
        if go:
            print(file)
            c += 1
            folder = "SubCoeffs" + suffix
            o = open(folder + "/" + file)
            x = []
            for line in o:
                x.append(line.replace("Fixed: ", "").replace(" ", ",").replace('"', '').replace("\n", ""))
            dff = pd.DataFrame(x)
            
            
            folder = "vcfs" + suffix
            o = open(folder + "/" + file.replace("_FixedSites.txt", ".vcf"))
            add_af = []
            add_s = []
            for line in o:
                if not line.startswith("#"):
                    l = line.split("\t")
                    x = l[7]
                    af = str(float(x.split(";AC=")[1].split(";")[0])/2/(len(l) - 9))
                    s = x.split(";S=")[1].split(";")[0]
                    if float(af) > 0.1:
                        add_af.append(af)
                        add_s.append(s)
            o.close()
            dff["SubCoeffs_Poly"] = ",".join(add_s)
            dff["AlleleFreqs"] = ",".join(add_af)
            dff["Iteration"] = [int(file.replace(prefix, "").replace("_FixedSites.txt", ""))]
            dff.columns = ["SubCoeffs_Fixed", "SubCoeffs_Poly", "AlleleFreqs", "Iteration"]
            if ind:
                df = pd.concat([df, dff])
            else:
                ind = 1
                df = dff.copy()

df = df.sort_values("Iteration")
print(df)
df.to_csv(out_dir + out_file, sep = "\t", index = False)
