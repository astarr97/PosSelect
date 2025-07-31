import sys

file = sys.argv[1]
assert(".bed" in file)
o = open(file)
out = open(file.replace(".bed", "_rm.bed"), 'w')

for line in o:
    l = line.split("\t")
    if l[4] != ".":
        out.write("\t".join(l[0:4]) + "\n")

o.close()
out.close()
