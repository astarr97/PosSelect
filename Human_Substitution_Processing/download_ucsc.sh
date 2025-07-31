#!/bin/bash
#SBATCH --time=128:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G

wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/phastCons100way/hg38.phastCons100way.bw
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/cactus241way/hg38.cactus241way.phyloP.bw
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/phastCons470way/hg38.phastCons470way.bw
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/phastCons30way/hg38.phastCons30way.bw
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/phyloP30way/hg38.phyloP30way.bw
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/phyloP100way/hg38.phyloP100way.bw
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/phyloP470way/hg38.phyloP470way.bw

./bigWigToBedGraph hg38.phastCons100way.bw hg38.phastCons100way.bedgraph
./bigWigToBedGraph hg38.phastCons470way.bw hg38.phastCons470way.bedgraph
./bigWigToBedGraph hg38.phastCons30way.bw hg38.phastCons30way.bedgraph
./bigWigToBedGraph hg38.cactus241way.phyloP.bw hg38.cactus241way.phyloP.bedgraph
./bigWigToBedGraph hg38.phyloP30way.bw hg38.phyloP30way.bedgraph
./bigWigToBedGraph hg38.phyloP100way.bw hg38.phyloP100way.bedgraph
./bigWigToBedGraph hg38.phyloP470way.bw hg38.phyloP470way.bedgraph

#Changed this to do it for all 3 (0.01, 0.005, 0.001) files
python to_bed.py

