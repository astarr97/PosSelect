import sys

file = sys.argv[1]

assert(".bed" in file)

o = open(file)
out = open(file.replace(".bed", ".txt"), 'w')
out.write("\t".join(["Position", "PhyloP447", "PhastCons447", "SpecSup447"]) + "\n")
for line in o:
    l = line.split("\t")
    out.write("\t".join([l[0] + ":" + l[2], l[6], l[7], l[8]]) + "\n")
o.close()
out.close()
