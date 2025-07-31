#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p normal,owners,hbfraser
#SBATCH --mem=48000
#SBATCH -c 2

#Sort and intersect with the SNP list
bedtools intersect -sorted -wao -a human_referenced_gor_hum_snps.bed -b hg38.panTro6.synNet.sorted.bed > hg38.panTro6.synNet.sorted.intersect.bed
mv hg38.panTro6.synNet.sorted.intersect.bed HumGor_SNPs_Unfiltered_Chp.bed
python format_after_maf.py HumGor_SNPs_Unfiltered_Chp.bed
python back_to_bed.py HumGor_SNPs_Unfiltered_Chp_ToJoin.txt

bedtools intersect -sorted -wao -a HumGor_SNPs_Unfiltered_Chp_ToJoin.bed -b hg38.panPan3.synNet.sorted.bed > HumGor_SNPs_Unfiltered_Chp_Bon.bed
python format_after_maf.py HumGor_SNPs_Unfiltered_Chp_Bon.bed
python back_to_bed.py HumGor_SNPs_Unfiltered_Chp_Bon_ToJoin.txt

bedtools intersect -sorted -wao -a HumGor_SNPs_Unfiltered_Chp_Bon_ToJoin.bed -b hg38.ponAbe3.synNet.sorted.bed > HumGor_SNPs_Unfiltered_Chp_Bon_Org.bed
python format_after_maf.py HumGor_SNPs_Unfiltered_Chp_Bon_Org.bed
python back_to_bed.py HumGor_SNPs_Unfiltered_Chp_Bon_Org_ToJoin.txt

bedtools intersect -sorted -wao -a HumGor_SNPs_Unfiltered_Chp_Bon_Org_ToJoin.bed -b hg38.rheMac10.synNet.sorted.bed > HumGor_SNPs_Unfiltered_Chp_Bon_Org_Rhe.bed
python format_after_maf.py HumGor_SNPs_Unfiltered_Chp_Bon_Org_Rhe.bed
python back_to_bed.py HumGor_SNPs_Unfiltered_Chp_Bon_Org_Rhe_ToJoin.txt
