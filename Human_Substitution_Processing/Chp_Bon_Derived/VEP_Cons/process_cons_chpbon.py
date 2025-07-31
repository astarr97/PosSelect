import sys

file = sys.argv[1]
o = open(file)
out = open(file.replace(".bed", "_Sum.bed"), 'w')

for line in o:
    l = line.replace("\n", "").split("\t")
    out.write("\t".join([l[0] + ":" + l[2] + "-" + l[2], l[3], l[7], l[12], l[17], l[22], l[27], l[32], l[37]]) + "\n")
    
out.close()
