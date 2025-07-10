#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G

trim_galore --paired --stringency 5 --length 20 --fastqc --consider_already_trimmed 1000 -o analysis/seqprep/ATAC_iN_14095_Normal -q 20 ATAC_iN_14095_Normal_1.fastq.gz ATAC_iN_14095_Normal_2.fastq.gz