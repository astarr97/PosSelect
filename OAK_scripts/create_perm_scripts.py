import sys

dl_prefix = sys.argv[1]

step_size = 10
num_perms = 1000
driver = open("driver_TFBS_Perms_" + dl_prefix + ".sh", 'w')
for i in range(num_perms + 1):
    if i % step_size == 0 and i:
        out.close()
        out = open("run_TFBS_Perms_" + dl_prefix + "_" + str(i//step_size) + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_TFBS_Perms_" + dl_prefix + "_" + str(i//step_size) + ".sh\n")
        out.write("#!/bin/bash\n#SBATCH --time=168:00:00\n#SBATCH -p hbfraser,hns\n#SBATCH --mem=32GB\n#SBATCH -c 1\n\n\n")
        out.write("python run_on_TFBS_DL_permute2.py 50000000000 -1 0.25 500 0 " + dl_prefix + " 0 " + str(i) + "\n")
    elif i:
        out.write("python run_on_TFBS_DL_permute2.py 50000000000 -1 0.25 500 0 " + dl_prefix + " 0 " + str(i) + "\n")
    else:
        out = open("run_TFBS_Perms_" + dl_prefix + "_" + str(i//step_size) + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_TFBS_Perms_" + dl_prefix + "_" + str(i//step_size) + ".sh\n")
        out.write("#!/bin/bash\n#SBATCH --time=168:00:00\n#SBATCH -p hbfraser,hns\n#SBATCH --mem=32GB\n#SBATCH -c 1\n\n\n")
        out.write("python run_on_TFBS_DL_permute2.py 50000000000 -1 0.25 500 0 " + dl_prefix + " 0 " + str(i) + "\n")
out.close()
