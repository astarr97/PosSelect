o = open("bat.indel99-90.VQSR.sort.bed")
out = open("bat.indel99-90.VQSR.sort.MAF0.1-0.9.bed", 'w')


for line in o:
    l = line.replace("\n", "").split("\t")
    afs = l[3].split(";")
    if len(afs) > 1:
        afs.sort(key = lambda x: float(x.split(",")[1]))
        maf = float(afs[-2].split(",")[1])
        ma = afs[-2].split(",")[0]
        al = float(afs[-2].split(",")[2])
        maj = afs[-1].split(",")[0]
        if maf >= 0.1 and maf <= 0.9 and al >= 5:
            out.write("\t".join(l[0:3] + [maj, ma, str(maf)]) + "\n")
o.close()
out.close()
