import sys

file = sys.argv[1]
o = open(file)
out = open(file.replace(".bed", "_fixed.bed"), 'w')

for line in o:
    out.write("\t".join(line.split("\t")[0:3] + [line.split("\t")[0] + ":" + line.split("\t")[2] + "-" + line.split("\t")[2]] + [line.split("\t")[3]]))
    
o.close()
out.close()
