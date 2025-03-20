import os
import sys

p_cut = float(sys.argv[1])
species = sys.argv[2]
out = open("compute_tfbs_" + species + "0.sh", 'w')
out.write("#!/bin/bash\n")
out.write("#SBATCH --time=72:00:00\n")
out.write("#SBATCH -p hbfraser\n")
out.write("#SBATCH --mem=64GB\n")
out.write("#SBATCH -c 1\n")
out.write("\n")
c = 0
for file in os.listdir():
    if ".scoretab.out" in file:
        c += 1
        if c % 100 == 0:
            out.close()
            out = open("compute_tfbs_" + species + str(c//10) + ".sh", 'w')
            out.write("#!/bin/bash\n")
            out.write("#SBATCH --time=24:00:00\n")
            out.write("#SBATCH -p hbfraser\n")
            out.write("#SBATCH --mem=64GB\n")
            out.write("#SBATCH -c 1\n")
            out.write("\n")
        o = open(file)
        score_cut = 0
        for line in o:
            l = line.strip().split(" ")
            if float(l[1]) >= p_cut:
                score_cut = l[0]
                out_file = file.replace(".mat.scoretab.out", "") + "_cut" + str(score_cut) + "_" + species + "_ms.out"
                out.write("cat ../" + species + ".fasta | ./matrix_scan -m " + file.replace(".scoretab.out", "") + " -c " + str(score_cut) + " | sort -s -k1,1 -k2,2n > " + out_file + "\n")
                out.write("python convert_score.py " + out_file + " " + file + "\n")
                break
print(c)
out.close()
        