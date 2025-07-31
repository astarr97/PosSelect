o = open("HumBon_SNPs_Chp_ToJoin.txt")
out = open("Bonobo_Derived_Variants.txt", 'w')
for line in o:
    l = line.replace("\n", "").split("\t")
    x = l[1].split("|")
    if x[0] == x[2]:
        out.write(line)
out.close()
o.close()
