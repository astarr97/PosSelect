import pandas as pd



o = open("human_referenced_chp_hum_snps_sorted.PanTro6.Hg38.blacklist.bed")
filt_out = []
for line in o:
    filt_out.append(line.replace("\n", ""))
o.close()

v = pd.read_csv("human_referenced_chp_hum_snps_sorted.RheMac10.Hg38.blacklist.bed", header = None)
v = v[~v[0].isin(filt_out)]
v.to_csv("human_referenced_chp_hum_snps_sorted.RheMac10.Hg38.blacklist.filt.bed", sep = "\t", header = False, index = False)
"""o = open("human_referenced_chp_hum_snps_sorted.RheMac10.Hg38.blacklist.bed")
out = open("human_referenced_chp_hum_snps_sorted.RheMac10.Hg38.blacklist.filt.bed", 'w')

for line in o:
    if line.replace("\n", "") not in filt_out:
        out.write(line)
o.close()
out.close()
"""