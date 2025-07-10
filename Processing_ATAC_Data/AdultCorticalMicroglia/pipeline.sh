#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G

trim_galore --paired --stringency 5 --length 20 --fastqc --consider_already_trimmed 1000 -o analysis/seqprep/FOLDER -q 20 FILE1 FILE2