import sys

file = sys.argv[1]
assert(".bed" in file)

o = open(file)
out = open(file.replace(".bed", ".proc.bed"), 'w')

for line in o:
    l = line.replace("\n", "").split("\t")
    out.write("\t".join([l[4], l[0], l[1], l[2], l[3]]) + "\n")
o.close()
out.close()
