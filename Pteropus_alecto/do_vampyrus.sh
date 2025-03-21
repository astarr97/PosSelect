#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB
#SBATCH -c 1

/scratch/users/astarr97/Common_Software/cactus-bin-v2.6.13/bin/hal2maf --refGenome Pteropus_alecto --onlyOrthologs --targetGenomes "Pteropus_alecto,Pteropus_vampyrus" /scratch/users/astarr97/PhyloP/hg38.447way.hal Alecto_Vampyrus.maf
/scratch/users/astarr97/Common_Software/mafTools/bin/mafDuplicateFilter -m Alecto_Vampyrus.maf > Alecto_Vampyrus.dedup.maf
python callSNPsFromMAF.py Alecto_Vampyrus.dedup.maf Alecto_Vampyrus.dedup.All.txt
python convert_to_bed_am.py Alecto_Vampyrus.dedup.All.txt
sort -k1,1 -k2,2n Alecto_Vampyrus.dedup.All.bed > Alecto_Vampyrus.dedup.All.sort.bed
