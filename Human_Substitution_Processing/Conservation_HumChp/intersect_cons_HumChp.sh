#Sort before intersecting
sort -k1,1 -k2,2n ASE_SNPs.FILTER.SPLIT_SPECIES.bed > ASE_SNPs.FILTER.SPLIT_SPECIES_Sorted.bed

#intersect
bedtools intersect -wao -sorted -a ASE_SNPs.FILTER.SPLIT_SPECIES_Sorted.bed -b hg38.phyloP100way.bedgraph > Human_Chimp_Filtered_P100.bed
bedtools intersect -wao -sorted -a Human_Chimp_Filtered_P100.bed -b hg38.phyloP30way.bedgraph > Human_Chimp_Filtered_P100_P30.bed
bedtools intersect -wao -sorted -a Human_Chimp_Filtered_P100_P30.bed -b hg38.phastCons100way.bedgraph > Human_Chimp_Filtered_P100_P30_C100.bed
bedtools intersect -wao -sorted -a Human_Chimp_Filtered_P100_P30_C100.bed -b hg38.phastCons30way.bedgraph > Human_Chimp_Filtered_P100_P30_C100_C30.bed
bedtools intersect -wao -sorted -a Human_Chimp_Filtered_P100_P30_C100_C30.bed -b hg38.cactus241way.phyloP.bedgraph > Human_Chimp_Filtered_P100_P30_C100_C30_P241.bed
bedtools intersect -wao -sorted -a Human_Chimp_Filtered_P100_P30_C100_C30_P241.bed -b hg38.phyloP470way.bedgraph > Human_Chimp_Filtered_P100_P30_C100_C30_P241_P470.bed
bedtools intersect -wao -sorted -a Human_Chimp_Filtered_P100_P30_C100_C30_P241_P470.bed -b hg38.phastCons470way.bedgraph > Human_Chimp_Filtered_P100_P30_C100_C30_P241_P470_C470.bed

#Process the conservation to format it properly
python process_cons_human_chimp.py
