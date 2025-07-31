o = open("All_Just_AF_0.001_Sorted.bed")
out = open("All_Just_AF_0.001_Sorted_Fixed.bed", 'w')

for line in o:
    out.write("\t".join(line.split("\t")[0:3]) + "\n")
o.close()
out.close()
