import sys

file = sys.argv[1]
chrom = sys.argv[2]

assert(".ToFix.bed" in file)

o = open(file)
out = open(file.replace(".ToFix.bed", ".bed"), 'w')

for line in o:
    l = line.split("\t")
    l[0] = chrom
    out.write("\t".join(l))
out.close()
o.close()

