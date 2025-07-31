o = open("All_Just_AF_0.001_P100_P30_C100_C30_P241_P470_C470.bed")
out = open("All_Just_AF_0.001_P100_P30_C100_C30_P241_P470_C470_Sum.bed", 'w')

for line in o:
    l = line.replace("\n", "").split("\t")
    out.write("\t".join([l[0] + ":" + l[2] + "-" + l[2], l[6], l[11], l[16], l[21], l[26], l[31], l[36]]) + "\n")
    
out.close()