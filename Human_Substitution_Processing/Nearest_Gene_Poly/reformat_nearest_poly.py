o = open("HumPoly_SNPs_AnnoAll_ToReformat.bed")
out = open("HumPoly_SNPs_AnnoAll_Final.bed", 'w')

for line in o:
    l = line.split("\t")
    out.write("\t".join([l[3], l[7]]))
o.close()
out.close()
