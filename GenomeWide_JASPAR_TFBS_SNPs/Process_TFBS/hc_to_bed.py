import sys

file = sys.argv[1]

o = open(file)
out = open(file.replace(".bed", ".actual.bed"), 'w')

"""for line in o:
    l = line.replace("\n", "").split(" ")
    out.write("\t".join([l[0].split(":")[0], str(int(l[0].split(":")[1]) - 1), l[0].split(":")[1], l[5]]) + "\n")
o.close()
out.close()"""

for line in o:
    l = line.replace("\n", "").split(" ")
    out.write("\t".join([l[0], l[5]]) + "\n")
o.close()
out.close()
