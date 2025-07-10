import os
import numpy as np
l = []
d = {}
for folder in os.listdir():
    if "." not in folder and folder != "Linnarsson_Trimester1_Redo":
        for file in os.listdir(folder):
            if "fragments.tsv" in file:
                if "_".join(file.split("_")[2:]) not in d.keys():
                    d["_".join(file.split("_")[2:])] = [folder + "/" + file]
                else:
                    d["_".join(file.split("_")[2:])].append(folder + "/" + file)
print(len(np.unique(list(d.keys()))))

c = 0
out = open("cat_and_bgzip0.sh", 'w')
out.write("#!/bin/bash\n#SBATCH --time=72:00:00\n#SBATCH -p hbfraser\n#SBATCH --mem=32GB\n#SBATCH -c 1\n\n")
for key in d.keys():
    c += 1
    out.write("cat " + " ".join(d[key]) + " > " + key + "\n")
    out.write("sort -k1,1 -k2,2n " + key + " > " + key.replace(".tsv", ".sort.tsv") + "\n")
    out.write("macs2 callpeak -t " + key.replace(".tsv", ".sort.tsv") + " -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n " + key.replace(".fragments.tsv", "") + "\n")
    out.write("mv " + key.replace(".fragments.tsv", "") + "_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks\n")
    out.write("bgzip " + key.replace(".tsv", ".sort.tsv") + "\n")
    out.write("tabix -p bed " + key.replace(".tsv", ".sort.tsv") + ".gz" + "\n")
    out.write("mv " + key.replace(".tsv", ".sort.tsv") + ".gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads\n")
    out.write("mv " + key.replace(".tsv", ".sort.tsv") + ".gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads\n\n")
    if c % 20 == 0:
        out.close()
        out = open("cat_and_bgzip" + str(c//20) + ".sh", 'w')
        out.write("#!/bin/bash\n#SBATCH --time=120:00:00\n#SBATCH -p hbfraser\n#SBATCH --mem=32GB\n#SBATCH -c 1\n\n")
out.close()
