import sys

file = sys.argv[1]

o = open(file)
out = open(file.replace(".bed", ".rear.bed"), 'w')

for line in o:
    l = line.replace("\n", "").split("\t")
    out.write("\t".join(l[5:] + l[0:5]) + "\n")
o.close()
out.close()
