o = open("Alecto_Vampyrus.difs.sort.WPoly.bed")
out = open("Alecto_Vampyrus.difs.sort.WPoly.Fixed.bed", 'w')

for line in o:
    l = line.split("\t")
    if l[5] == ".":
        out.write("\t".join(l[0:5]) + "\n")

o.close()
out.close()
