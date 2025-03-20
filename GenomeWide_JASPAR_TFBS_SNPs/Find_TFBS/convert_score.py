import sys
import numpy as np

file = sys.argv[1]
conversion = sys.argv[2]

def convert(i):
    return -round(np.log10(float(i))*100)

o = open(conversion)
d_conv = {}
for line in o:
    l = line.strip().split(" ")
    d_conv[float(l[0])] = float(l[1])
o.close()

assert(".out" in file)
o = open(file)
out = open(file.replace(".out", ".bed"), 'w')
for line in o:
    l = line.replace("\n", "").split("\t")
    x = float(l[4])
    out.write("\t".join(l[0:3] + [str(convert(d_conv[x])), l[5]]) + "\n")
o.close()
out.close()