v = open("Human_Ape_Rhe_SNPs_WCons.bed")
c = 0
out = open("VEP_Input_Genome_Wide_" + str(c//600000) + ".txt", 'w')
for line in v:
    row = line.split("\t")
    if c:
        c += 1
        if c % 600000 == 0:
            out.close()
            out = open("VEP_Input_Genome_Wide_" + str(c//600000) + ".txt", 'w')
        else:
            out.write("\t".join([row[0].replace("chr", ""), row[2], row[2], row[3].replace("|", "/"), "+"]) + "\n")
            out.write("\t".join([row[0].replace("chr", ""), row[2], row[2], row[3].replace("|", "/"), "-"]) + "\n")
    else:
        c += 1
v.close()