import os

c = 0
for i in ["0.001"]:
    out = open("All_Just_AF_" + i + ".txt", 'w')
    out.write("\t".join(["Chrom", "Pos", "ID", "Ref", "Alt", "AF", "AF_amr", "AF_asj", "AF_eas", "AF_fin", "AF_nfe", "AF_oth"]) + "\n")
    for file in os.listdir():
        if "full_" + i in file:
            o = open(file)
            for line in o:
                c += 1
                l = line.replace("\n", "").split("\t")
                out.write("\t".join([l[0].replace("chrchr", "chr")] + l[1:5] + l[7:15]) + "\n")
            o.close()
    out.close()
