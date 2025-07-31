#Next we annotate variants with the nearest gene
#This alters the bed file so we can intersect
python process_bed_for_nearest.py All_Just_AF_0.001.bed

#Now intersect with the list of promoters we have from the Wang, Starr, Fraser 2023
bedtools intersect -a All_Just_AF_0.001_New.bed -b Human_Promoters_Ortho_Sorted_hg38.bed -wa -wb > HumPoly_SNPs_Promoter_Intersect.bed

#Next use a python script to annotate variants as promoter proximal
python anno_prom_snps_poly.py HumPoly_SNPs_Promoter_Intersect.bed

#Next use the sorted Orthologous TSS and bedtools closest to assign enhancers to genes (coupled to a python script)
sort -k1,1 -k2,2n Human_Promoters_Ortho_Sorted_hg38.bed > Human_Promoters_Ortho_Sorted_hg38_Sorted.bed
sort -k1,1 -k2,2n All_Just_AF_0.001_New.bed > All_Just_AF_0.001_New_Sorted.bed
bedtools closest -k 10 -mdb all -a All_Just_AF_0.001_New_Sorted.bed -b Human_Promoters_Ortho_Sorted_hg38_Sorted.bed > HumPoly_SNPs_Closest_TSS.bed

#Annotate with the two closest genes.
#NOTE: we will lose some records on alternative chromosomes that do not have at least 2 nearest genes!
#This is fine as we will filter these later anyway
python anno_enh_snps_poly.py HumPoly_SNPs_Closest_TSS.bed

#For each promoter proximal variant, we want to add the distance to the next closest gene as well
bedtools intersect -wao -a HumPoly_SNPs_Promoter_Intersect_AnnoProm.bed -b HumPoly_SNPs_Closest_TSS_AnnoClosest.bed > HumPoly_SNPs_Intersect_PromClosest.bed

#If a gene already had two promoter_proximal annotations, leave it be
#If a gene had only one, add the next closest one (the second as the promoter will always be closest)
python complete_anno_prom_poly.py HumPoly_SNPs_Intersect_PromClosest.bed

#Make column 3 unique (indexing from zero so column 4 to awk) by adding REF and ALT
python add_var_nearest.py

#Recombine the two files into a final annotated file
cat HumPoly_SNPs_PromFinal.bed HumPoly_SNPs_Closest_TSS_AnnoClosestVar.bed > HumPoly_SNPs_AnnoAll_ToRem.bed

#Remove the duplicates
awk '!seen[$4]++' HumPoly_SNPs_AnnoAll_ToRem.bed > HumPoly_SNPs_AnnoAll_ToReformat.bed

#Reformat to join to the VEP + Conservation information
python reformat_nearest.py
