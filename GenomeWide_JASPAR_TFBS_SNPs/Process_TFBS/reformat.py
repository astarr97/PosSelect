import sys
import pandas as pd
import numpy as np

file = sys.argv[1]
ind = int(sys.argv[2])
bl = sys.argv[3]

o = open("HumanPoly_MAF0.001." + bl + ".Hg38.blacklist.filt.bed")

bl = []

for line in o:
    bl.append(line.replace("\n", ""))

o.close()
o = open(file)

out = open(file.replace(".pre", ""), 'w')
#First if handles if the TFBS was missing from the species that was just intersectedd
#Second if handles if the TFBS was present
#Third if handles if the TFBS is found in this species but not the others
c = 0
nr = []
for line in o:
    l = line.replace("\n", "").split(" ")
    if len(l) == ind-1:
        nr.append(l)
    elif len(l) == ind:
        out.write("\t".join(l) + "\n")
    elif len(l) == 2:
        out.write("\t".join([l[0]] + ["<200" for x in range(ind-2)] + [l[1]]) + "\n")
    c += 1
o.close()
out.close()

df = pd.DataFrame(nr)
df_bl = df[df[0].isin(bl)]
df_wl = df[~df[0].isin(bl)]

#NA indicates that it is a variant did not liftover
#<200 indicates that the binding site did not meet the minium cutoff of p = 0.01 for the match.

df_bl["bleh"] = np.repeat("NA", df_bl.shape[0])
df_bl.to_csv(file.replace(".pre", ""), header=False, index = False, mode = 'a', sep = "\t")
df_wl["bleh"] = np.repeat("<200", df_wl.shape[0])
df_wl.to_csv(file.replace(".pre", ""), header=False, index = False, mode = 'a', sep = "\t")

"""c = 0
for index, row in df_bl.iterrows():
    if c%10000 == 0:
        print(c)
    c += 1
    out.write("\t".join(list(row) + ["NA"]) + "\n")

for index, row in df_wl.iterrows():
    if c%10000 == 0:
        print(c)
    c += 1
    out.write("\t".join(list(row) + ["<200"]) + "\n")
    
out.close()"""
