#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p hbfraser
#SBATCH --mem=128GB

#Used the below command to get the tree, visualized at interactive tree of life website
./cactus-bin-v2.6.13/bin/halStats hg38.447way.hal > GenomesInHal.txt

#Extract the fastas for all these
./cactus-bin-v2.6.13/bin/hal2fasta hg38.447way.hal PrimatesAnc015 > hg38.447way.PrimatesAnc015.fasta
./cactus-bin-v2.6.13/bin/hal2fasta hg38.447way.hal PrimatesAnc007 > hg38.447way.PrimatesAnc007.fasta
./cactus-bin-v2.6.13/bin/hal2fasta hg38.447way.hal PrimatesAnc003 > hg38.447way.PrimatesAnc003.fasta
./cactus-bin-v2.6.13/bin/hal2fasta hg38.447way.hal PrimatesAnc000 > hg38.447way.PrimatesAnc000.fasta
./cactus-bin-v2.6.13/bin/hal2fasta hg38.447way.hal fullTreeAnc238 > hg38.447way.fullTreeAnc238.fasta

mkdir PrimatesAnc015
mkdir PrimatesAnc007
mkdir PrimatesAnc003
mkdir PrimatesAnc000
mkdir fullTreeAnc238

mv hg38.447way.PrimatesAnc015.fasta PrimatesAnc015
mv hg38.447way.PrimatesAnc007.fasta PrimatesAnc007
mv hg38.447way.PrimatesAnc003.fasta PrimatesAnc003
mv hg38.447way.PrimatesAnc000.fasta PrimatesAnc000
mv hg38.447way.fullTreeAnc238.fasta fullTreeAnc238

