#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH -p hbfraser
#SBATCH --mem=8GB
#SBATCH -c 1

#Cell metadata from here https://github.com/ventolab/HGDA/tree/main/human/scATACseq

#Download the ATAC
#wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8046539_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8795928_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768484_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9883959_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9883955_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768482_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9883960_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768481_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768483_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768487_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9479874_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9883958_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9479872_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768485_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9479875_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8795927_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND9332157_fragments.tsv.gz.tbi

#wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8046539_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8795928_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768484_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9883959_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9883955_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768482_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9883960_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768481_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768483_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768487_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9479874_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9883958_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9479872_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8768485_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/HD_F_GON9479875_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND8795927_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-10570/FCA_GND9332157_fragments.tsv.gz

#Download the multiome
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-11708/FCA_GND10288176_and_FCA_GND10287600_atac_fragments.tsv.gz.tbi
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-11708/FCA_GND10288177_and_FCA_GND10287601_atac_fragments.tsv.gz.tbi

wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-11708/FCA_GND10288176_and_FCA_GND10287600_atac_fragments.tsv.gz
wget https://www.ebi.ac.uk/biostudies/files/E-MTAB-11708/FCA_GND10288177_and_FCA_GND10287601_atac_fragments.tsv.gz
