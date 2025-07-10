#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH -p normal,owners,hbfraser
#SBATCH --mem=48000
#SBATCH -c 1

samtools merge Chondrocytes_All.bam *.bam

samtools view -b Chondrocytes_All.bam chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY > Chondrocytes_All_Filt.bam
samtools index Chondrocytes_All.bam
samtools view -b Chondrocytes_All.bam chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY > Chondrocytes_All_Filt.bam

bedtools bamtobed -i Chondrocytes_All_Filt.bam > Chondrocytes_All_Filt.bed
macs2 callpeak -t Chondrocytes_All_Filt.bed -f BED -p 0.01 --nomodel --shift 75 --extsize 150 -B --SPMR --keep-dup all --call-summits -n Chondrocytes_All_Filt

sort -k1,1 -k3n -k2n Chondrocytes_All_Filt_peaks.narrowPeak > Chondrocytes_All_Filt_peaks_sorted.narrowPeak

python merge.py Chondrocytes_All_Filt_peaks_sorted.narrowPeak
