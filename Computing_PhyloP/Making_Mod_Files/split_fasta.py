o = open("hg38.447way.PrimatesAnc000.fasta")
out = open("hg38.447way.PrimatesAnc000.split" + str(0) + ".fasta", 'w')
c = 0
last_c = 2000000
for line in o:
    c += 1
    if ">" in line:
        if c > last_c:
            print(c, last_c)
            out.close()
            out = open("hg38.447way.PrimatesAnc000.split" + str(last_c//2000000) + ".fasta", 'w')
            out.write(line)
            last_c += 2000000
        else:
            out.write(line)
    else:
        out.write(line)
o.close()
out.close()
