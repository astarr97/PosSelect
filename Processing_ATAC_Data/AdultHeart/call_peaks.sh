#!/bin/bash
#SBATCH --time=120:00:00
#SBATCH -p normal,owners,hbfraser
#SBATCH --mem=48000
#SBATCH -c 1

macs2 callpeak -t Macrophage.bed -f BED -p 0.01 --nomodel --shift -100 --extsize 200 --call-summits --keep-dup all -n Macrophage_Adult_Heart
macs2 callpeak -t Endothelial.bed -f BED -p 0.01 --nomodel --shift -100 --extsize 200 --call-summits --keep-dup all -n Endothelial_Adult_Heart
macs2 callpeak -t Fibroblast.bed -f BED -p 0.01 --nomodel --shift -100 --extsize 200 --call-summits --keep-dup all -n Fibroblast_Adult_Heart
macs2 callpeak -t Atrial_cardiomyocyte.bed -f BED -p 0.01 --nomodel --shift -100 --extsize 200 --call-summits --keep-dup all -n Atrial_cardiomyocyte_Adult_Heart
macs2 callpeak -t Smooth_muscle.bed -f BED -p 0.01 --nomodel --shift -100 --extsize 200 --call-summits --keep-dup all -n Smooth_muscle_Adult_Heart
macs2 callpeak -t Ventricular_cardiomyocyte.bed -f BED -p 0.01 --nomodel --shift -100 --extsize 200 --call-summits --keep-dup all -n Ventricular_cardiomyocyte_Adult_Heart
