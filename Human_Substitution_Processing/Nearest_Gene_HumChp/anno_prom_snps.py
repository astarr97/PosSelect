import pandas as pd
import numpy as np
import sys

#prom_inter is the file from bedtools intersect, peaklist is the list of peaks, and out is the prefix of the output file
prom_inter = sys.argv[1]
o = open(prom_inter)
out = open(prom_inter.replace(".bed", "_AnnoProm.bed"), "w")
prev = 0
prev_l = 0
genes = []
for line in o:
    l = line.replace("\n", "").split("\t")
    if prev:
        if l[3] != prev:
            out.write("\t".join(prev_l[0:5] + ["_".join(["InPromoter"] + genes)]) + "\n")
            prev = l[3]
            genes = [l[8]]
            prev_l = l
        else:
            genes.append(l[8])
            prev_l = l
    else:
        prev = l[3]
        genes = [l[8]]
        prev_l = l
