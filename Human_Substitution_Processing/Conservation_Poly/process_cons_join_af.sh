#Intersect with conservation information
bedtools intersect -wao -sorted -a All_Just_AF_0.001_Sorted_Fixed.bed -b hg38.phyloP100way.bedgraph > All_Just_AF_0.001_P100.bed
bedtools intersect -wao -sorted -a All_Just_AF_0.001_P100.bed -b hg38.phyloP30way.bedgraph > All_Just_AF_0.001_P100_P30.bed
bedtools intersect -wao -sorted -a All_Just_AF_0.001_P100_P30.bed -b hg38.phastCons100way.bedgraph > All_Just_AF_0.001_P100_P30_C100.bed
bedtools intersect -wao -sorted -a All_Just_AF_0.001_P100_P30_C100.bed -b hg38.phastCons30way.bedgraph > All_Just_AF_0.001_P100_P30_C100_C30.bed
bedtools intersect -wao -sorted -a All_Just_AF_0.001_P100_P30_C100_C30.bed -b hg38.cactus241way.phyloP.bedgraph > All_Just_AF_0.001_P100_P30_C100_C30_P241.bed
bedtools intersect -wao -sorted -a All_Just_AF_0.001_P100_P30_C100_C30_P241.bed -b hg38.phyloP470way.bedgraph > All_Just_AF_0.001_P100_P30_C100_C30_P241_P470.bed
bedtools intersect -wao -sorted -a All_Just_AF_0.001_P100_P30_C100_C30_P241_P470.bed -b hg38.phastCons470way.bedgraph > All_Just_AF_0.001_P100_P30_C100_C30_P241_P470_C470.bed

#Get rid of extraneous columns
python process_cons_poly.py

#Join to the conservation information
### THERE ARE REPEATED POSITIONS IN THE POLYMORPHISM DATA; AS A RESULT THERE ARE MORE LINES IN THE JOIN OUTPUT THAN IN EITHER OF THE JOIN INPUT FILES!
### THIS IS FINE HERE, BUT FOR JOINING TO THE VEP PREDICTIONS WE WILL NEED TO INCLUDE THE NUCLEOTIDE IN THE VARIANT ID!
python prep_join.py All_Just_AF_0.001_Sorted.bed All_Summarized_0.001Consol_P100_P30_C100_C30_P241_P470_C470_Sum.bed

sort -k1,1 All_Just_AF_0.001_Sorted_ToJoin.txt > All_Just_AF_0.001_Sorted_ToJoin_Sorted.txt
sort -k1,1 All_Summarized_0.001Consol_P100_P30_C100_C30_P241_P470_C470_Sum_ToJoin.txt > All_Summarized_0.001Consol_P100_P30_C100_C30_P241_P470_C470_Sum_ToJoin_Sorted.txt
join All_Just_AF_0.001_Sorted_ToJoin_Sorted.txt All_Summarized_0.001Consol_P100_P30_C100_C30_P241_P470_C470_Sum_ToJoin_Sorted.txt > HumanPoly_MAF0.001_AF_Cons.txt

#Remove duplicates from the file
uniq HumanPoly_MAF0.001_AF_Cons.txt HumanPoly_MAF0.001_AF_Cons_Filt.txt
