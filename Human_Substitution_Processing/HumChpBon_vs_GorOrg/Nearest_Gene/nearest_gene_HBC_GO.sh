#!/bin/bash
#SBATCH --time 48:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=16G

#Next we annotate variants with the nearest gene
python process_bed.py HumChpBon_GorOrg_SNPs.bed
python process_bed.py GorOrg_NotHBC_NonOverlap.bed

#Now intersect with the list of promoters we have
bedtools intersect -a HumChpBon_GorOrg_SNPs_fixed.bed -b Human_Promoters_Ortho_Sorted_hg38.bed -wa -wb > HBC_GO_SNPs_Promoter_Intersect.bed
bedtools intersect -a GorOrg_NotHBC_NonOverlap_fixed.bed -b Human_Promoters_Ortho_Sorted_hg38.bed -wa -wb > GO_NotHBC_NonOverlap_SNPs_Promoter_Intersect.bed


#Next use a python script to annotate variants as promoter proximal
python anno_prom_snps.py HBC_GO_SNPs_Promoter_Intersect.bed
python anno_prom_snps.py GO_NotHBC_NonOverlap_SNPs_Promoter_Intersect.bed


#Next use the sorted Orthologous TSS and bedtools closest to assign enhancers to genes (coupled to a python script)
#Can sort things appropriately with sort -k1,1 -k2,2n
sort -k1,1 -k2,2n Human_Promoters_Ortho_Sorted_hg38.bed > Human_Promoters_Ortho_Sorted_hg38_Sorted.bed
bedtools closest -k 10 -mdb all -a HumChpBon_GorOrg_SNPs_fixed.bed -b Human_Promoters_Ortho_Sorted_hg38_Sorted.bed > HBC_GO_SNPs_Closest_TSS.bed
bedtools closest -k 10 -mdb all -a GorOrg_NotHBC_NonOverlap_fixed.bed -b Human_Promoters_Ortho_Sorted_hg38_Sorted.bed > GO_NotHBC_NonOverlap_SNPs_Closest_TSS.bed

#Annotate with the two closest genes.
#NOTE: we will lose some records on alternative chromosomes that do not have at least 2 nearest genes!
#This is fine as we will filter these later anyway
python anno_enh_snps.py HBC_GO_SNPs_Closest_TSS.bed
python anno_enh_snps.py GO_NotHBC_NonOverlap_SNPs_Closest_TSS.bed

#For each promoter proximal variant, we want to add the distance to the next closest gene as well
bedtools intersect -wao -a HBC_GO_SNPs_Promoter_Intersect_AnnoProm.bed -b HBC_GO_SNPs_Closest_TSS_AnnoClosest.bed > HBC_GO_SNPs_Intersect_PromClosest.bed
bedtools intersect -wao -a GO_NotHBC_NonOverlap_SNPs_Promoter_Intersect_AnnoProm.bed -b GO_NotHBC_NonOverlap_SNPs_Closest_TSS_AnnoClosest.bed > GO_NotHBC_NonOverlap_SNPs_Intersect_PromClosest.bed

#Need a python script here to complete this process
#If a gene already had two promoter_proximal annotations, leave it be
#If a gene had only one, add the next closest one (the second as the promoter will always be closest)
python complete_anno_prom.py HBC_GO_SNPs_Intersect_PromClosest.bed
python complete_anno_prom.py GO_NotHBC_NonOverlap_SNPs_Intersect_PromClosest.bed

#Recombine the two files into a final annotated file
cat HBC_GO_SNPs_PromFinal.bed HBC_GO_SNPs_Closest_TSS_AnnoClosest.bed > HBC_GO_SNPs_AnnoAll_ToRem.bed
cat GO_NotHBC_NonOverlap_SNPs_PromFinal.bed GO_NotHBC_NonOverlap_SNPs_Closest_TSS_AnnoClosest.bed > GO_NotHBC_NonOverlap_SNPs_AnnoAll_ToRem.bed

#Remove the duplicates
awk '!seen[$4]++' HBC_GO_SNPs_AnnoAll_ToRem.bed > HBC_GO_SNPs_AnnoAll_ToReformat.bed
awk '!seen[$4]++' GO_NotHBC_NonOverlap_SNPs_AnnoAll_ToRem.bed > GO_NotHBC_NonOverlap_SNPs_AnnoAll_ToReformat.bed

#Reformat to join to the VEP + Conservation information
python reformat_nearest.py HBC_GO_SNPs_AnnoAll_ToReformat.bed
python reformat_nearest.py GO_NotHBC_NonOverlap_SNPs_AnnoAll_ToReformat.bed
