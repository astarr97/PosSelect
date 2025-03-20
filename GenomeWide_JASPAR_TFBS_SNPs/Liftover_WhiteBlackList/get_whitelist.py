o = open("human_referenced_chp_hum_snps_sorted.PanTro6.Hg38.bed")
out = open("human_referenced_chp_hum_snps_sorted.PanTro6.Hg38.whitelist.bed", 'w')
out2 = open("human_referenced_chp_hum_snps_sorted.PanTro6.Hg38.blacklist.bed", 'w')
for line in o:
    l = line.split("\t")
    if int(l[2]) == int(l[4].split(":")[1]) and l[0] == l[4].split(":")[0]:
        out.write(line)
    else:
        out2.write(l[4])
o.close()
out.close()

o = open("human_referenced_chp_hum_snps_sorted.PanTro6.Hg38.err")
for line in o:
    if "#" not in line:
        out2.write(line.split("\t")[4])
o.close()

o = open("human_referenced_chp_hum_snps_sorted.PanTro6.err")
for line in o:
    if "#" not in line:
        out2.write(line.split("\t")[4])
o.close()
