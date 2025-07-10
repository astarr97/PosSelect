o = open("10X_output_samples.txt")
out = open("download0.sh", 'w')
out.write("#!/bin/bash\n#SBATCH --time=24:00:00\n#SBATCH -p hbfraser\n#SBATCH --mem=128GB\n#SBATCH -c 1\n\n")

c = 0
for line in o:
    l = line.replace("\n", "")
    oo = open("template.sh")
    for line2 in oo:
        out.write(line2.replace("10X232_1_AB_2.tar.gz", l).replace("10X232_1_AB_2", l.replace(".tar.gz", "")).replace("10X232_1", "_".join(l.split("_")[0:2])))
    oo.close()
    c += 1
    out.write("\n\n")
    if c % 25 == 0:
        out.close()
        out = open("download" + str(c//25) + ".sh", 'w')
        out.write("#!/bin/bash\n#SBATCH --time=24:00:00\n#SBATCH -p hbfraser\n#SBATCH --mem=128GB\n#SBATCH -c 1\n\n")
out.close()
o.close()
