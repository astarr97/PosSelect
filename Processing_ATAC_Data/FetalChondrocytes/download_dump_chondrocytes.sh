#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p normal,owners,hbfraser
#SBATCH --mem=48000
#SBATCH -c 1

/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/prefetch --option-file SraAccList_Chond_All.txt --max-size 9000000000

/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742709 -O Chondrocytes -o SRR21742709_primary_chondrocyte_Cartilage_Hip.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742708 -O Chondrocytes -o SRR21742708_primary_chondrocyte_Cartilage_Hip.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742707 -O Chondrocytes -o SRR21742707_primary_chondrocyte_Cartilage_Hip.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742706 -O Chondrocytes -o SRR21742706_primary_chondrocyte_Cartilage_Hip.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742705 -O Chondrocytes -o SRR21742705_primary_chondrocyte_Cartilage_Hip.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742704 -O Chondrocytes -o SRR21742704_primary_chondrocyte_Cartilage_Hip.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742717 -O Chondrocytes -o SRR21742717_primary_chondrocyte_Cartilage_Knee.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742716 -O Chondrocytes -o SRR21742716_primary_chondrocyte_Cartilage_Knee.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742715 -O Chondrocytes -o SRR21742715_primary_chondrocyte_Cartilage_Knee.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742714 -O Chondrocytes -o SRR21742714_primary_chondrocyte_Cartilage_Knee.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742713 -O Chondrocytes -o SRR21742713_primary_chondrocyte_Cartilage_Knee.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR21742712 -O Chondrocytes -o SRR21742712_primary_chondrocyte_Cartilage_Knee.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR8943513 -O Chondrocytes -o SRR8943513_chondrocytes_Proximal_femoral_growth_plates_E59.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR8943514 -O Chondrocytes -o SRR8943514_chondrocytes_Distal_femoral_growth_plates_E59.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR8943515 -O Chondrocytes -o SRR8943515_chondrocytes_Proximal_tibial_growth_plates_E59.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR8943516 -O Chondrocytes -o SRR8943516_chondrocytes_Distal_tibial_growth_plates_E59.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR8943517 -O Chondrocytes -o SRR8943517_chondrocytes_Proximal_humeral_growth_plates_E59.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR8943518 -O Chondrocytes -o SRR8943518_chondrocytes_Distal_humeral_growth_plates_E59.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR8943519 -O Chondrocytes -o SRR8943519_chondrocytes_Proximal_radial_growth_plates_E59.fastq
/home/users/astarr97/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump SRR8943520 -O Chondrocytes -o SRR8943520_chondrocytes_Distal_radial_growth_plates_E59.fastq