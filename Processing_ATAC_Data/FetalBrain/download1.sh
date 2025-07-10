#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH -p hbfraser
#SBATCH --mem=128GB
#SBATCH -c 1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X291_3_AB_3.tar.gz
tar -xvf 10X291_3_AB_3.tar.gz
rm 10X291_3_AB_3.tar.gz
mv 10X291_3_AB_3/fragments.tsv.gz ./10X291_3_AB_3_fragments.tsv.gz
mv 10X291_3_AB_3/fragments.tsv.gz.tbi ./10X291_3_AB_3_fragments.tsv.gz.tbi
gunzip 10X291_3_AB_3_fragments.tsv.gz
rm -r 10X291_3_AB_3
python sort_cells_by_celltype.py 10X291_3_AB_3_fragments.tsv 10X291_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X312_1_AB_2.tar.gz
tar -xvf 10X312_1_AB_2.tar.gz
rm 10X312_1_AB_2.tar.gz
mv 10X312_1_AB_2/fragments.tsv.gz ./10X312_1_AB_2_fragments.tsv.gz
mv 10X312_1_AB_2/fragments.tsv.gz.tbi ./10X312_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X312_1_AB_2_fragments.tsv.gz
rm -r 10X312_1_AB_2
python sort_cells_by_celltype.py 10X312_1_AB_2_fragments.tsv 10X312_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X312_2_AB_2.tar.gz
tar -xvf 10X312_2_AB_2.tar.gz
rm 10X312_2_AB_2.tar.gz
mv 10X312_2_AB_2/fragments.tsv.gz ./10X312_2_AB_2_fragments.tsv.gz
mv 10X312_2_AB_2/fragments.tsv.gz.tbi ./10X312_2_AB_2_fragments.tsv.gz.tbi
gunzip 10X312_2_AB_2_fragments.tsv.gz
rm -r 10X312_2_AB_2
python sort_cells_by_celltype.py 10X312_2_AB_2_fragments.tsv 10X312_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X312_3_AB_2.tar.gz
tar -xvf 10X312_3_AB_2.tar.gz
rm 10X312_3_AB_2.tar.gz
mv 10X312_3_AB_2/fragments.tsv.gz ./10X312_3_AB_2_fragments.tsv.gz
mv 10X312_3_AB_2/fragments.tsv.gz.tbi ./10X312_3_AB_2_fragments.tsv.gz.tbi
gunzip 10X312_3_AB_2_fragments.tsv.gz
rm -r 10X312_3_AB_2
python sort_cells_by_celltype.py 10X312_3_AB_2_fragments.tsv 10X312_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X312_4_AB_2.tar.gz
tar -xvf 10X312_4_AB_2.tar.gz
rm 10X312_4_AB_2.tar.gz
mv 10X312_4_AB_2/fragments.tsv.gz ./10X312_4_AB_2_fragments.tsv.gz
mv 10X312_4_AB_2/fragments.tsv.gz.tbi ./10X312_4_AB_2_fragments.tsv.gz.tbi
gunzip 10X312_4_AB_2_fragments.tsv.gz
rm -r 10X312_4_AB_2
python sort_cells_by_celltype.py 10X312_4_AB_2_fragments.tsv 10X312_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X312_5_AB_2.tar.gz
tar -xvf 10X312_5_AB_2.tar.gz
rm 10X312_5_AB_2.tar.gz
mv 10X312_5_AB_2/fragments.tsv.gz ./10X312_5_AB_2_fragments.tsv.gz
mv 10X312_5_AB_2/fragments.tsv.gz.tbi ./10X312_5_AB_2_fragments.tsv.gz.tbi
gunzip 10X312_5_AB_2_fragments.tsv.gz
rm -r 10X312_5_AB_2
python sort_cells_by_celltype.py 10X312_5_AB_2_fragments.tsv 10X312_5

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X312_6_AB_2.tar.gz
tar -xvf 10X312_6_AB_2.tar.gz
rm 10X312_6_AB_2.tar.gz
mv 10X312_6_AB_2/fragments.tsv.gz ./10X312_6_AB_2_fragments.tsv.gz
mv 10X312_6_AB_2/fragments.tsv.gz.tbi ./10X312_6_AB_2_fragments.tsv.gz.tbi
gunzip 10X312_6_AB_2_fragments.tsv.gz
rm -r 10X312_6_AB_2
python sort_cells_by_celltype.py 10X312_6_AB_2_fragments.tsv 10X312_6

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X313_1_AB_2.tar.gz
tar -xvf 10X313_1_AB_2.tar.gz
rm 10X313_1_AB_2.tar.gz
mv 10X313_1_AB_2/fragments.tsv.gz ./10X313_1_AB_2_fragments.tsv.gz
mv 10X313_1_AB_2/fragments.tsv.gz.tbi ./10X313_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X313_1_AB_2_fragments.tsv.gz
rm -r 10X313_1_AB_2
python sort_cells_by_celltype.py 10X313_1_AB_2_fragments.tsv 10X313_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X313_2_AB_2.tar.gz
tar -xvf 10X313_2_AB_2.tar.gz
rm 10X313_2_AB_2.tar.gz
mv 10X313_2_AB_2/fragments.tsv.gz ./10X313_2_AB_2_fragments.tsv.gz
mv 10X313_2_AB_2/fragments.tsv.gz.tbi ./10X313_2_AB_2_fragments.tsv.gz.tbi
gunzip 10X313_2_AB_2_fragments.tsv.gz
rm -r 10X313_2_AB_2
python sort_cells_by_celltype.py 10X313_2_AB_2_fragments.tsv 10X313_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X313_3_AB_2.tar.gz
tar -xvf 10X313_3_AB_2.tar.gz
rm 10X313_3_AB_2.tar.gz
mv 10X313_3_AB_2/fragments.tsv.gz ./10X313_3_AB_2_fragments.tsv.gz
mv 10X313_3_AB_2/fragments.tsv.gz.tbi ./10X313_3_AB_2_fragments.tsv.gz.tbi
gunzip 10X313_3_AB_2_fragments.tsv.gz
rm -r 10X313_3_AB_2
python sort_cells_by_celltype.py 10X313_3_AB_2_fragments.tsv 10X313_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X313_4_AB_2.tar.gz
tar -xvf 10X313_4_AB_2.tar.gz
rm 10X313_4_AB_2.tar.gz
mv 10X313_4_AB_2/fragments.tsv.gz ./10X313_4_AB_2_fragments.tsv.gz
mv 10X313_4_AB_2/fragments.tsv.gz.tbi ./10X313_4_AB_2_fragments.tsv.gz.tbi
gunzip 10X313_4_AB_2_fragments.tsv.gz
rm -r 10X313_4_AB_2
python sort_cells_by_celltype.py 10X313_4_AB_2_fragments.tsv 10X313_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X313_5_AB_2.tar.gz
tar -xvf 10X313_5_AB_2.tar.gz
rm 10X313_5_AB_2.tar.gz
mv 10X313_5_AB_2/fragments.tsv.gz ./10X313_5_AB_2_fragments.tsv.gz
mv 10X313_5_AB_2/fragments.tsv.gz.tbi ./10X313_5_AB_2_fragments.tsv.gz.tbi
gunzip 10X313_5_AB_2_fragments.tsv.gz
rm -r 10X313_5_AB_2
python sort_cells_by_celltype.py 10X313_5_AB_2_fragments.tsv 10X313_5

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X313_6_ABC_1.tar.gz
tar -xvf 10X313_6_ABC_1.tar.gz
rm 10X313_6_ABC_1.tar.gz
mv 10X313_6_ABC_1/fragments.tsv.gz ./10X313_6_ABC_1_fragments.tsv.gz
mv 10X313_6_ABC_1/fragments.tsv.gz.tbi ./10X313_6_ABC_1_fragments.tsv.gz.tbi
gunzip 10X313_6_ABC_1_fragments.tsv.gz
rm -r 10X313_6_ABC_1
python sort_cells_by_celltype.py 10X313_6_ABC_1_fragments.tsv 10X313_6

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X315_1_AB_2.tar.gz
tar -xvf 10X315_1_AB_2.tar.gz
rm 10X315_1_AB_2.tar.gz
mv 10X315_1_AB_2/fragments.tsv.gz ./10X315_1_AB_2_fragments.tsv.gz
mv 10X315_1_AB_2/fragments.tsv.gz.tbi ./10X315_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X315_1_AB_2_fragments.tsv.gz
rm -r 10X315_1_AB_2
python sort_cells_by_celltype.py 10X315_1_AB_2_fragments.tsv 10X315_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X315_2_AB_2.tar.gz
tar -xvf 10X315_2_AB_2.tar.gz
rm 10X315_2_AB_2.tar.gz
mv 10X315_2_AB_2/fragments.tsv.gz ./10X315_2_AB_2_fragments.tsv.gz
mv 10X315_2_AB_2/fragments.tsv.gz.tbi ./10X315_2_AB_2_fragments.tsv.gz.tbi
gunzip 10X315_2_AB_2_fragments.tsv.gz
rm -r 10X315_2_AB_2
python sort_cells_by_celltype.py 10X315_2_AB_2_fragments.tsv 10X315_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X315_3_AB_2.tar.gz
tar -xvf 10X315_3_AB_2.tar.gz
rm 10X315_3_AB_2.tar.gz
mv 10X315_3_AB_2/fragments.tsv.gz ./10X315_3_AB_2_fragments.tsv.gz
mv 10X315_3_AB_2/fragments.tsv.gz.tbi ./10X315_3_AB_2_fragments.tsv.gz.tbi
gunzip 10X315_3_AB_2_fragments.tsv.gz
rm -r 10X315_3_AB_2
python sort_cells_by_celltype.py 10X315_3_AB_2_fragments.tsv 10X315_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X315_4_AB_2.tar.gz
tar -xvf 10X315_4_AB_2.tar.gz
rm 10X315_4_AB_2.tar.gz
mv 10X315_4_AB_2/fragments.tsv.gz ./10X315_4_AB_2_fragments.tsv.gz
mv 10X315_4_AB_2/fragments.tsv.gz.tbi ./10X315_4_AB_2_fragments.tsv.gz.tbi
gunzip 10X315_4_AB_2_fragments.tsv.gz
rm -r 10X315_4_AB_2
python sort_cells_by_celltype.py 10X315_4_AB_2_fragments.tsv 10X315_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X315_5_AB_2.tar.gz
tar -xvf 10X315_5_AB_2.tar.gz
rm 10X315_5_AB_2.tar.gz
mv 10X315_5_AB_2/fragments.tsv.gz ./10X315_5_AB_2_fragments.tsv.gz
mv 10X315_5_AB_2/fragments.tsv.gz.tbi ./10X315_5_AB_2_fragments.tsv.gz.tbi
gunzip 10X315_5_AB_2_fragments.tsv.gz
rm -r 10X315_5_AB_2
python sort_cells_by_celltype.py 10X315_5_AB_2_fragments.tsv 10X315_5

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X315_6_AB_2.tar.gz
tar -xvf 10X315_6_AB_2.tar.gz
rm 10X315_6_AB_2.tar.gz
mv 10X315_6_AB_2/fragments.tsv.gz ./10X315_6_AB_2_fragments.tsv.gz
mv 10X315_6_AB_2/fragments.tsv.gz.tbi ./10X315_6_AB_2_fragments.tsv.gz.tbi
gunzip 10X315_6_AB_2_fragments.tsv.gz
rm -r 10X315_6_AB_2
python sort_cells_by_celltype.py 10X315_6_AB_2_fragments.tsv 10X315_6

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X315_7_AB_2.tar.gz
tar -xvf 10X315_7_AB_2.tar.gz
rm 10X315_7_AB_2.tar.gz
mv 10X315_7_AB_2/fragments.tsv.gz ./10X315_7_AB_2_fragments.tsv.gz
mv 10X315_7_AB_2/fragments.tsv.gz.tbi ./10X315_7_AB_2_fragments.tsv.gz.tbi
gunzip 10X315_7_AB_2_fragments.tsv.gz
rm -r 10X315_7_AB_2
python sort_cells_by_celltype.py 10X315_7_AB_2_fragments.tsv 10X315_7

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X315_8_AB_2.tar.gz
tar -xvf 10X315_8_AB_2.tar.gz
rm 10X315_8_AB_2.tar.gz
mv 10X315_8_AB_2/fragments.tsv.gz ./10X315_8_AB_2_fragments.tsv.gz
mv 10X315_8_AB_2/fragments.tsv.gz.tbi ./10X315_8_AB_2_fragments.tsv.gz.tbi
gunzip 10X315_8_AB_2_fragments.tsv.gz
rm -r 10X315_8_AB_2
python sort_cells_by_celltype.py 10X315_8_AB_2_fragments.tsv 10X315_8

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X316_1_AB_2.tar.gz
tar -xvf 10X316_1_AB_2.tar.gz
rm 10X316_1_AB_2.tar.gz
mv 10X316_1_AB_2/fragments.tsv.gz ./10X316_1_AB_2_fragments.tsv.gz
mv 10X316_1_AB_2/fragments.tsv.gz.tbi ./10X316_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X316_1_AB_2_fragments.tsv.gz
rm -r 10X316_1_AB_2
python sort_cells_by_celltype.py 10X316_1_AB_2_fragments.tsv 10X316_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X316_3_ABC_1.tar.gz
tar -xvf 10X316_3_ABC_1.tar.gz
rm 10X316_3_ABC_1.tar.gz
mv 10X316_3_ABC_1/fragments.tsv.gz ./10X316_3_ABC_1_fragments.tsv.gz
mv 10X316_3_ABC_1/fragments.tsv.gz.tbi ./10X316_3_ABC_1_fragments.tsv.gz.tbi
gunzip 10X316_3_ABC_1_fragments.tsv.gz
rm -r 10X316_3_ABC_1
python sort_cells_by_celltype.py 10X316_3_ABC_1_fragments.tsv 10X316_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X316_4_AB_2.tar.gz
tar -xvf 10X316_4_AB_2.tar.gz
rm 10X316_4_AB_2.tar.gz
mv 10X316_4_AB_2/fragments.tsv.gz ./10X316_4_AB_2_fragments.tsv.gz
mv 10X316_4_AB_2/fragments.tsv.gz.tbi ./10X316_4_AB_2_fragments.tsv.gz.tbi
gunzip 10X316_4_AB_2_fragments.tsv.gz
rm -r 10X316_4_AB_2
python sort_cells_by_celltype.py 10X316_4_AB_2_fragments.tsv 10X316_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X316_5_AB_2.tar.gz
tar -xvf 10X316_5_AB_2.tar.gz
rm 10X316_5_AB_2.tar.gz
mv 10X316_5_AB_2/fragments.tsv.gz ./10X316_5_AB_2_fragments.tsv.gz
mv 10X316_5_AB_2/fragments.tsv.gz.tbi ./10X316_5_AB_2_fragments.tsv.gz.tbi
gunzip 10X316_5_AB_2_fragments.tsv.gz
rm -r 10X316_5_AB_2
python sort_cells_by_celltype.py 10X316_5_AB_2_fragments.tsv 10X316_5

