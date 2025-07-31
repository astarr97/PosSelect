

rclone copy fraser:astarr/SNPs_Indels/bonobo/human_referenced_bon_hum_snps.bed ./
rclone copy fraser:astarr/SNPs_Indels/chimp/human_referenced_chp_hum_snps.bed ./

bedtools intersect -sorted -wao -a human_referenced_bon_hum_snps.bed -b hg38.panTro6.synNet.sorted.bed > HumBon_SNPs_Chp.bed
python format_after_maf.py HumBon_SNPs_Chp.bed

bedtools intersect -sorted -wao -a human_referenced_chp_hum_snps.bed -b hg38.panPan3.synNet.sorted.bed > HumChp_SNPs_Bon.bed
python format_after_maf.py HumChp_SNPs_Bon.bed

python get_chimp_spec.py
python get_bon_spec.py