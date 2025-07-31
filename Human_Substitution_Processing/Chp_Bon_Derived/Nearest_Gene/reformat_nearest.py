import sys
file = sys.argv[1]
o = open(file)
assert("ToReformat.bed" in file)
out = open(file.replace("ToReformat.bed", "Final.bed"), 'w')

for line in o:
    l = line.split("\t")
    out.write("\t".join(l[3:]))
o.close()
out.close()
