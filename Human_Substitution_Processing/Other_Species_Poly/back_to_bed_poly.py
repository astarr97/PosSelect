import sys

file = sys.argv[1]
assert(".txt" in file)
o = open(file)
out = open(file.replace(".txt", ".bed"), 'w')

for line in o:
    l = line.split(" ")
    x = l[0].split(":")[1]
    out.write("\t".join([l[0].split(":")[0], str(int(x.split("-")[0]) - 1), x.split("-")[0], l[0]]) + "\n")
o.close()
out.close()
