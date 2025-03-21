import os
import pandas as pd
import sys

# Read arguments
inFile = sys.argv[1]
assert(".txt" in inFile)
o = open(inFile)
out = open(inFile.replace(".txt", ".bed"), 'w')

def complement(bp):
    if bp == "A":
        return("T")
    elif bp == "T":
        return("A")
    elif bp == "C":
        return("G")
    else:
        return("C")

for line in o:
    row = line.replace("\n", "").split("\t")
    out.write("\t".join([row[0], str(int(row[1]) - 1), row[1], row[3], row[4]]) + "\n")

o.close()
out.close()
