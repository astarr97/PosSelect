#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p hbfraser
#SBATCH --mem=64GB
#SBATCH -c 1

./liftOver -bedPlus=3 -minMatch=0.1 HumanPoly_MAF0.001_anno.bed hg38ToPanPan3.over.chain.gz HumanPoly_MAF0.001.PanPan3.bed HumanPoly_MAF0.001.PanPan3.err
./liftOver -bedPlus=3 -minMatch=0.1 HumanPoly_MAF0.001.PanPan3.bed panPan3ToHg38.over.chain.gz HumanPoly_MAF0.001.PanPan3.Hg38.bed HumanPoly_MAF0.001.PanPan3.Hg38.err

bedtools intersect -wao -a HumanPoly_MAF0.001.bed -b HumanPoly_MAF0.001.PanPan3.Hg38.bed > HumanPoly_MAF0.001.PanPan3.Hg38.Inter.bed