import sys

file = sys.argv[1]
o = open(file)
out = open("HumChpBon_GorOrg_SNPs.bed", 'w')

for line in o:
    k = line.replace("\n", "").split("\t")[3].split("|")
    if k[0] == k[2] and k[0] == k[3] and k[1] == k[4]:
        out.write(line)
o.close()
