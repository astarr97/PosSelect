import sys

file = sys.argv[1]
assert(".bed.snps.sort.bed" in file)

o = open(file)
out = open(file.replace(".bed.snps.sort.bed", ".snps.proc.bed"), 'w')

all_tfbs = []
prev_id = ""
for line in o:
    l = line.replace("\n", "").split("\t")
    if prev_id != l[0] + ":" +  l[1] + ":" + l[2] + ":" + l[3]:
        if prev_id:
            b = prev_id.split(":")
            out.write("\t".join([b[0] + ":" + b[2], b[3], str(max(all_tfbs))]) + "\n")
        prev_id = l[0] + ":" +  l[1] + ":" + l[2] + ":" + l[3]
        all_tfbs = [int(l[8])]
    else:
        all_tfbs.append(int(l[8]))
o.close()
out.close()
