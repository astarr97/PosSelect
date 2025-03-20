#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p hbfraser
#SBATCH --mem=16GB
#SBATCH -c 1

./liftOver -bedPlus=3 -minMatch=0.1 HumanPoly_MAF0.001_anno.bed hg38ToRheMac10.over.chain.gz HumanPoly_MAF0.001.RheMac10.bed HumanPoly_MAF0.001.RheMac10.err
./liftOver -bedPlus=3 -minMatch=0.1 HumanPoly_MAF0.001.RheMac10.bed rheMac10ToHg38.over.chain.gz HumanPoly_MAF0.001.RheMac10.Hg38.bed HumanPoly_MAF0.001.RheMac10.Hg38.err
