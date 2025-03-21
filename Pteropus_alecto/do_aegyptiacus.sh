#!/bin/bash
#SBATCH --time=48:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB
#SBATCH -c 1

#/scratch/users/astarr97/Common_Software/cactus-bin-v2.6.13/bin/hal2maf --refGenome Pteropus_alecto --onlyOrthologs --targetGenomes "Pteropus_alecto,Rousettus_aegyptiacus" /scratch/users/astarr97/PhyloP/hg38.447way.hal Alecto_Rousettus.maf
#/scratch/users/astarr97/Common_Software/mafTools/bin/mafDuplicateFilter -m Alecto_Rousettus.maf > Alecto_Rousettus.dedup.maf
#python callSNPsFromMAF.py Alecto_Rousettus.dedup.maf Alecto_Rousettus.dedup.All.txt
#python convert_to_bed_am.py Alecto_Rousettus.dedup.All.txt
sort -k1,1 -k2,2n Alecto_Rousettus.dedup.All.bed > Alecto_Rousettus.dedup.All.sort.bed
