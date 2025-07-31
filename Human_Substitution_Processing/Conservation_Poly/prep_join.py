import sys

AF = sys.argv[1]
cons = sys.argv[2]

o = open(AF)
out = open(AF.replace(".bed", "_ToJoin.txt"), 'w')

for line in o:
    l = line.split("\t")
    out.write("\t".join([l[0] + ":" + l[2] + "-" + l[2]] + l[3:]))

o.close()
out.close()

o = open(cons)
out = open(cons.replace(".bed", "_ToJoin.txt"), 'w')

for line in o:
    l = line.split("\t")
    out.write("\t".join(l[3:]))
o.close()
out.close()
