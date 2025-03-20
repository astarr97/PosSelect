o = open("human_referenced_chp_hum_snps_sorted.bed")
out = open("human_referenced_chp_hum_snps_sorted_anno.bed", 'w')
for line in o:
    l= line.replace("\n", "").split("\t")
    out.write("\t".join(l + [l[0] + ":" + l[2] + "\n"]))
o.close()
out.close()
