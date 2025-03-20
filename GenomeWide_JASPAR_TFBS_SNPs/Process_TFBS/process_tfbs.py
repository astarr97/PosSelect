import sys

file = sys.argv[1]
assert(".bed.snps.sort.bed" in file)

o = open(file)
out = open(file.replace(".bed.snps.sort.bed", ".snps.proc.bed"), 'w')

all_tfbs = []
prev_id = ""
for line in o:
    l = line.replace("\n", "").split("\t")
    if prev_id != l[9]:
        if prev_id:
            out.write("\t".join([prev_id, str(max(all_tfbs))]) + "\n")
        prev_id = l[9]
        all_tfbs = [int(l[3])]
    else:
        all_tfbs.append(int(l[3]))
o.close()
out.close()
