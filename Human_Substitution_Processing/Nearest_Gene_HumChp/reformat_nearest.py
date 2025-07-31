o = open("HumChp_SNPs_AnnoAll_ToReformat.bed")
out = open("HumChp_SNPs_AnnoAll_Final.bed", 'w')

for line in o:
    l = line.split("\t")
    out.write("\t".join(l[3:]))
o.close()
out.close()
