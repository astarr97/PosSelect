import sys

file = sys.argv[1]
o = open(file)
out = open(file.replace("_Intersect_PromClosest.bed", "_PromFinal.bed"), 'w')

for line in o:
    l = line.replace("\n", "").split("\t")
    anno = l[7]
    anno2 = l[15]
    if len(anno.split("_")) > 2:
        out.write("\t".join(l[0:3] + [l[3] + "-" + l[5] + "-" + l[6]] + l[4:7] + ["InPromoter_" + "_".join(anno.split("_")[1:])]) + "\n")
    else:
        out.write("\t".join(l[0:3] + [l[3] + "-" + l[5] + "-" + l[6]] + l[4:7] + ["InPromoter_" + anno.split("_")[1] + "_PromoterDistal_" + "_".join(anno2.split("_")[3:])]) + "\n")
o.close()
out.close()
