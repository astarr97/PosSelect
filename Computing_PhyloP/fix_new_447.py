import sys

file = sys.argv[1]

assert(".ToFix.bed" in file)

o = open(file)
out = open(file.replace(".ToFix.bed", ".bed"), 'w')

#out.write("Position\tPhyloP447New\tPhastCons447New\tSpecSup447New\n")

for line in o:
    l = line.split("\t")
    out.write("\t".join([l[0], l[1], l[2], l[4], l[9], l[14]]) + "\n")
o.close()
out.close()
