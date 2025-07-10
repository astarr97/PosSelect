#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH -p hbfraser
#SBATCH --mem=128GB
#SBATCH -c 1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X347_3_AB_2.tar.gz
tar -xvf 10X347_3_AB_2.tar.gz
rm 10X347_3_AB_2.tar.gz
mv 10X347_3_AB_2/fragments.tsv.gz ./10X347_3_AB_2_fragments.tsv.gz
mv 10X347_3_AB_2/fragments.tsv.gz.tbi ./10X347_3_AB_2_fragments.tsv.gz.tbi
gunzip 10X347_3_AB_2_fragments.tsv.gz
rm -r 10X347_3_AB_2
python sort_cells_by_celltype.py 10X347_3_AB_2_fragments.tsv 10X347_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X347_4_AB_2.tar.gz
tar -xvf 10X347_4_AB_2.tar.gz
rm 10X347_4_AB_2.tar.gz
mv 10X347_4_AB_2/fragments.tsv.gz ./10X347_4_AB_2_fragments.tsv.gz
mv 10X347_4_AB_2/fragments.tsv.gz.tbi ./10X347_4_AB_2_fragments.tsv.gz.tbi
gunzip 10X347_4_AB_2_fragments.tsv.gz
rm -r 10X347_4_AB_2
python sort_cells_by_celltype.py 10X347_4_AB_2_fragments.tsv 10X347_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X364_2_AB_1.tar.gz
tar -xvf 10X364_2_AB_1.tar.gz
rm 10X364_2_AB_1.tar.gz
mv 10X364_2_AB_1/fragments.tsv.gz ./10X364_2_AB_1_fragments.tsv.gz
mv 10X364_2_AB_1/fragments.tsv.gz.tbi ./10X364_2_AB_1_fragments.tsv.gz.tbi
gunzip 10X364_2_AB_1_fragments.tsv.gz
rm -r 10X364_2_AB_1
python sort_cells_by_celltype.py 10X364_2_AB_1_fragments.tsv 10X364_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X364_4_AB_1.tar.gz
tar -xvf 10X364_4_AB_1.tar.gz
rm 10X364_4_AB_1.tar.gz
mv 10X364_4_AB_1/fragments.tsv.gz ./10X364_4_AB_1_fragments.tsv.gz
mv 10X364_4_AB_1/fragments.tsv.gz.tbi ./10X364_4_AB_1_fragments.tsv.gz.tbi
gunzip 10X364_4_AB_1_fragments.tsv.gz
rm -r 10X364_4_AB_1
python sort_cells_by_celltype.py 10X364_4_AB_1_fragments.tsv 10X364_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X365_2_ABCDE_2.tar.gz
tar -xvf 10X365_2_ABCDE_2.tar.gz
rm 10X365_2_ABCDE_2.tar.gz
mv 10X365_2_ABCDE_2/fragments.tsv.gz ./10X365_2_ABCDE_2_fragments.tsv.gz
mv 10X365_2_ABCDE_2/fragments.tsv.gz.tbi ./10X365_2_ABCDE_2_fragments.tsv.gz.tbi
gunzip 10X365_2_ABCDE_2_fragments.tsv.gz
rm -r 10X365_2_ABCDE_2
python sort_cells_by_celltype.py 10X365_2_ABCDE_2_fragments.tsv 10X365_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X365_4_ABCDE_2.tar.gz
tar -xvf 10X365_4_ABCDE_2.tar.gz
rm 10X365_4_ABCDE_2.tar.gz
mv 10X365_4_ABCDE_2/fragments.tsv.gz ./10X365_4_ABCDE_2_fragments.tsv.gz
mv 10X365_4_ABCDE_2/fragments.tsv.gz.tbi ./10X365_4_ABCDE_2_fragments.tsv.gz.tbi
gunzip 10X365_4_ABCDE_2_fragments.tsv.gz
rm -r 10X365_4_ABCDE_2
python sort_cells_by_celltype.py 10X365_4_ABCDE_2_fragments.tsv 10X365_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X366_1_AB_1.tar.gz
tar -xvf 10X366_1_AB_1.tar.gz
rm 10X366_1_AB_1.tar.gz
mv 10X366_1_AB_1/fragments.tsv.gz ./10X366_1_AB_1_fragments.tsv.gz
mv 10X366_1_AB_1/fragments.tsv.gz.tbi ./10X366_1_AB_1_fragments.tsv.gz.tbi
gunzip 10X366_1_AB_1_fragments.tsv.gz
rm -r 10X366_1_AB_1
python sort_cells_by_celltype.py 10X366_1_AB_1_fragments.tsv 10X366_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X366_2_AB_1.tar.gz
tar -xvf 10X366_2_AB_1.tar.gz
rm 10X366_2_AB_1.tar.gz
mv 10X366_2_AB_1/fragments.tsv.gz ./10X366_2_AB_1_fragments.tsv.gz
mv 10X366_2_AB_1/fragments.tsv.gz.tbi ./10X366_2_AB_1_fragments.tsv.gz.tbi
gunzip 10X366_2_AB_1_fragments.tsv.gz
rm -r 10X366_2_AB_1
python sort_cells_by_celltype.py 10X366_2_AB_1_fragments.tsv 10X366_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X366_4_AB_1.tar.gz
tar -xvf 10X366_4_AB_1.tar.gz
rm 10X366_4_AB_1.tar.gz
mv 10X366_4_AB_1/fragments.tsv.gz ./10X366_4_AB_1_fragments.tsv.gz
mv 10X366_4_AB_1/fragments.tsv.gz.tbi ./10X366_4_AB_1_fragments.tsv.gz.tbi
gunzip 10X366_4_AB_1_fragments.tsv.gz
rm -r 10X366_4_AB_1
python sort_cells_by_celltype.py 10X366_4_AB_1_fragments.tsv 10X366_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X366_5_AB_1.tar.gz
tar -xvf 10X366_5_AB_1.tar.gz
rm 10X366_5_AB_1.tar.gz
mv 10X366_5_AB_1/fragments.tsv.gz ./10X366_5_AB_1_fragments.tsv.gz
mv 10X366_5_AB_1/fragments.tsv.gz.tbi ./10X366_5_AB_1_fragments.tsv.gz.tbi
gunzip 10X366_5_AB_1_fragments.tsv.gz
rm -r 10X366_5_AB_1
python sort_cells_by_celltype.py 10X366_5_AB_1_fragments.tsv 10X366_5

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X366_6_AB_1.tar.gz
tar -xvf 10X366_6_AB_1.tar.gz
rm 10X366_6_AB_1.tar.gz
mv 10X366_6_AB_1/fragments.tsv.gz ./10X366_6_AB_1_fragments.tsv.gz
mv 10X366_6_AB_1/fragments.tsv.gz.tbi ./10X366_6_AB_1_fragments.tsv.gz.tbi
gunzip 10X366_6_AB_1_fragments.tsv.gz
rm -r 10X366_6_AB_1
python sort_cells_by_celltype.py 10X366_6_AB_1_fragments.tsv 10X366_6

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X369_1_AB_1.tar.gz
tar -xvf 10X369_1_AB_1.tar.gz
rm 10X369_1_AB_1.tar.gz
mv 10X369_1_AB_1/fragments.tsv.gz ./10X369_1_AB_1_fragments.tsv.gz
mv 10X369_1_AB_1/fragments.tsv.gz.tbi ./10X369_1_AB_1_fragments.tsv.gz.tbi
gunzip 10X369_1_AB_1_fragments.tsv.gz
rm -r 10X369_1_AB_1
python sort_cells_by_celltype.py 10X369_1_AB_1_fragments.tsv 10X369_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X369_2_AB_1.tar.gz
tar -xvf 10X369_2_AB_1.tar.gz
rm 10X369_2_AB_1.tar.gz
mv 10X369_2_AB_1/fragments.tsv.gz ./10X369_2_AB_1_fragments.tsv.gz
mv 10X369_2_AB_1/fragments.tsv.gz.tbi ./10X369_2_AB_1_fragments.tsv.gz.tbi
gunzip 10X369_2_AB_1_fragments.tsv.gz
rm -r 10X369_2_AB_1
python sort_cells_by_celltype.py 10X369_2_AB_1_fragments.tsv 10X369_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X369_3_AB_1.tar.gz
tar -xvf 10X369_3_AB_1.tar.gz
rm 10X369_3_AB_1.tar.gz
mv 10X369_3_AB_1/fragments.tsv.gz ./10X369_3_AB_1_fragments.tsv.gz
mv 10X369_3_AB_1/fragments.tsv.gz.tbi ./10X369_3_AB_1_fragments.tsv.gz.tbi
gunzip 10X369_3_AB_1_fragments.tsv.gz
rm -r 10X369_3_AB_1
python sort_cells_by_celltype.py 10X369_3_AB_1_fragments.tsv 10X369_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X369_4_AB_1.tar.gz
tar -xvf 10X369_4_AB_1.tar.gz
rm 10X369_4_AB_1.tar.gz
mv 10X369_4_AB_1/fragments.tsv.gz ./10X369_4_AB_1_fragments.tsv.gz
mv 10X369_4_AB_1/fragments.tsv.gz.tbi ./10X369_4_AB_1_fragments.tsv.gz.tbi
gunzip 10X369_4_AB_1_fragments.tsv.gz
rm -r 10X369_4_AB_1
python sort_cells_by_celltype.py 10X369_4_AB_1_fragments.tsv 10X369_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X370_1_ABCD_2.tar.gz
tar -xvf 10X370_1_ABCD_2.tar.gz
rm 10X370_1_ABCD_2.tar.gz
mv 10X370_1_ABCD_2/fragments.tsv.gz ./10X370_1_ABCD_2_fragments.tsv.gz
mv 10X370_1_ABCD_2/fragments.tsv.gz.tbi ./10X370_1_ABCD_2_fragments.tsv.gz.tbi
gunzip 10X370_1_ABCD_2_fragments.tsv.gz
rm -r 10X370_1_ABCD_2
python sort_cells_by_celltype.py 10X370_1_ABCD_2_fragments.tsv 10X370_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X370_2_ABCD_2.tar.gz
tar -xvf 10X370_2_ABCD_2.tar.gz
rm 10X370_2_ABCD_2.tar.gz
mv 10X370_2_ABCD_2/fragments.tsv.gz ./10X370_2_ABCD_2_fragments.tsv.gz
mv 10X370_2_ABCD_2/fragments.tsv.gz.tbi ./10X370_2_ABCD_2_fragments.tsv.gz.tbi
gunzip 10X370_2_ABCD_2_fragments.tsv.gz
rm -r 10X370_2_ABCD_2
python sort_cells_by_celltype.py 10X370_2_ABCD_2_fragments.tsv 10X370_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X370_3_ABCDE_2.tar.gz
tar -xvf 10X370_3_ABCDE_2.tar.gz
rm 10X370_3_ABCDE_2.tar.gz
mv 10X370_3_ABCDE_2/fragments.tsv.gz ./10X370_3_ABCDE_2_fragments.tsv.gz
mv 10X370_3_ABCDE_2/fragments.tsv.gz.tbi ./10X370_3_ABCDE_2_fragments.tsv.gz.tbi
gunzip 10X370_3_ABCDE_2_fragments.tsv.gz
rm -r 10X370_3_ABCDE_2
python sort_cells_by_celltype.py 10X370_3_ABCDE_2_fragments.tsv 10X370_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X370_4_ABCD_2.tar.gz
tar -xvf 10X370_4_ABCD_2.tar.gz
rm 10X370_4_ABCD_2.tar.gz
mv 10X370_4_ABCD_2/fragments.tsv.gz ./10X370_4_ABCD_2_fragments.tsv.gz
mv 10X370_4_ABCD_2/fragments.tsv.gz.tbi ./10X370_4_ABCD_2_fragments.tsv.gz.tbi
gunzip 10X370_4_ABCD_2_fragments.tsv.gz
rm -r 10X370_4_ABCD_2
python sort_cells_by_celltype.py 10X370_4_ABCD_2_fragments.tsv 10X370_4

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X371_1_AB_1.tar.gz
tar -xvf 10X371_1_AB_1.tar.gz
rm 10X371_1_AB_1.tar.gz
mv 10X371_1_AB_1/fragments.tsv.gz ./10X371_1_AB_1_fragments.tsv.gz
mv 10X371_1_AB_1/fragments.tsv.gz.tbi ./10X371_1_AB_1_fragments.tsv.gz.tbi
gunzip 10X371_1_AB_1_fragments.tsv.gz
rm -r 10X371_1_AB_1
python sort_cells_by_celltype.py 10X371_1_AB_1_fragments.tsv 10X371_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X371_2_AB_1.tar.gz
tar -xvf 10X371_2_AB_1.tar.gz
rm 10X371_2_AB_1.tar.gz
mv 10X371_2_AB_1/fragments.tsv.gz ./10X371_2_AB_1_fragments.tsv.gz
mv 10X371_2_AB_1/fragments.tsv.gz.tbi ./10X371_2_AB_1_fragments.tsv.gz.tbi
gunzip 10X371_2_AB_1_fragments.tsv.gz
rm -r 10X371_2_AB_1
python sort_cells_by_celltype.py 10X371_2_AB_1_fragments.tsv 10X371_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X371_3_AB_1.tar.gz
tar -xvf 10X371_3_AB_1.tar.gz
rm 10X371_3_AB_1.tar.gz
mv 10X371_3_AB_1/fragments.tsv.gz ./10X371_3_AB_1_fragments.tsv.gz
mv 10X371_3_AB_1/fragments.tsv.gz.tbi ./10X371_3_AB_1_fragments.tsv.gz.tbi
gunzip 10X371_3_AB_1_fragments.tsv.gz
rm -r 10X371_3_AB_1
python sort_cells_by_celltype.py 10X371_3_AB_1_fragments.tsv 10X371_3

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X372_1_AB_1.tar.gz
tar -xvf 10X372_1_AB_1.tar.gz
rm 10X372_1_AB_1.tar.gz
mv 10X372_1_AB_1/fragments.tsv.gz ./10X372_1_AB_1_fragments.tsv.gz
mv 10X372_1_AB_1/fragments.tsv.gz.tbi ./10X372_1_AB_1_fragments.tsv.gz.tbi
gunzip 10X372_1_AB_1_fragments.tsv.gz
rm -r 10X372_1_AB_1
python sort_cells_by_celltype.py 10X372_1_AB_1_fragments.tsv 10X372_1

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X372_2_AB_1.tar.gz
tar -xvf 10X372_2_AB_1.tar.gz
rm 10X372_2_AB_1.tar.gz
mv 10X372_2_AB_1/fragments.tsv.gz ./10X372_2_AB_1_fragments.tsv.gz
mv 10X372_2_AB_1/fragments.tsv.gz.tbi ./10X372_2_AB_1_fragments.tsv.gz.tbi
gunzip 10X372_2_AB_1_fragments.tsv.gz
rm -r 10X372_2_AB_1
python sort_cells_by_celltype.py 10X372_2_AB_1_fragments.tsv 10X372_2

wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X372_3_AB_1.tar.gz
tar -xvf 10X372_3_AB_1.tar.gz
rm 10X372_3_AB_1.tar.gz
mv 10X372_3_AB_1/fragments.tsv.gz ./10X372_3_AB_1_fragments.tsv.gz
mv 10X372_3_AB_1/fragments.tsv.gz.tbi ./10X372_3_AB_1_fragments.tsv.gz.tbi
gunzip 10X372_3_AB_1_fragments.tsv.gz
rm -r 10X372_3_AB_1
python sort_cells_by_celltype.py 10X372_3_AB_1_fragments.tsv 10X372_3

