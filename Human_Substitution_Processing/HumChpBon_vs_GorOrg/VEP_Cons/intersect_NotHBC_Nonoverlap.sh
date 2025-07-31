#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G

sort -k1,1 -k2,2n GorOrg_NotHBC_NonOverlap.bed > GorOrg_NotHBC_NonOverlap_Sorted.bed

#python fix_bed.py

bedtools intersect -wao -sorted -a GorOrg_NotHBC_NonOverlap_Sorted.bed -b hg38.phyloP100way.bedgraph > GorOrg_NotHBC_NonOverlap_P100.bed
bedtools intersect -wao -sorted -a GorOrg_NotHBC_NonOverlap_P100.bed -b hg38.phyloP30way.bedgraph > GorOrg_NotHBC_NonOverlap_P100_P30.bed
bedtools intersect -wao -sorted -a GorOrg_NotHBC_NonOverlap_P100_P30.bed -b hg38.phastCons100way.bedgraph > GorOrg_NotHBC_NonOverlap_P100_P30_C100.bed
bedtools intersect -wao -sorted -a GorOrg_NotHBC_NonOverlap_P100_P30_C100.bed -b hg38.phastCons30way.bedgraph > GorOrg_NotHBC_NonOverlap_P100_P30_C100_C30.bed
bedtools intersect -wao -sorted -a GorOrg_NotHBC_NonOverlap_P100_P30_C100_C30.bed -b hg38.cactus241way.phyloP.bedgraph > GorOrg_NotHBC_NonOverlap_P100_P30_C100_C30_P241.bed
bedtools intersect -wao -sorted -a GorOrg_NotHBC_NonOverlap_P100_P30_C100_C30_P241.bed -b hg38.phyloP470way.bedgraph > GorOrg_NotHBC_NonOverlap_P100_P30_C100_C30_P241_P470.bed
bedtools intersect -wao -sorted -a GorOrg_NotHBC_NonOverlap_P100_P30_C100_C30_P241_P470.bed -b hg38.phastCons470way.bedgraph > GorOrg_NotHBC_NonOverlap_P100_P30_C100_C30_P241_P470_C470.bed
