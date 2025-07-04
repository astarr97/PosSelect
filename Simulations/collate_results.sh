#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p hbfraser
#SBATCH --mem=64GB
#SBATCH -c 1

#python collate_nc_sim_results.py 661_TEST_NONCOD_Bene0.001_ 661_TEST_NONCOD_Bene0.001.txt /scratch/users/astarr97/
#python collate_nc_sim_results.py 661_TEST_NONCOD_Bene0.01_ 661_TEST_NONCOD_Bene0.01.txt /scratch/users/astarr97/
#python collate_nc_sim_results.py 661_TEST_NONCOD_Bene0. 661_TEST_NONCOD_Bene0.txt /scratch/users/astarr97/

#python collate_nc_sim_results.py 661_TEST_NONCOD_Bene0.001_ 661_TEST_NONCOD_Bene0.001_200kb.txt /scratch/users/astarr97/ 200kb
#python collate_nc_sim_results.py 661_TEST_NONCOD_Bene0.01_ 661_TEST_NONCOD_Bene0.01_200kb.txt /scratch/users/astarr97/ 200kb
#python collate_nc_sim_results.py 661_TEST_NONCOD_Bene0. 661_TEST_NONCOD_Bene0_200kb.txt /scratch/users/astarr97/ 200kb

python collate_nc_sim_results.py 661_TEST_NONCOD_Bene0.001_ 661_TEST_NONCOD_Bene0.001_200kbElem.txt /scratch/users/astarr97/ Elem200kb
python collate_nc_sim_results.py 661_TEST_NONCOD_Bene0.01_ 661_TEST_NONCOD_Bene0.01_200kbElem.txt /scratch/users/astarr97/ Elem200kb
python collate_nc_sim_results.py 661_TEST_NONCOD_Bene0. 661_TEST_NONCOD_Bene0_200kbElem.txt /scratch/users/astarr97/ Elem200kb
