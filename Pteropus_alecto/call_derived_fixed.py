o = open("Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.PhyloP.NearestGene.SpecSup.Ready.bed")
out = open("Fixed_Pteropus_alecto.bed", 'w')

for line in o:
    l = line.replace("\n", "").split("\t")
    if l[3] != "N" and l[3] != "." and l[4] != "." and l[4] != "N" and l[5] != "." and l[5] != "N":
        if l[4] == l[5] and l[3] != l[4]:
            out.write("\t".join(l + ["AlectoDerived"]) + "\n")
        elif l[3] == l[5] and l[3] != l[4]:
            out.write("\t".join(l + ["VampyrusDerived"]) + "\n")
        else:
            out.write("\t".join(l + ["Amb"]) + "\n")
o.close()
out.close()
