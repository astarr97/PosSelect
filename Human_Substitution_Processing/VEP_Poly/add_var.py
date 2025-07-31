import sys

af = sys.argv[1]
vep = sys.argv[2]

assert(".txt" in af)
o = open(af)
out = open(af.replace(".txt", "_Var.txt"), 'w')

for line in o:
    l = line.split(" ")
    l[0] = l[0] + "-" + l[2] + "-" + l[3]
    out.write("\t".join(l))
    
o.close()
out.close()

assert(".txt" in vep)
o = open(vep)
out = open(vep.replace(".txt", "_Var.txt"), 'w')

for line in o:
    l = line.split("\t")
    l[0] = l[0] + "-" + l[1] + "-" + l[2]
    out.write("\t".join(l))