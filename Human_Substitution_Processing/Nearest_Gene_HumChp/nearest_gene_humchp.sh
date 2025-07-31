#!/bin/bash
#SBATCH --time 48:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=16G

#Next we annotate variants with the nearest gene
python process_bed.py
#Now intersect with the list of promoters we have
bedtools intersect -a ASE_SNPs.FILTER.SPLIT_SPECIES_New.bed -b Human_Promoters_Ortho_Sorted_hg38.bed -wa -wb > HumChp_SNPs_Promoter_Intersect.bed

#Next use a python script to annotate variants as promoter proximal
python anno_prom_snps.py HumChp_SNPs_Promoter_Intersect.bed

#Next use the sorted Orthologous TSS and bedtools closest to assign enhancers to genes (coupled to a python script)
#Can sort things appropriately with sort -k1,1 -k2,2n
sort -k1,1 -k2,2n Human_Promoters_Ortho_Sorted_hg38.bed > Human_Promoters_Ortho_Sorted_hg38_Sorted.bed
bedtools closest -k 10 -mdb all -a ASE_SNPs.FILTER.SPLIT_SPECIES_New.bed -b Human_Promoters_Ortho_Sorted_hg38_Sorted.bed > HumChp_SNPs_Closest_TSS.bed

#Annotate with the two closest genes.
#NOTE: we will lose some records on alternative chromosomes that do not have at least 2 nearest genes!
#This is fine as we will filter these later anyway
python anno_enh_snps.py HumChp_SNPs_Closest_TSS.bed

#For each promoter proximal variant, we want to add the distance to the next closest gene as well
bedtools intersect -wao -a HumChp_SNPs_Promoter_Intersect_AnnoProm.bed -b HumChp_SNPs_Closest_TSS_AnnoClosest.bed > HumChp_SNPs_Intersect_PromClosest.bed
#Need a python script here to complete this process
#If a gene already had two promoter_proximal annotations, leave it be
#If a gene had only one, add the next closest one (the second as the promoter will always be closest)
python complete_anno_prom.py HumChp_SNPs_Intersect_PromClosest.bed

#Recombine the two files into a final annotated file
cat HumChp_SNPs_PromFinal.bed HumChp_SNPs_Closest_TSS_AnnoClosest.bed > HumChp_SNPs_AnnoAll_ToRem.bed

#Remove the duplicates
awk '!seen[$4]++' HumChp_SNPs_AnnoAll_ToRem.bed > HumChp_SNPs_AnnoAll_ToReformat.bed

#Reformat to join to the VEP + Conservation information
python reformat_nearest.py
