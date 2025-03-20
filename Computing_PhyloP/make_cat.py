import os




for chrom in ["chr" + str(x) for x in range(1, 23)] + ["chrX", "chrY"]:
    out = open("cat_" + chrom + ".sh", 'w')
    out.write("#!/bin/bash\n#SBATCH --time=32:00:00\n#SBATCH -p hbfraser\n#SBATCH --mem=16GB\n\n")
    str1 = "cat "
    str2 = "cat "
    str3 = "cat "
    str4 = "cat "
    files = os.listdir(chrom)
    tot = 0
    for i in files:
        if ".dedup.MskHum.PhastCons.scores.bed" in i:
            tot += 1
    for i in range(tot):
        str1 = str1 + chrom + "." + str(i) + "_SpecSup.dedup.MskHum.txt "
        str2 = str2 + chrom + "." + str(i) + ".dedup.MskHum.PhastCons.regions.bed "
        str3 = str3 + chrom + "." + str(i) + ".dedup.MskHum.PhastCons.scores.bed "
        str4 = str4 + chrom + "." + str(i) + ".PhyloP.bed "
    out.write("cd " + chrom + "\n")
    out.write(str1 + "> " + chrom + ".MskHum.SpecSup.txt\n")
    out.write(str2 + "> " + chrom + ".MskHum.PhastCons.regions.bed\n")
    out.write(str3 + "> " + chrom + ".MskHum.PhastCons.scores.bed\n")
    out.write(str4 + "> " + chrom + ".MskHum.PhyloP.bed\n\n")
    
    out.write("mv " + chrom + ".MskHum.PhyloP.bed " + chrom + ".MskHum.PhyloP.ToFix.bed\n")
    out.write("mv " + chrom + ".MskHum.PhastCons.scores.bed " + chrom + ".MskHum.PhastCons.scores.ToFix.bed\n")

    out.write("python fix_chrom.py " + chrom + ".MskHum.PhyloP.ToFix.bed " + chrom + "\n")
    out.write("python fix_chrom.py " + chrom + ".MskHum.PhastCons.scores.ToFix.bed " + chrom + "\n")
    out.write("bedtools intersect -sorted -wao -a " + chrom + ".MskHum.PhyloP.bed -b " + chrom + ".MskHum.PhastCons.scores.bed > " + chrom + ".MskHum.PhyloP.PhastCons.bed\n")
    out.write("python spec_sup_make_bed.py " + chrom + ".MskHum.SpecSup.txt\n")
    out.write("bedtools intersect -sorted -wao -a " + chrom + ".MskHum.PhyloP.PhastCons.bed -b " + chrom + ".MskHum.SpecSup.bed > " + chrom + ".MskHum.PhyloP.PhastCons.SpecSup.ToFix.bed\n")
    out.write("python fix_new_447.py " + chrom + ".MskHum.PhyloP.PhastCons.SpecSup.ToFix.bed\n")
    out.write("cd ..\n\n")
    out.close()