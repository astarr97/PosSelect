#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH -p hbfraser
#SBATCH --mem=128GB
#SBATCH -c 1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X316_6_AB_2.tar.gz
tar -xvf 10X316_6_AB_2.tar.gz
rm 10X316_6_AB_2.tar.gz
mv 10X316_6_AB_2/fragments.tsv.gz ./10X316_6_AB_2_fragments.tsv.gz
mv 10X316_6_AB_2/fragments.tsv.gz.tbi ./10X316_6_AB_2_fragments.tsv.gz.tbi
gunzip 10X316_6_AB_2_fragments.tsv.gz
rm -r 10X316_6_AB_2
python sort_cells_by_celltype.py 10X316_6_AB_2_fragments.tsv 10X316_6

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X317_1_AB_2.tar.gz
tar -xvf 10X317_1_AB_2.tar.gz
rm 10X317_1_AB_2.tar.gz
mv 10X317_1_AB_2/fragments.tsv.gz ./10X317_1_AB_2_fragments.tsv.gz
mv 10X317_1_AB_2/fragments.tsv.gz.tbi ./10X317_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X317_1_AB_2_fragments.tsv.gz
rm -r 10X317_1_AB_2
python sort_cells_by_celltype.py 10X317_1_AB_2_fragments.tsv 10X317_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X317_3_AB_2.tar.gz
tar -xvf 10X317_3_AB_2.tar.gz
rm 10X317_3_AB_2.tar.gz
mv 10X317_3_AB_2/fragments.tsv.gz ./10X317_3_AB_2_fragments.tsv.gz
mv 10X317_3_AB_2/fragments.tsv.gz.tbi ./10X317_3_AB_2_fragments.tsv.gz.tbi
gunzip 10X317_3_AB_2_fragments.tsv.gz
rm -r 10X317_3_AB_2
python sort_cells_by_celltype.py 10X317_3_AB_2_fragments.tsv 10X317_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X317_4_AB_2.tar.gz
tar -xvf 10X317_4_AB_2.tar.gz
rm 10X317_4_AB_2.tar.gz
mv 10X317_4_AB_2/fragments.tsv.gz ./10X317_4_AB_2_fragments.tsv.gz
mv 10X317_4_AB_2/fragments.tsv.gz.tbi ./10X317_4_AB_2_fragments.tsv.gz.tbi
gunzip 10X317_4_AB_2_fragments.tsv.gz
rm -r 10X317_4_AB_2
python sort_cells_by_celltype.py 10X317_4_AB_2_fragments.tsv 10X317_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X317_5_AB_2.tar.gz
tar -xvf 10X317_5_AB_2.tar.gz
rm 10X317_5_AB_2.tar.gz
mv 10X317_5_AB_2/fragments.tsv.gz ./10X317_5_AB_2_fragments.tsv.gz
mv 10X317_5_AB_2/fragments.tsv.gz.tbi ./10X317_5_AB_2_fragments.tsv.gz.tbi
gunzip 10X317_5_AB_2_fragments.tsv.gz
rm -r 10X317_5_AB_2
python sort_cells_by_celltype.py 10X317_5_AB_2_fragments.tsv 10X317_5

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X317_6_AB_2.tar.gz
tar -xvf 10X317_6_AB_2.tar.gz
rm 10X317_6_AB_2.tar.gz
mv 10X317_6_AB_2/fragments.tsv.gz ./10X317_6_AB_2_fragments.tsv.gz
mv 10X317_6_AB_2/fragments.tsv.gz.tbi ./10X317_6_AB_2_fragments.tsv.gz.tbi
gunzip 10X317_6_AB_2_fragments.tsv.gz
rm -r 10X317_6_AB_2
python sort_cells_by_celltype.py 10X317_6_AB_2_fragments.tsv 10X317_6

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X321_1_ABC_1.tar.gz
tar -xvf 10X321_1_ABC_1.tar.gz
rm 10X321_1_ABC_1.tar.gz
mv 10X321_1_ABC_1/fragments.tsv.gz ./10X321_1_ABC_1_fragments.tsv.gz
mv 10X321_1_ABC_1/fragments.tsv.gz.tbi ./10X321_1_ABC_1_fragments.tsv.gz.tbi
gunzip 10X321_1_ABC_1_fragments.tsv.gz
rm -r 10X321_1_ABC_1
python sort_cells_by_celltype.py 10X321_1_ABC_1_fragments.tsv 10X321_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X321_2_AB_2.tar.gz
tar -xvf 10X321_2_AB_2.tar.gz
rm 10X321_2_AB_2.tar.gz
mv 10X321_2_AB_2/fragments.tsv.gz ./10X321_2_AB_2_fragments.tsv.gz
mv 10X321_2_AB_2/fragments.tsv.gz.tbi ./10X321_2_AB_2_fragments.tsv.gz.tbi
gunzip 10X321_2_AB_2_fragments.tsv.gz
rm -r 10X321_2_AB_2
python sort_cells_by_celltype.py 10X321_2_AB_2_fragments.tsv 10X321_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X321_3_AB_2.tar.gz
tar -xvf 10X321_3_AB_2.tar.gz
rm 10X321_3_AB_2.tar.gz
mv 10X321_3_AB_2/fragments.tsv.gz ./10X321_3_AB_2_fragments.tsv.gz
mv 10X321_3_AB_2/fragments.tsv.gz.tbi ./10X321_3_AB_2_fragments.tsv.gz.tbi
gunzip 10X321_3_AB_2_fragments.tsv.gz
rm -r 10X321_3_AB_2
python sort_cells_by_celltype.py 10X321_3_AB_2_fragments.tsv 10X321_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X321_4_ABC_1.tar.gz
tar -xvf 10X321_4_ABC_1.tar.gz
rm 10X321_4_ABC_1.tar.gz
mv 10X321_4_ABC_1/fragments.tsv.gz ./10X321_4_ABC_1_fragments.tsv.gz
mv 10X321_4_ABC_1/fragments.tsv.gz.tbi ./10X321_4_ABC_1_fragments.tsv.gz.tbi
gunzip 10X321_4_ABC_1_fragments.tsv.gz
rm -r 10X321_4_ABC_1
python sort_cells_by_celltype.py 10X321_4_ABC_1_fragments.tsv 10X321_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X321_5_AB_2.tar.gz
tar -xvf 10X321_5_AB_2.tar.gz
rm 10X321_5_AB_2.tar.gz
mv 10X321_5_AB_2/fragments.tsv.gz ./10X321_5_AB_2_fragments.tsv.gz
mv 10X321_5_AB_2/fragments.tsv.gz.tbi ./10X321_5_AB_2_fragments.tsv.gz.tbi
gunzip 10X321_5_AB_2_fragments.tsv.gz
rm -r 10X321_5_AB_2
python sort_cells_by_celltype.py 10X321_5_AB_2_fragments.tsv 10X321_5

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X321_6_AB_2.tar.gz
tar -xvf 10X321_6_AB_2.tar.gz
rm 10X321_6_AB_2.tar.gz
mv 10X321_6_AB_2/fragments.tsv.gz ./10X321_6_AB_2_fragments.tsv.gz
mv 10X321_6_AB_2/fragments.tsv.gz.tbi ./10X321_6_AB_2_fragments.tsv.gz.tbi
gunzip 10X321_6_AB_2_fragments.tsv.gz
rm -r 10X321_6_AB_2
python sort_cells_by_celltype.py 10X321_6_AB_2_fragments.tsv 10X321_6

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X325_1_AB_2.tar.gz
tar -xvf 10X325_1_AB_2.tar.gz
rm 10X325_1_AB_2.tar.gz
mv 10X325_1_AB_2/fragments.tsv.gz ./10X325_1_AB_2_fragments.tsv.gz
mv 10X325_1_AB_2/fragments.tsv.gz.tbi ./10X325_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X325_1_AB_2_fragments.tsv.gz
rm -r 10X325_1_AB_2
python sort_cells_by_celltype.py 10X325_1_AB_2_fragments.tsv 10X325_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X325_2_AB_2.tar.gz
tar -xvf 10X325_2_AB_2.tar.gz
rm 10X325_2_AB_2.tar.gz
mv 10X325_2_AB_2/fragments.tsv.gz ./10X325_2_AB_2_fragments.tsv.gz
mv 10X325_2_AB_2/fragments.tsv.gz.tbi ./10X325_2_AB_2_fragments.tsv.gz.tbi
gunzip 10X325_2_AB_2_fragments.tsv.gz
rm -r 10X325_2_AB_2
python sort_cells_by_celltype.py 10X325_2_AB_2_fragments.tsv 10X325_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X325_6_AB_2.tar.gz
tar -xvf 10X325_6_AB_2.tar.gz
rm 10X325_6_AB_2.tar.gz
mv 10X325_6_AB_2/fragments.tsv.gz ./10X325_6_AB_2_fragments.tsv.gz
mv 10X325_6_AB_2/fragments.tsv.gz.tbi ./10X325_6_AB_2_fragments.tsv.gz.tbi
gunzip 10X325_6_AB_2_fragments.tsv.gz
rm -r 10X325_6_AB_2
python sort_cells_by_celltype.py 10X325_6_AB_2_fragments.tsv 10X325_6

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X340_1_AB_2.tar.gz
tar -xvf 10X340_1_AB_2.tar.gz
rm 10X340_1_AB_2.tar.gz
mv 10X340_1_AB_2/fragments.tsv.gz ./10X340_1_AB_2_fragments.tsv.gz
mv 10X340_1_AB_2/fragments.tsv.gz.tbi ./10X340_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X340_1_AB_2_fragments.tsv.gz
rm -r 10X340_1_AB_2
python sort_cells_by_celltype.py 10X340_1_AB_2_fragments.tsv 10X340_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X340_2_AB_2.tar.gz
tar -xvf 10X340_2_AB_2.tar.gz
rm 10X340_2_AB_2.tar.gz
mv 10X340_2_AB_2/fragments.tsv.gz ./10X340_2_AB_2_fragments.tsv.gz
mv 10X340_2_AB_2/fragments.tsv.gz.tbi ./10X340_2_AB_2_fragments.tsv.gz.tbi
gunzip 10X340_2_AB_2_fragments.tsv.gz
rm -r 10X340_2_AB_2
python sort_cells_by_celltype.py 10X340_2_AB_2_fragments.tsv 10X340_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X340_3_ABC_1.tar.gz
tar -xvf 10X340_3_ABC_1.tar.gz
rm 10X340_3_ABC_1.tar.gz
mv 10X340_3_ABC_1/fragments.tsv.gz ./10X340_3_ABC_1_fragments.tsv.gz
mv 10X340_3_ABC_1/fragments.tsv.gz.tbi ./10X340_3_ABC_1_fragments.tsv.gz.tbi
gunzip 10X340_3_ABC_1_fragments.tsv.gz
rm -r 10X340_3_ABC_1
python sort_cells_by_celltype.py 10X340_3_ABC_1_fragments.tsv 10X340_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X340_4_AB_2.tar.gz
tar -xvf 10X340_4_AB_2.tar.gz
rm 10X340_4_AB_2.tar.gz
mv 10X340_4_AB_2/fragments.tsv.gz ./10X340_4_AB_2_fragments.tsv.gz
mv 10X340_4_AB_2/fragments.tsv.gz.tbi ./10X340_4_AB_2_fragments.tsv.gz.tbi
gunzip 10X340_4_AB_2_fragments.tsv.gz
rm -r 10X340_4_AB_2
python sort_cells_by_celltype.py 10X340_4_AB_2_fragments.tsv 10X340_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X346_1_ABCD_1.tar.gz
tar -xvf 10X346_1_ABCD_1.tar.gz
rm 10X346_1_ABCD_1.tar.gz
mv 10X346_1_ABCD_1/fragments.tsv.gz ./10X346_1_ABCD_1_fragments.tsv.gz
mv 10X346_1_ABCD_1/fragments.tsv.gz.tbi ./10X346_1_ABCD_1_fragments.tsv.gz.tbi
gunzip 10X346_1_ABCD_1_fragments.tsv.gz
rm -r 10X346_1_ABCD_1
python sort_cells_by_celltype.py 10X346_1_ABCD_1_fragments.tsv 10X346_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X346_2_ABCD_2.tar.gz
tar -xvf 10X346_2_ABCD_2.tar.gz
rm 10X346_2_ABCD_2.tar.gz
mv 10X346_2_ABCD_2/fragments.tsv.gz ./10X346_2_ABCD_2_fragments.tsv.gz
mv 10X346_2_ABCD_2/fragments.tsv.gz.tbi ./10X346_2_ABCD_2_fragments.tsv.gz.tbi
gunzip 10X346_2_ABCD_2_fragments.tsv.gz
rm -r 10X346_2_ABCD_2
python sort_cells_by_celltype.py 10X346_2_ABCD_2_fragments.tsv 10X346_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X346_3_ABCD_2.tar.gz
tar -xvf 10X346_3_ABCD_2.tar.gz
rm 10X346_3_ABCD_2.tar.gz
mv 10X346_3_ABCD_2/fragments.tsv.gz ./10X346_3_ABCD_2_fragments.tsv.gz
mv 10X346_3_ABCD_2/fragments.tsv.gz.tbi ./10X346_3_ABCD_2_fragments.tsv.gz.tbi
gunzip 10X346_3_ABCD_2_fragments.tsv.gz
rm -r 10X346_3_ABCD_2
python sort_cells_by_celltype.py 10X346_3_ABCD_2_fragments.tsv 10X346_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X346_4_ABCD_2.tar.gz
tar -xvf 10X346_4_ABCD_2.tar.gz
rm 10X346_4_ABCD_2.tar.gz
mv 10X346_4_ABCD_2/fragments.tsv.gz ./10X346_4_ABCD_2_fragments.tsv.gz
mv 10X346_4_ABCD_2/fragments.tsv.gz.tbi ./10X346_4_ABCD_2_fragments.tsv.gz.tbi
gunzip 10X346_4_ABCD_2_fragments.tsv.gz
rm -r 10X346_4_ABCD_2
python sort_cells_by_celltype.py 10X346_4_ABCD_2_fragments.tsv 10X346_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X347_1_AB_2.tar.gz
tar -xvf 10X347_1_AB_2.tar.gz
rm 10X347_1_AB_2.tar.gz
mv 10X347_1_AB_2/fragments.tsv.gz ./10X347_1_AB_2_fragments.tsv.gz
mv 10X347_1_AB_2/fragments.tsv.gz.tbi ./10X347_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X347_1_AB_2_fragments.tsv.gz
rm -r 10X347_1_AB_2
python sort_cells_by_celltype.py 10X347_1_AB_2_fragments.tsv 10X347_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X347_2_ABC_1.tar.gz
tar -xvf 10X347_2_ABC_1.tar.gz
rm 10X347_2_ABC_1.tar.gz
mv 10X347_2_ABC_1/fragments.tsv.gz ./10X347_2_ABC_1_fragments.tsv.gz
mv 10X347_2_ABC_1/fragments.tsv.gz.tbi ./10X347_2_ABC_1_fragments.tsv.gz.tbi
gunzip 10X347_2_ABC_1_fragments.tsv.gz
rm -r 10X347_2_ABC_1
python sort_cells_by_celltype.py 10X347_2_ABC_1_fragments.tsv 10X347_2

