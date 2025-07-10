#Downloaded most peaks from subclass folder, but a few from http://catlas.org/catlas_downloads/humanbrain/cCREs/

cat PKJ_1.bed PKJ_2.bed > PKJ_unmerged.bed
sort -k1,1 -k2,2n PKJ_unmerged.bed > PKJ_unmerged.sort.bed
bedtools merge -i PKJ_unmerged.sort.bed > PKJ.bed

cat ICGA_1.bed ICGA_2.bed > ICGA_unmerged.bed
sort -k1,1 -k2,2n ICGA_unmerged.bed > ICGA_unmerged.sort.bed
bedtools merge -i ICGA_unmerged.sort.bed > ICGA.bed

cat ERC_1.bed ERC_2.bed > ERC_unmerged.bed
sort -k1,1 -k2,2n ERC_unmerged.bed > ERC_unmerged.sort.bed
bedtools merge -i ERC_unmerged.sort.bed > ERC.bed