import pandas as pd
import numpy as np
import sys

#closest is the file from bedtools closest, enh is the file of enhancer peaks, out_name is the prefix of the out file.
closest = sys.argv[1]
o = open(closest)
out = open(closest.replace(".bed", "_AnnoClosest.bed"), "w")
prev = 0
genes = []
dists = []
prev_l = 0
for line in o:
    l = line.replace("\n", "").split("\t")
    d = round(abs(int(l[2]) - (int(l[8]) + int(l[9]))/2))
    if prev:
        if l[3] + l[5] + l[6] != prev:
            #Be sure to edit this to include the distance to the TSS as well as the gene names
            #Note, we will lose some records on alternative chromosomes that do not have at least 2 nearest genes!
            #This is fine as we will filter these later anyway
            genes_seen = []
            dists2 = []
            for i in range(len(genes)):
                g = genes[i]
                if len(genes_seen) == 2:
                    out.write("\t".join(prev_l[0:7] + ["PromoterDistal_" + genes_seen[0] + "_" + str(dists[0]) + "_" + genes_seen[1] + "_" + str(dists[1])]) + "\n")
                    break
                elif g in genes_seen:
                    pass
                else:
                    genes_seen.append(g)
                    dists2.append(d)
            prev = l[3] + l[5] + l[6]
            genes = [l[10]]
            dists = [d]
            prev_l = l
        else:
            genes.append(l[10])
            dists.append(d)
            prev_l = l
    else:
        prev = l[3] + l[5] + l[6]
        genes = [l[10]]
        dists = [d]
        prev_l = l

o.close()
out.close()
