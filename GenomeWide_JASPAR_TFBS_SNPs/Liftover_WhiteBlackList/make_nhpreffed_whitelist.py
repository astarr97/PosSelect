o = open("human_referenced_chp_hum_snps_sorted.GorGor6.Hg38.whitelist.bed")
keep = []
for line in o:
    l = line.replace("\n", "").split("\t")
    keep.append(l[4])
import pandas as pd

v = pd.read_csv("human_referenced_chp_hum_snps_sorted.GorGor6.bed", sep = "\t", header = None)
v = v[v[4].isin(keep)]

v.to_csv("human_referenced_chp_hum_snps_sorted.GorGor6.whitelist.bed", sep = "\t", index = False, header = False)

o.close()

#Run after this
#python process_lifted_snps.py human_referenced_chp_hum_snps_sorted.GorGor6.whitelist.bed
#sort -k1,1 human_referenced_chp_hum_snps_sorted.GorGor6.whitelist.proc.bed > human_referenced_chp_hum_snps_sorted.GorGor6.whitelist.procsort.bed
