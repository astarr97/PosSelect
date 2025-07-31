import sys

file = sys.argv[1]
o = open(file)
out = open("GorOrg_NotHBC_SNPs.bed", 'w')

for line in o:
    k = line.replace("\n", "").split("\t")[3].split("|")
    if k[0] != k[1] and k[2] != k[1] and k[1] == k[4] and k[1] != k[3]:
        out.write(line)
o.close()
