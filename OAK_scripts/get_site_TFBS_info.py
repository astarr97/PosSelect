import sys
import gzip
import os

pos = sys.argv[1]

out = open("TF_Data/TFBS_Info_" + pos + ".txt", 'w')
for file in os.listdir("TFBS_Fixed"):
    o = gzip.open('TFBS_Fixed/' + file, 'rt')
    for line in o:
        if line.split("\t")[0] == pos:
            #print("_".join(file.split("_")[0:2]) + "\t" + line)
            out.write("_".join(file.split("_")[0:2]) + "\t" + line)
            break
    o.close()
out.close()
    