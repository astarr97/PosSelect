#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p hbfraser
#SBATCH --mem=8GB
#SBATCH -c 1

wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181664/suppl/GSM8181664%5FDonor1%5Fcortex%5Ffragments.tsv.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181664/suppl/GSM8181664%5FDonor1%5Fcortex%5Ffragments.tsv.gz.tbi.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181665/suppl/GSM8181665%5FDonor2%5Fcortex%5Ffragments.tsv.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181665/suppl/GSM8181665%5FDonor2%5Fcortex%5Ffragments.tsv.gz.tbi.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181666/suppl/GSM8181666%5FDonor2%5Fmedulla%5Ffragments.tsv.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181666/suppl/GSM8181666%5FDonor2%5Fmedulla%5Ffragments.tsv.gz.tbi.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181667/suppl/GSM8181667%5FDonor3%5Fcortex%5Ffragments.tsv.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181667/suppl/GSM8181667%5FDonor3%5Fcortex%5Ffragments.tsv.gz.tbi.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181668/suppl/GSM8181668%5FDonor3%5Fmedulla%5Ffragments.tsv.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8181nnn/GSM8181668/suppl/GSM8181668%5FDonor3%5Fmedulla%5Ffragments.tsv.gz.tbi.gz

gunzip *.gz
