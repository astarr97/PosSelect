#!/bin/bash
#SBATCH --time=96:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB

../RepeatMasker/RepeatMasker fasta_file