import sys

file = sys.argv[1]
assert(".almost" in file)

o = open(file)
out = open(file.replace(".almost", ""), "w")

for line in o:
    l = line.replace("\n", "").split(" ")
    if len(l) == 4:
        out.write("\t".join([l[0], l[2], l[3]]) + "\n")
    elif len(l) == 3:
        out.write("\t".join([l[0], l[2], "<200"]) + "\n")
    elif len(l) == 2:
        out.write("\t".join([l[0], "<200", l[1]]) + "\n")
        

o.close()
out.close()
