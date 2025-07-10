#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH -p hbfraser
#SBATCH --mem=128GB
#SBATCH -c 1

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X232_1_AB_2.tar.gz
#tar -xvf 10X232_1_AB_2.tar.gz
#rm 10X232_1_AB_2.tar.gz
#mv 10X232_1_AB_2/fragments.tsv.gz ./10X232_1_AB_2_fragments.tsv.gz
#mv 10X232_1_AB_2/fragments.tsv.gz.tbi ./10X232_1_AB_2_fragments.tsv.gz.tbi
#gunzip 10X232_1_AB_2_fragments.tsv.gz
#rm -r 10X232_1_AB_2
#python sort_cells_by_celltype.py 10X232_1_AB_2_fragments.tsv 10X232_1

#wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X232_2_AB_2.tar.gz
#tar -xvf 10X232_2_AB_2.tar.gz
#rm 10X232_2_AB_2.tar.gz
#mv 10X232_2_AB_2/fragments.tsv.gz ./10X232_2_AB_2_fragments.tsv.gz
#mv 10X232_2_AB_2/fragments.tsv.gz.tbi ./10X232_2_AB_2_fragments.tsv.gz.tbi
#gunzip 10X232_2_AB_2_fragments.tsv.gz
#rm -r 10X232_2_AB_2
python sort_cells_by_celltype.py 10X232_2_AB_2_fragments.tsv 10X232_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X232_3_AB_2.tar.gz
tar -xvf 10X232_3_AB_2.tar.gz
rm 10X232_3_AB_2.tar.gz
mv 10X232_3_AB_2/fragments.tsv.gz ./10X232_3_AB_2_fragments.tsv.gz
mv 10X232_3_AB_2/fragments.tsv.gz.tbi ./10X232_3_AB_2_fragments.tsv.gz.tbi
gunzip 10X232_3_AB_2_fragments.tsv.gz
rm -r 10X232_3_AB_2
python sort_cells_by_celltype.py 10X232_3_AB_2_fragments.tsv 10X232_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X232_4_AB_2.tar.gz
tar -xvf 10X232_4_AB_2.tar.gz
rm 10X232_4_AB_2.tar.gz
mv 10X232_4_AB_2/fragments.tsv.gz ./10X232_4_AB_2_fragments.tsv.gz
mv 10X232_4_AB_2/fragments.tsv.gz.tbi ./10X232_4_AB_2_fragments.tsv.gz.tbi
gunzip 10X232_4_AB_2_fragments.tsv.gz
rm -r 10X232_4_AB_2
python sort_cells_by_celltype.py 10X232_4_AB_2_fragments.tsv 10X232_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X242_1_AB_2.tar.gz
tar -xvf 10X242_1_AB_2.tar.gz
rm 10X242_1_AB_2.tar.gz
mv 10X242_1_AB_2/fragments.tsv.gz ./10X242_1_AB_2_fragments.tsv.gz
mv 10X242_1_AB_2/fragments.tsv.gz.tbi ./10X242_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X242_1_AB_2_fragments.tsv.gz
rm -r 10X242_1_AB_2
python sort_cells_by_celltype.py 10X242_1_AB_2_fragments.tsv 10X242_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X242_2_AB_2.tar.gz
tar -xvf 10X242_2_AB_2.tar.gz
rm 10X242_2_AB_2.tar.gz
mv 10X242_2_AB_2/fragments.tsv.gz ./10X242_2_AB_2_fragments.tsv.gz
mv 10X242_2_AB_2/fragments.tsv.gz.tbi ./10X242_2_AB_2_fragments.tsv.gz.tbi
gunzip 10X242_2_AB_2_fragments.tsv.gz
rm -r 10X242_2_AB_2
python sort_cells_by_celltype.py 10X242_2_AB_2_fragments.tsv 10X242_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X242_3_ABC_1.tar.gz
tar -xvf 10X242_3_ABC_1.tar.gz
rm 10X242_3_ABC_1.tar.gz
mv 10X242_3_ABC_1/fragments.tsv.gz ./10X242_3_ABC_1_fragments.tsv.gz
mv 10X242_3_ABC_1/fragments.tsv.gz.tbi ./10X242_3_ABC_1_fragments.tsv.gz.tbi
gunzip 10X242_3_ABC_1_fragments.tsv.gz
rm -r 10X242_3_ABC_1
python sort_cells_by_celltype.py 10X242_3_ABC_1_fragments.tsv 10X242_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X242_4_AB_2.tar.gz
tar -xvf 10X242_4_AB_2.tar.gz
rm 10X242_4_AB_2.tar.gz
mv 10X242_4_AB_2/fragments.tsv.gz ./10X242_4_AB_2_fragments.tsv.gz
mv 10X242_4_AB_2/fragments.tsv.gz.tbi ./10X242_4_AB_2_fragments.tsv.gz.tbi
gunzip 10X242_4_AB_2_fragments.tsv.gz
rm -r 10X242_4_AB_2
python sort_cells_by_celltype.py 10X242_4_AB_2_fragments.tsv 10X242_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X250_1_AB_2.tar.gz
tar -xvf 10X250_1_AB_2.tar.gz
rm 10X250_1_AB_2.tar.gz
mv 10X250_1_AB_2/fragments.tsv.gz ./10X250_1_AB_2_fragments.tsv.gz
mv 10X250_1_AB_2/fragments.tsv.gz.tbi ./10X250_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X250_1_AB_2_fragments.tsv.gz
rm -r 10X250_1_AB_2
python sort_cells_by_celltype.py 10X250_1_AB_2_fragments.tsv 10X250_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X250_2_AB_2.tar.gz
tar -xvf 10X250_2_AB_2.tar.gz
rm 10X250_2_AB_2.tar.gz
mv 10X250_2_AB_2/fragments.tsv.gz ./10X250_2_AB_2_fragments.tsv.gz
mv 10X250_2_AB_2/fragments.tsv.gz.tbi ./10X250_2_AB_2_fragments.tsv.gz.tbi
gunzip 10X250_2_AB_2_fragments.tsv.gz
rm -r 10X250_2_AB_2
python sort_cells_by_celltype.py 10X250_2_AB_2_fragments.tsv 10X250_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X250_3_ABC_1.tar.gz
tar -xvf 10X250_3_ABC_1.tar.gz
rm 10X250_3_ABC_1.tar.gz
mv 10X250_3_ABC_1/fragments.tsv.gz ./10X250_3_ABC_1_fragments.tsv.gz
mv 10X250_3_ABC_1/fragments.tsv.gz.tbi ./10X250_3_ABC_1_fragments.tsv.gz.tbi
gunzip 10X250_3_ABC_1_fragments.tsv.gz
rm -r 10X250_3_ABC_1
python sort_cells_by_celltype.py 10X250_3_ABC_1_fragments.tsv 10X250_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X250_4_ABC_1.tar.gz
tar -xvf 10X250_4_ABC_1.tar.gz
rm 10X250_4_ABC_1.tar.gz
mv 10X250_4_ABC_1/fragments.tsv.gz ./10X250_4_ABC_1_fragments.tsv.gz
mv 10X250_4_ABC_1/fragments.tsv.gz.tbi ./10X250_4_ABC_1_fragments.tsv.gz.tbi
gunzip 10X250_4_ABC_1_fragments.tsv.gz
rm -r 10X250_4_ABC_1
python sort_cells_by_celltype.py 10X250_4_ABC_1_fragments.tsv 10X250_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X279_1_ABC_1.tar.gz
tar -xvf 10X279_1_ABC_1.tar.gz
rm 10X279_1_ABC_1.tar.gz
mv 10X279_1_ABC_1/fragments.tsv.gz ./10X279_1_ABC_1_fragments.tsv.gz
mv 10X279_1_ABC_1/fragments.tsv.gz.tbi ./10X279_1_ABC_1_fragments.tsv.gz.tbi
gunzip 10X279_1_ABC_1_fragments.tsv.gz
rm -r 10X279_1_ABC_1
python sort_cells_by_celltype.py 10X279_1_ABC_1_fragments.tsv 10X279_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X279_2_ABC_1.tar.gz
tar -xvf 10X279_2_ABC_1.tar.gz
rm 10X279_2_ABC_1.tar.gz
mv 10X279_2_ABC_1/fragments.tsv.gz ./10X279_2_ABC_1_fragments.tsv.gz
mv 10X279_2_ABC_1/fragments.tsv.gz.tbi ./10X279_2_ABC_1_fragments.tsv.gz.tbi
gunzip 10X279_2_ABC_1_fragments.tsv.gz
rm -r 10X279_2_ABC_1
python sort_cells_by_celltype.py 10X279_2_ABC_1_fragments.tsv 10X279_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X279_3_AB_3.tar.gz
tar -xvf 10X279_3_AB_3.tar.gz
rm 10X279_3_AB_3.tar.gz
mv 10X279_3_AB_3/fragments.tsv.gz ./10X279_3_AB_3_fragments.tsv.gz
mv 10X279_3_AB_3/fragments.tsv.gz.tbi ./10X279_3_AB_3_fragments.tsv.gz.tbi
gunzip 10X279_3_AB_3_fragments.tsv.gz
rm -r 10X279_3_AB_3
python sort_cells_by_celltype.py 10X279_3_AB_3_fragments.tsv 10X279_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X280_1_ABCD_1.tar.gz
tar -xvf 10X280_1_ABCD_1.tar.gz
rm 10X280_1_ABCD_1.tar.gz
mv 10X280_1_ABCD_1/fragments.tsv.gz ./10X280_1_ABCD_1_fragments.tsv.gz
mv 10X280_1_ABCD_1/fragments.tsv.gz.tbi ./10X280_1_ABCD_1_fragments.tsv.gz.tbi
gunzip 10X280_1_ABCD_1_fragments.tsv.gz
rm -r 10X280_1_ABCD_1
python sort_cells_by_celltype.py 10X280_1_ABCD_1_fragments.tsv 10X280_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X280_2_ABCD_1.tar.gz
tar -xvf 10X280_2_ABCD_1.tar.gz
rm 10X280_2_ABCD_1.tar.gz
mv 10X280_2_ABCD_1/fragments.tsv.gz ./10X280_2_ABCD_1_fragments.tsv.gz
mv 10X280_2_ABCD_1/fragments.tsv.gz.tbi ./10X280_2_ABCD_1_fragments.tsv.gz.tbi
gunzip 10X280_2_ABCD_1_fragments.tsv.gz
rm -r 10X280_2_ABCD_1
python sort_cells_by_celltype.py 10X280_2_ABCD_1_fragments.tsv 10X280_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X280_3_ABCD_1.tar.gz
tar -xvf 10X280_3_ABCD_1.tar.gz
rm 10X280_3_ABCD_1.tar.gz
mv 10X280_3_ABCD_1/fragments.tsv.gz ./10X280_3_ABCD_1_fragments.tsv.gz
mv 10X280_3_ABCD_1/fragments.tsv.gz.tbi ./10X280_3_ABCD_1_fragments.tsv.gz.tbi
gunzip 10X280_3_ABCD_1_fragments.tsv.gz
rm -r 10X280_3_ABCD_1
python sort_cells_by_celltype.py 10X280_3_ABCD_1_fragments.tsv 10X280_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X286_1_AB_3.tar.gz
tar -xvf 10X286_1_AB_3.tar.gz
rm 10X286_1_AB_3.tar.gz
mv 10X286_1_AB_3/fragments.tsv.gz ./10X286_1_AB_3_fragments.tsv.gz
mv 10X286_1_AB_3/fragments.tsv.gz.tbi ./10X286_1_AB_3_fragments.tsv.gz.tbi
gunzip 10X286_1_AB_3_fragments.tsv.gz
rm -r 10X286_1_AB_3
python sort_cells_by_celltype.py 10X286_1_AB_3_fragments.tsv 10X286_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X286_2_AB_3.tar.gz
tar -xvf 10X286_2_AB_3.tar.gz
rm 10X286_2_AB_3.tar.gz
mv 10X286_2_AB_3/fragments.tsv.gz ./10X286_2_AB_3_fragments.tsv.gz
mv 10X286_2_AB_3/fragments.tsv.gz.tbi ./10X286_2_AB_3_fragments.tsv.gz.tbi
gunzip 10X286_2_AB_3_fragments.tsv.gz
rm -r 10X286_2_AB_3
python sort_cells_by_celltype.py 10X286_2_AB_3_fragments.tsv 10X286_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X286_7_ABC_1.tar.gz
tar -xvf 10X286_7_ABC_1.tar.gz
rm 10X286_7_ABC_1.tar.gz
mv 10X286_7_ABC_1/fragments.tsv.gz ./10X286_7_ABC_1_fragments.tsv.gz
mv 10X286_7_ABC_1/fragments.tsv.gz.tbi ./10X286_7_ABC_1_fragments.tsv.gz.tbi
gunzip 10X286_7_ABC_1_fragments.tsv.gz
rm -r 10X286_7_ABC_1
python sort_cells_by_celltype.py 10X286_7_ABC_1_fragments.tsv 10X286_7

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X286_8_ABC_1.tar.gz
tar -xvf 10X286_8_ABC_1.tar.gz
rm 10X286_8_ABC_1.tar.gz
mv 10X286_8_ABC_1/fragments.tsv.gz ./10X286_8_ABC_1_fragments.tsv.gz
mv 10X286_8_ABC_1/fragments.tsv.gz.tbi ./10X286_8_ABC_1_fragments.tsv.gz.tbi
gunzip 10X286_8_ABC_1_fragments.tsv.gz
rm -r 10X286_8_ABC_1
python sort_cells_by_celltype.py 10X286_8_ABC_1_fragments.tsv 10X286_8

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X290_1_ABCD_1.tar.gz
tar -xvf 10X290_1_ABCD_1.tar.gz
rm 10X290_1_ABCD_1.tar.gz
mv 10X290_1_ABCD_1/fragments.tsv.gz ./10X290_1_ABCD_1_fragments.tsv.gz
mv 10X290_1_ABCD_1/fragments.tsv.gz.tbi ./10X290_1_ABCD_1_fragments.tsv.gz.tbi
gunzip 10X290_1_ABCD_1_fragments.tsv.gz
rm -r 10X290_1_ABCD_1
python sort_cells_by_celltype.py 10X290_1_ABCD_1_fragments.tsv 10X290_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X290_2_ABCD_1.tar.gz
tar -xvf 10X290_2_ABCD_1.tar.gz
rm 10X290_2_ABCD_1.tar.gz
mv 10X290_2_ABCD_1/fragments.tsv.gz ./10X290_2_ABCD_1_fragments.tsv.gz
mv 10X290_2_ABCD_1/fragments.tsv.gz.tbi ./10X290_2_ABCD_1_fragments.tsv.gz.tbi
gunzip 10X290_2_ABCD_1_fragments.tsv.gz
rm -r 10X290_2_ABCD_1
python sort_cells_by_celltype.py 10X290_2_ABCD_1_fragments.tsv 10X290_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X291_2_AB_3.tar.gz
tar -xvf 10X291_2_AB_3.tar.gz
rm 10X291_2_AB_3.tar.gz
mv 10X291_2_AB_3/fragments.tsv.gz ./10X291_2_AB_3_fragments.tsv.gz
mv 10X291_2_AB_3/fragments.tsv.gz.tbi ./10X291_2_AB_3_fragments.tsv.gz.tbi
gunzip 10X291_2_AB_3_fragments.tsv.gz
rm -r 10X291_2_AB_3
python sort_cells_by_celltype.py 10X291_2_AB_3_fragments.tsv 10X291_2

