#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G

sort -k1,1 -k2,2n Chimpanzee_Derived_Variants.bed > Chimpanzee_Derived_Variants_Sorted.bed

#python fix_bed.py

bedtools intersect -wao -sorted -a Chimpanzee_Derived_Variants_Sorted.bed -b hg38.phyloP100way.bedgraph > Chimpanzee_Derived_Variants_P100.bed
bedtools intersect -wao -sorted -a Chimpanzee_Derived_Variants_P100.bed -b hg38.phyloP30way.bedgraph > Chimpanzee_Derived_Variants_P100_P30.bed
bedtools intersect -wao -sorted -a Chimpanzee_Derived_Variants_P100_P30.bed -b hg38.phastCons100way.bedgraph > Chimpanzee_Derived_Variants_P100_P30_C100.bed
bedtools intersect -wao -sorted -a Chimpanzee_Derived_Variants_P100_P30_C100.bed -b hg38.phastCons30way.bedgraph > Chimpanzee_Derived_Variants_P100_P30_C100_C30.bed
bedtools intersect -wao -sorted -a Chimpanzee_Derived_Variants_P100_P30_C100_C30.bed -b hg38.cactus241way.phyloP.bedgraph > Chimpanzee_Derived_Variants_P100_P30_C100_C30_P241.bed
bedtools intersect -wao -sorted -a Chimpanzee_Derived_Variants_P100_P30_C100_C30_P241.bed -b hg38.phyloP470way.bedgraph > Chimpanzee_Derived_Variants_P100_P30_C100_C30_P241_P470.bed
bedtools intersect -wao -sorted -a Chimpanzee_Derived_Variants_P100_P30_C100_C30_P241_P470.bed -b hg38.phastCons470way.bedgraph > Chimpanzee_Derived_Variants_P100_P30_C100_C30_P241_P470_C470.bed
