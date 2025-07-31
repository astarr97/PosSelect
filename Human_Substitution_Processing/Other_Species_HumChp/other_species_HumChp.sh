#We now need to determine which variants are human-derived and which variants are chimpanzee derived using maf files
wget ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/vsGorGor6/hg38.gorGor6.synNet.maf.gz
gunzip hg38.gorGor6.synNet.maf.gz
wget ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/vsPanTro6/hg38.panTro6.synNet.maf.gz
gunzip hg38.panTro6.synNet.maf.gz
wget ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/vsPanPan3/hg38.panPan3.synNet.maf.gz
gunzip hg38.panPan3.synNet.maf.gz
wget ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/vsPonAbe3/hg38.ponAbe3.synNet.maf.gz
gunzip hg38.ponAbe3.synNet.maf.gz
wget ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/vsRheMac10/hg38.rheMac10.synNet.maf.gz
gunzip hg38.rheMac10.synNet.maf.gz
wget ftp://hgdownload.soe.ucsc.edu/goldenPath/hg38/vsCalJac4/hg38.calJac4.synNet.maf.gz
gunzip hg38.calJac4.synNet.maf.gz

#Convert to a bed format and sort
python callSNPsFromMAF.py hg38.gorGor6.synNet.maf hg38.gorGor6.synNet.txt
python make_bed_after_maf.py hg38.gorGor6.synNet.txt hg38.gorGor6.synNet.bed
sort -k1,1 -k2,2n hg38.gorGor6.synNet.bed > hg38.gorGor6.synNet.sorted.bed

python callSNPsFromMAF.py hg38.panPan3.synNet.maf hg38.panPan3.synNet.txt
python make_bed_after_maf.py hg38.panPan3.synNet.txt hg38.panPan3.synNet.bed
sort -k1,1 -k2,2n hg38.panPan3.synNet.bed > hg38.panPan3.synNet.sorted.bed

python callSNPsFromMAF.py hg38.panTro6.synNet.maf hg38.panTro6.synNet.txt
python make_bed_after_maf.py hg38.panTro6.synNet.txt hg38.panTro6.synNet.bed
sort -k1,1 -k2,2n hg38.panTro6.synNet.bed > hg38.panTro6.synNet.sorted.bed

python callSNPsFromMAF.py hg38.ponAbe3.synNet.maf hg38.ponAbe3.synNet.txt
python make_bed_after_maf.py hg38.ponAbe3.synNet.txt hg38.ponAbe3.synNet.bed
sort -k1,1 -k2,2n hg38.ponAbe3.synNet.bed > hg38.ponAbe3.synNet.sorted.bed

python callSNPsFromMAF.py hg38.rheMac10.synNet.maf hg38.rheMac10.synNet.txt
python make_bed_after_maf.py hg38.rheMac10.synNet.txt hg38.rheMac10.synNet.bed
sort -k1,1 -k2,2n hg38.rheMac10.synNet.bed > hg38.rheMac10.synNet.sorted.bed

python callSNPsFromMAF.py hg38.calJac4.synNet.maf hg38.calJac4.synNet.txt
python make_bed_after_maf.py hg38.calJac4.synNet.txt hg38.calJac4.synNet.bed
sort -k1,1 -k2,2n hg38.calJac4.synNet.bed > hg38.calJac4.synNet.sorted.bed


#Sort and intersect with the SNP list
bedtools intersect -sorted -wao -a ASE_SNPs.FILTER.SPLIT_SPECIES_Sorted.bed -b hg38.gorGor6.synNet.sorted.bed > hg38.gorGor6.synNet.sorted.intersect.bed

#Process it to convert it into a format we can join with the SNPs
python format_after_maf.py hg38.gorGor6.synNet.sorted.intersect.bed

mv hg38.gorGor6.synNet.sorted.intersect_ToJoin.txt HumCHp_SNPs_3WGS_Filtered_Gor.txt

#This process was iteratively repeated with bonobo, then orangutan, then rhesus macaque, then marmoset using the output _ToJoin.txt file as input to the next round

#Convert to a bed format

python back_to_bed.py HumChp_SNPs_3WGS_Filtered_Gor.txt
bedtools intersect -sorted -wao -a HumChp_SNPs_3WGS_Filtered_Gor.bed -b hg38.panPan3.synNet.sorted.bed > HumChp_SNPs_3WGS_Filtered_Gor_Bon.bed
#Process it to convert it into a format we can join with the SNPs
python format_after_maf.py HumChp_SNPs_3WGS_Filtered_Gor_Bon.bed

python back_to_bed.py HumChp_SNPs_3WGS_Filtered_Gor_Bon_ToJoin.txt
bedtools intersect -sorted -wao -a HumChp_SNPs_3WGS_Filtered_Gor_Bon_ToJoin.bed -b hg38.ponAbe3.synNet.sorted.bed > HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org.bed
#Process it to convert it into a format we can join with the SNPs
python format_after_maf.py HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org.bed

python back_to_bed.py HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org_ToJoin.txt
bedtools intersect -sorted -wao -a HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org_ToJoin.bed -b hg38.rheMac10.synNet.sorted.bed > HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org_Rhe.bed
#Process it to convert it into a format we can join with the SNPs
python format_after_maf.py HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org_Rhe.bed

python back_to_bed.py HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org_Rhe_ToJoin.txt
bedtools intersect -sorted -wao -a HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org_Rhe_ToJoin.bed -b hg38.calJac4.synNet.sorted.bed > HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org_Rhe_Marm.bed
#Process it to convert it into a format we can join with the SNPs
python format_after_maf.py HumChp_SNPs_3WGS_Filtered_Gor_Bon_Org_Rhe_Marm.bed
