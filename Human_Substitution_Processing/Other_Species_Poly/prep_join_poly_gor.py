import sys

file = sys.argv[1]
assert("_rm.bed" in file)
o = open(file)
out = open(file.replace("_rm.bed", "_ToJoin.txt"), 'w')

for line in o:
    l = line.split("\t")
    out.write(l[3])
o.close()
out.close()

