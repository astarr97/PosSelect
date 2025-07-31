o = open("HumPoly_SNPs_Closest_TSS_AnnoClosest.bed")
out = open("HumPoly_SNPs_Closest_TSS_AnnoClosestVar.bed", 'w')

for line in o:
    l = line.split("\t")
    l[3] = l[3] + "-" + l[5] + "-" + l[6]
    out.write("\t".join(l))
o.close()
out.close()
