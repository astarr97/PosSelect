#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH -p hbfraser
#SBATCH --mem=128GB
#SBATCH -c 1

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X280_1_ABCD_1.tar.gz
#tar -xvf 10X280_1_ABCD_1.tar.gz
#rm 10X280_1_ABCD_1.tar.gz
#mv 10X280_1_ABCD_1/atac_fragments.tsv.gz ./10X280_1_ABCD_1_fragments.tsv.gz
#mv 10X280_1_ABCD_1/atac_fragments.tsv.gz.tbi ./10X280_1_ABCD_1_fragments.tsv.gz.tbi
#gunzip 10X280_1_ABCD_1_fragments.tsv.gz
#rm -r 10X280_1_ABCD_1
python sort_cells_by_celltype.py 10X280_1_ABCD_1_fragments.tsv 10X280_1

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X280_2_ABCD_1.tar.gz
#tar -xvf 10X280_2_ABCD_1.tar.gz
#rm 10X280_2_ABCD_1.tar.gz
#mv 10X280_2_ABCD_1/atac_fragments.tsv.gz ./10X280_2_ABCD_1_fragments.tsv.gz
#mv 10X280_2_ABCD_1/atac_fragments.tsv.gz.tbi ./10X280_2_ABCD_1_fragments.tsv.gz.tbi
#gunzip 10X280_2_ABCD_1_fragments.tsv.gz
#rm -r 10X280_2_ABCD_1
python sort_cells_by_celltype.py 10X280_2_ABCD_1_fragments.tsv 10X280_2

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X280_3_ABCD_1.tar.gz
#tar -xvf 10X280_3_ABCD_1.tar.gz
#rm 10X280_3_ABCD_1.tar.gz
#mv 10X280_3_ABCD_1/atac_fragments.tsv.gz ./10X280_3_ABCD_1_fragments.tsv.gz
#mv 10X280_3_ABCD_1/atac_fragments.tsv.gz.tbi ./10X280_3_ABCD_1_fragments.tsv.gz.tbi
#gunzip 10X280_3_ABCD_1_fragments.tsv.gz
#rm -r 10X280_3_ABCD_1
python sort_cells_by_celltype.py 10X280_3_ABCD_1_fragments.tsv 10X280_3

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X290_1_ABCD_1.tar.gz
#tar -xvf 10X290_1_ABCD_1.tar.gz
#rm 10X290_1_ABCD_1.tar.gz
#mv 10X290_1_ABCD_1/atac_fragments.tsv.gz ./10X290_1_ABCD_1_fragments.tsv.gz
#mv 10X290_1_ABCD_1/atac_fragments.tsv.gz.tbi ./10X290_1_ABCD_1_fragments.tsv.gz.tbi
#gunzip 10X290_1_ABCD_1_fragments.tsv.gz
#rm -r 10X290_1_ABCD_1
python sort_cells_by_celltype.py 10X290_1_ABCD_1_fragments.tsv 10X290_1

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X290_2_ABCD_1.tar.gz
#tar -xvf 10X290_2_ABCD_1.tar.gz
#rm 10X290_2_ABCD_1.tar.gz
#mv 10X290_2_ABCD_1/atac_fragments.tsv.gz ./10X290_2_ABCD_1_fragments.tsv.gz
#mv 10X290_2_ABCD_1/atac_fragments.tsv.gz.tbi ./10X290_2_ABCD_1_fragments.tsv.gz.tbi
#gunzip 10X290_2_ABCD_1_fragments.tsv.gz
#rm -r 10X290_2_ABCD_1
python sort_cells_by_celltype.py 10X290_2_ABCD_1_fragments.tsv 10X290_2

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X346_1_ABCD_1.tar.gz
#tar -xvf 10X346_1_ABCD_1.tar.gz
#rm 10X346_1_ABCD_1.tar.gz
#mv 10X346_1_ABCD_1/atac_fragments.tsv.gz ./10X346_1_ABCD_1_fragments.tsv.gz
#mv 10X346_1_ABCD_1/atac_fragments.tsv.gz.tbi ./10X346_1_ABCD_1_fragments.tsv.gz.tbi
#gunzip 10X346_1_ABCD_1_fragments.tsv.gz
#rm -r 10X346_1_ABCD_1
python sort_cells_by_celltype.py 10X346_1_ABCD_1_fragments.tsv 10X346_1

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X346_2_ABCD_2.tar.gz
#tar -xvf 10X346_2_ABCD_2.tar.gz
#rm 10X346_2_ABCD_2.tar.gz
#mv 10X346_2_ABCD_2/atac_fragments.tsv.gz ./10X346_2_ABCD_2_fragments.tsv.gz
#mv 10X346_2_ABCD_2/atac_fragments.tsv.gz.tbi ./10X346_2_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X346_2_ABCD_2_fragments.tsv.gz
#rm -r 10X346_2_ABCD_2
python sort_cells_by_celltype.py 10X346_2_ABCD_2_fragments.tsv 10X346_2

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X346_3_ABCD_2.tar.gz
#tar -xvf 10X346_3_ABCD_2.tar.gz
#rm 10X346_3_ABCD_2.tar.gz
#mv 10X346_3_ABCD_2/atac_fragments.tsv.gz ./10X346_3_ABCD_2_fragments.tsv.gz
#mv 10X346_3_ABCD_2/atac_fragments.tsv.gz.tbi ./10X346_3_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X346_3_ABCD_2_fragments.tsv.gz
#rm -r 10X346_3_ABCD_2
python sort_cells_by_celltype.py 10X346_3_ABCD_2_fragments.tsv 10X346_3

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X346_4_ABCD_2.tar.gz
#tar -xvf 10X346_4_ABCD_2.tar.gz
#rm 10X346_4_ABCD_2.tar.gz
#mv 10X346_4_ABCD_2/atac_fragments.tsv.gz ./10X346_4_ABCD_2_fragments.tsv.gz
#mv 10X346_4_ABCD_2/atac_fragments.tsv.gz.tbi ./10X346_4_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X346_4_ABCD_2_fragments.tsv.gz
#rm -r 10X346_4_ABCD_2
python sort_cells_by_celltype.py 10X346_4_ABCD_2_fragments.tsv 10X346_4

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X365_2_ABCDE_2.tar.gz
#tar -xvf 10X365_2_ABCDE_2.tar.gz
#rm 10X365_2_ABCDE_2.tar.gz
#mv 10X365_2_ABCDE_2/atac_fragments.tsv.gz ./10X365_2_ABCDE_2_fragments.tsv.gz
#mv 10X365_2_ABCDE_2/atac_fragments.tsv.gz.tbi ./10X365_2_ABCDE_2_fragments.tsv.gz.tbi
#gunzip 10X365_2_ABCDE_2_fragments.tsv.gz
#rm -r 10X365_2_ABCDE_2
python sort_cells_by_celltype.py 10X365_2_ABCDE_2_fragments.tsv 10X365_2

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X365_4_ABCDE_2.tar.gz
#tar -xvf 10X365_4_ABCDE_2.tar.gz
#rm 10X365_4_ABCDE_2.tar.gz
#mv 10X365_4_ABCDE_2/atac_fragments.tsv.gz ./10X365_4_ABCDE_2_fragments.tsv.gz
#mv 10X365_4_ABCDE_2/atac_fragments.tsv.gz.tbi ./10X365_4_ABCDE_2_fragments.tsv.gz.tbi
#gunzip 10X365_4_ABCDE_2_fragments.tsv.gz
#rm -r 10X365_4_ABCDE_2
python sort_cells_by_celltype.py 10X365_4_ABCDE_2_fragments.tsv 10X365_4

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X370_1_ABCD_2.tar.gz
#tar -xvf 10X370_1_ABCD_2.tar.gz
#rm 10X370_1_ABCD_2.tar.gz
#mv 10X370_1_ABCD_2/atac_fragments.tsv.gz ./10X370_1_ABCD_2_fragments.tsv.gz
#mv 10X370_1_ABCD_2/atac_fragments.tsv.gz.tbi ./10X370_1_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X370_1_ABCD_2_fragments.tsv.gz
#rm -r 10X370_1_ABCD_2
python sort_cells_by_celltype.py 10X370_1_ABCD_2_fragments.tsv 10X370_1

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X370_2_ABCD_2.tar.gz
#tar -xvf 10X370_2_ABCD_2.tar.gz
#rm 10X370_2_ABCD_2.tar.gz
#mv 10X370_2_ABCD_2/atac_fragments.tsv.gz ./10X370_2_ABCD_2_fragments.tsv.gz
#mv 10X370_2_ABCD_2/atac_fragments.tsv.gz.tbi ./10X370_2_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X370_2_ABCD_2_fragments.tsv.gz
#rm -r 10X370_2_ABCD_2
python sort_cells_by_celltype.py 10X370_2_ABCD_2_fragments.tsv 10X370_2

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X370_3_ABCDE_2.tar.gz
#tar -xvf 10X370_3_ABCDE_2.tar.gz
#rm 10X370_3_ABCDE_2.tar.gz
#mv 10X370_3_ABCDE_2/atac_fragments.tsv.gz ./10X370_3_ABCDE_2_fragments.tsv.gz
#mv 10X370_3_ABCDE_2/atac_fragments.tsv.gz.tbi ./10X370_3_ABCDE_2_fragments.tsv.gz.tbi
#gunzip 10X370_3_ABCDE_2_fragments.tsv.gz
#rm -r 10X370_3_ABCDE_2
python sort_cells_by_celltype.py 10X370_3_ABCDE_2_fragments.tsv 10X370_3

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X370_4_ABCD_2.tar.gz
#tar -xvf 10X370_4_ABCD_2.tar.gz
#rm 10X370_4_ABCD_2.tar.gz
#mv 10X370_4_ABCD_2/atac_fragments.tsv.gz ./10X370_4_ABCD_2_fragments.tsv.gz
#mv 10X370_4_ABCD_2/atac_fragments.tsv.gz.tbi ./10X370_4_ABCD_2_fragments.tsv.gz.tbi
#gunzip 10X370_4_ABCD_2_fragments.tsv.gz
#rm -r 10X370_4_ABCD_2
python sort_cells_by_celltype.py 10X370_4_ABCD_2_fragments.tsv 10X370_4
