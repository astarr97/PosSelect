import os
import sys

ct = sys.argv[1]
folder = sys.argv[2]
der = sys.argv[3]
out_file = sys.argv[4]

out = open(out_file, 'w')
for file in os.listdir(folder):
    if ct in file and "variant_scores.tsv" in file and der in file:
        print(file)
        o = open(folder + "/" + file)
        for line in o:
            l = line.split("\t")
            out.write("\t".join([l[4], l[5], l[6], l[7], l[9]]) + "\n")
        o.close()
out.close()

        
