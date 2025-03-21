from collections import Counter
import numpy as np

d_chrom = {}
o = open("sequence_report_Pteropus_Alecto.txt")
for line in o:
    l = line.replace("\n", "").split("\t")
    d_chrom[l[8]] = l[5]
o.close()

o = open("bat.indel99-90.VQSR.vcf")
out = open("bat.indel99-90.VQSR.txt", 'w')
#out.write("Chrom\tPos1\tPos2\tPteropus_alecto\n")
filter_col = 6

def proc_line(l):
    x = l[3].split(",") + l[4].split(",")
    d = {}
    for i in range(len(x)):
        j = x[i]
        if len(j) > 1:
            return False
        d[str(i)] = j
    return d
    
def proc_spec(l, d):
    d_m = Counter(np.ravel([x.split(":")[0].split("/") for x in l]))
    if "." in d_m.keys():
        d_m.pop(".")
    tot_ms = sum(d_m.values())
    s_m = ""
    for key in d_m.keys():
        if s_m:
            s_m = s_m + ";"
        s_m = s_m + d[key] + "," + str(round(d_m[key]/tot_ms, 3)) + "," + str(d_m[key])
    return s_m

for line in o:
    if not line.startswith("#"):
        l = line.replace("\n", "").split("\t")
        if "PASS" == l[6]:
            d = proc_line(l)
            if type(d) is not bool:
                #Use list comprehension to count the alleles (0, 1, 2, maybe 3 if it is quadallelic)
                #Then can use the dictionary (d) to get allele frequency, total number of alleles for each subspecies/species 
                #Needs to deal with "." in the list we need to comprehend
                l = np.array(l)
                l_pt = list(l[9:])
                try:
                    new_chrom = d_chrom[l[0]]
                except:
                    new_chrom = l[0]
                    print("Failed to find: " + str(l0))
                out.write("\t".join([new_chrom, str(int(l[1]) - 1), l[1], proc_spec(l_pt, d)]) + "\n")
o.close()
out.close()
