#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH -p hbfraser
#SBATCH --mem=128GB
#SBATCH -c 1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X402_1_ABCD_1.tar.gz
tar -xvf 10X402_1_ABCD_1.tar.gz
rm 10X402_1_ABCD_1.tar.gz
mv 10X402_1_ABCD_1/atac_fragments.tsv.gz ./10X402_1_ABCD_1_fragments.tsv.gz
mv 10X402_1_ABCD_1/atac_fragments.tsv.gz.tbi ./10X402_1_ABCD_1_fragments.tsv.gz.tbi
gunzip 10X402_1_ABCD_1_fragments.tsv.gz
rm -r 10X402_1_ABCD_1
python sort_cells_by_celltype.py 10X402_1_ABCD_1_fragments.tsv 10X402_1

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X406_1_ABCD_2.tar.gz
#tar -xvf 10X406_1_ABCD_2.tar.gz
#rm 10X406_1_ABCD_2.tar.gz
#mv 10X406_1_ABCD_2/atac_fragments.tsv.gz ./10X406_1_ABCD_2_fragments.tsv.gz
#mv 10X406_1_ABCD_2/atac_fragments.tsv.gz.tbi ./10X406_1_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X406_1_ABCD_2_fragments.tsv.gz
#rm -r 10X406_1_ABCD_2
python sort_cells_by_celltype.py 10X406_1_ABCD_2_fragments.tsv 10X406_1

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X406_2_ABCD_2.tar.gz
#tar -xvf 10X406_2_ABCD_2.tar.gz
#rm 10X406_2_ABCD_2.tar.gz
#mv 10X406_2_ABCD_2/atac_fragments.tsv.gz ./10X406_2_ABCD_2_fragments.tsv.gz
#mv 10X406_2_ABCD_2/atac_fragments.tsv.gz.tbi ./10X406_2_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X406_2_ABCD_2_fragments.tsv.gz
#rm -r 10X406_2_ABCD_2
python sort_cells_by_celltype.py 10X406_2_ABCD_2_fragments.tsv 10X406_2

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X406_3_ABCD_2.tar.gz
#tar -xvf 10X406_3_ABCD_2.tar.gz
#rm 10X406_3_ABCD_2.tar.gz
#mv 10X406_3_ABCD_2/atac_fragments.tsv.gz ./10X406_3_ABCD_2_fragments.tsv.gz
#mv 10X406_3_ABCD_2/atac_fragments.tsv.gz.tbi ./10X406_3_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X406_3_ABCD_2_fragments.tsv.gz
#rm -r 10X406_3_ABCD_2
python sort_cells_by_celltype.py 10X406_3_ABCD_2_fragments.tsv 10X406_3

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X406_4_ABCD_2.tar.gz
#tar -xvf 10X406_4_ABCD_2.tar.gz
#rm 10X406_4_ABCD_2.tar.gz
#mv 10X406_4_ABCD_2/atac_fragments.tsv.gz ./10X406_4_ABCD_2_fragments.tsv.gz
#mv 10X406_4_ABCD_2/atac_fragments.tsv.gz.tbi ./10X406_4_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X406_4_ABCD_2_fragments.tsv.gz
#rm -r 10X406_4_ABCD_2
python sort_cells_by_celltype.py 10X406_4_ABCD_2_fragments.tsv 10X406_4

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X406_5_ABCD_2.tar.gz
#tar -xvf 10X406_5_ABCD_2.tar.gz
#rm 10X406_5_ABCD_2.tar.gz
#mv 10X406_5_ABCD_2/atac_fragments.tsv.gz ./10X406_5_ABCD_2_fragments.tsv.gz
#mv 10X406_5_ABCD_2/atac_fragments.tsv.gz.tbi ./10X406_5_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X406_5_ABCD_2_fragments.tsv.gz
#rm -r 10X406_5_ABCD_2
python sort_cells_by_celltype.py 10X406_5_ABCD_2_fragments.tsv 10X406_5

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X406_6_ABCD_2.tar.gz
#tar -xvf 10X406_6_ABCD_2.tar.gz
#rm 10X406_6_ABCD_2.tar.gz
#mv 10X406_6_ABCD_2/atac_fragments.tsv.gz ./10X406_6_ABCD_2_fragments.tsv.gz
#mv 10X406_6_ABCD_2/atac_fragments.tsv.gz.tbi ./10X406_6_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X406_6_ABCD_2_fragments.tsv.gz
#rm -r 10X406_6_ABCD_2
python sort_cells_by_celltype.py 10X406_6_ABCD_2_fragments.tsv 10X406_6

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X406_7_ABCD_2.tar.gz
#tar -xvf 10X406_7_ABCD_2.tar.gz
#rm 10X406_7_ABCD_2.tar.gz
#mv 10X406_7_ABCD_2/atac_fragments.tsv.gz ./10X406_7_ABCD_2_fragments.tsv.gz
#mv 10X406_7_ABCD_2/atac_fragments.tsv.gz.tbi ./10X406_7_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X406_7_ABCD_2_fragments.tsv.gz
#rm -r 10X406_7_ABCD_2
python sort_cells_by_celltype.py 10X406_7_ABCD_2_fragments.tsv 10X406_7