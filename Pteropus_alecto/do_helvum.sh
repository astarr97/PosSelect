#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB
#SBATCH -c 1

/scratch/users/astarr97/Common_Software/cactus-bin-v2.6.13/bin/hal2maf --refGenome Pteropus_alecto --onlyOrthologs --targetGenomes "Pteropus_alecto,Eidolon_helvum" /scratch/users/astarr97/PhyloP/hg38.447way.hal Alecto_Eidolon.maf
/scratch/users/astarr97/Common_Software/mafTools/bin/mafDuplicateFilter -m Alecto_Eidolon.maf > Alecto_Eidolon.dedup.maf
python callSNPsFromMAF.py Alecto_Eidolon.dedup.maf Alecto_Eidolon.dedup.All.txt
python convert_to_bed_am.py Alecto_Eidolon.dedup.All.txt
sort -k1,1 -k2,2n Alecto_Eidolon.dedup.All.bed > Alecto_Eidolon.dedup.All.sort.bed

