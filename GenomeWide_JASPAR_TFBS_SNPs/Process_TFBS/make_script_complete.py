import os

c = 0
out = 0
for file in os.listdir("../human_chimp/processed/"):
    print(file)
    if "_chp.snps.txt" in file:
        if c % 200 == 0:
            if c:
                out.close()
            out = open("run_complete" + str(int(c/200)) + ".sh", 'w')
            out.write("#!/bin/bash\n#SBATCH --time=72:00:00\n#SBATCH --ntasks=1\n#SBATCH --cores 1\n#SBATCH --mem-per-cpu 16GB\n\n")
        prefix = file.replace("_hum_chp.snps.txt", "")
        o = open('commands_pre.sh')
        out.write("#" + prefix)
        for line in o:
            out.write(line.replace("PREFIX", prefix))
        out.write("\n")
        o.close()
        c += 1
out.close()