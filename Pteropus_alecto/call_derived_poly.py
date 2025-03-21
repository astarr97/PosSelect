o = open("bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.PhyloP.NearestGene.SpecSup.Ready.bed")
out = open("Poly_Pteropus_alecto.bed", 'w')

for line in o:
    l = line.replace("\n", "").split("\t")
    if l[6] != "N" and l[6] != "." and l[7] != "." and l[7] != "N" and l[8] != "." and l[8] != "N":
        der = "Amb"
        daf = "Amb"
        if l[3] == l[6] or l[4] == l[6]:
            if l[7] == l[8]:
                if l[3] == l[7]:
                    der = l[4]
                    daf = l[5]
                elif l[4] == l[7]:
                    der = l[3]
                    daf = str(1-float(l[5]))
        out.write("\t".join(l + [der, daf]) + "\n")
        
o.close()
out.close()
