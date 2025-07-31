import sys

file = sys.argv[1]
o = open(file)
out = open(file.replace(".bed", "_New.bed"), 'w')

for line in o:
    l = line.split("\t")
    out.write("\t".join([l[0], l[1], l[2], l[0] + ":" + l[2] + "-" + l[2], l[3], l[4], l[5]]) + "\n")
o.close()
out.close()
