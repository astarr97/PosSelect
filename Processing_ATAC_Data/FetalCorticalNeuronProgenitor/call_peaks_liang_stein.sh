#!/bin/bash
#SBATCH --time=120:00:00
#SBATCH -p normal,owners,hbfraser
#SBATCH --mem=48000
#SBATCH -c 1

samtools view -b LiangSteinNeuron.bam chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY > LiangSteinNeuron.fix.bam
samtools index LiangSteinNeuron.fix.bam
samtools view -b LiangSteinProgenitor.bam chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY > LiangSteinProgenitor.fix.bam
samtools index LiangSteinProgenitor.fix.bam

LSN=$(samtools view -c LiangSteinNeuron.fix.bam)
echo $LSN
LSP=$(samtools view -c LiangSteinProgenitor.fix.bam)
echo $LSP

java -jar picard.jar SortSam I=LiangSteinProgenitor.fix.bam O=LiangSteinProgenitor.fix.sort.bam SORT_ORDER=coordinate
java -jar picard.jar DownsampleSam I=LiangSteinProgenitor.fix.sort.bam O=LiangSteinProgenitor.fix.downsampled.bam P=0.9048566

bedtools bamtobed -i LiangSteinProgenitor.fix.downsampled.bam > LiangSteinProgenitor.fix.downsampled.bed
macs2 callpeak -t LiangSteinProgenitor.fix.downsampled.bed -f BED -p 0.01 --nomodel --shift 75 --extsize 150 -B --SPMR --keep-dup all --call-summits -n LiangSteinProgenitor.fix.downsampled

bedtools bamtobed -i LiangSteinNeuron.fix.bam > LiangSteinNeuron.fix.bed
macs2 callpeak -t LiangSteinNeuron.fix.bed -f BED -p 0.01 --nomodel --shift 75 --extsize 150 -B --SPMR --keep-dup all --call-summits -n LiangSteinNeuron.fix

#Sort and then merge overlapping peaks
sort -k1,1 -k3n -k2n LiangSteinNeuron.fix_peaks.narrowPeak > LiangSteinNeuron.fix_peaks_sorted.narrowPeak
sort -k1,1 -k3n -k2n LiangSteinProgenitor.fix.downsampled_peaks.narrowPeak > LiangSteinProgenitor.fix.downsampled_peaks_sorted.narrowPeak

python merge.py LiangSteinNeuron.fix_peaks_sorted.narrowPeak
python merge.py LiangSteinProgenitor.fix.downsampled_peaks_sorted.narrowPeak

mv LiangSteinProgenitor.fix_peaks_sorted_merged.narrowPeak LiangSteinProgenitor_Final_Peaks.bed
mv LiangSteinProgenitor.fix.downsampled_peaks_sorted_merged.narrowPeak LiangSteinProgenitor_Final_Peaks.bed

cat LiangSteinProgenitor_Final_Peaks.bed LiangSteinNeuron_Final_Peaks.bed > LiangSteinNeuronAndProgenitor_Peaks.narrowPeak

sort -k1,1 -k3n -k2n LiangSteinNeuronAndProgenitor_Peaks.narrowPeak > LiangSteinNeuronAndProgenitor_Peaks_Sorted.narrowPeak

python merge.py LiangSteinNeuronAndProgenitor_Peaks_Sorted.narrowPeak

mv LiangSteinNeuronAndProgenitor_Peaks_Sorted_merged.narrowPeak LiangSteinNeuronAndProgenitor_Peaks_Final.bed