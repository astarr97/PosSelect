
python back_to_bed_poly.py HumanPoly_MAF0.001_AF_Cons_VEP.txt

sort -k1,1 -k2,2n HumanPoly_MAF0.001_AF_Cons_VEP_Sorted.bed > HumanPoly_MAF0.001_AF_Cons_VEP_Sorted_Sorted.bed
sort -k1,1 -k2,2 HumanPoly_MAF0.001_AF_Cons_VEP.bed > HumanPoly_MAF0.001_AF_Cons_VEP_Sorted.bed
bedtools intersect -sorted -wao -a HumanPoly_MAF0.001_AF_Cons_VEP_Sorted_Sorted.bed -b hg38.panTro6.synNet.sorted.bed > HumanPoly_Chp.bed
python remove_poly.py HumanPoly_Chp.bed

bedtools intersect -sorted -wao -a HumanPoly_Chp_rm.bed -b hg38.gorGor6.synNet.sorted.bed > HumanPoly_Chp_Gor.bed
python remove_poly.py HumanPoly_Chp_Gor.bed

python prep_join_poly_gor.py HumanPoly_Chp_Gor_rm.bed