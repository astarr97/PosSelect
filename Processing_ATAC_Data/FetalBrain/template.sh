wget https://storage.googleapis.com/linnarsson-lab-human/ATAC_dev/10X/10X232_1_AB_2.tar.gz
tar -xvf 10X232_1_AB_2.tar.gz
rm 10X232_1_AB_2.tar.gz
mv 10X232_1_AB_2/fragments.tsv.gz ./10X232_1_AB_2_fragments.tsv.gz
mv 10X232_1_AB_2/fragments.tsv.gz.tbi ./10X232_1_AB_2_fragments.tsv.gz.tbi
gunzip 10X232_1_AB_2_fragments.tsv.gz
rm -r 10X232_1_AB_2
python sort_cells_by_celltype.py 10X232_1_AB_2_fragments.tsv 10X232_1