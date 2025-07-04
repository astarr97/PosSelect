#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p hbfraser
#SBATCH --mem=64GB
#SBATCH -c 1

cat *fasta.out > Anc015_Merged_rmsk.fasta.out

#Need to remove repeat sequences annotated as structural RNA copies, satellites, tandem repeats, and low complexity annotations
python ../filter_repeats.py Anc015_Merged_rmsk.fasta.out
awk -v OFS='\t' '{print $5,$6,$7}' Anc015_Merged_rmsk.fasta.filt.out | sort -k1,1 -k2,2n | bedtools merge -i - > Anc015_Merged_rmsk.fasta.filt2.bed


../cactus-bin-v2.6.13/bin/halLiftover ../hg38.447way.hal PrimatesAnc015 Anc015_Merged_rmsk.fasta.filt.bed PrimatesAnc025 PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc025.bed --noDupes --outPSL
../cactus-bin-v2.6.13/bin/halLiftover ../hg38.447way.hal PrimatesAnc015 Anc015_Merged_rmsk.fasta.filt.bed PrimatesAnc026 PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc026.bed --noDupes --outPSL

awk -v OFS='\t' '{print $10,$12,$13,$14,$16,$17}' PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc025.bed > PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc025.bed"_temp" && mv PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc025.bed"_temp" PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc025.bed
bedtools intersect -a Anc015_Merged_rmsk.fasta.filt.bed -b PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc025.bed > Anc015_Merged_rmsk.fasta.filt.bed"_temp" && mv Anc015_Merged_rmsk.fasta.filt.bed"_temp" Anc015_Merged_rmsk.fasta.filt.bed

awk -v OFS='\t' '{print $10,$12,$13,$14,$16,$17}' PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc026.bed > PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc026.bed"_temp" && mv PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc026.bed"_temp" PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc026.bed
bedtools intersect -a Anc015_Merged_rmsk.fasta.filt.bed -b PrimatesAnc015_Merged_rmsk.fasta.filt.PrimatesAnc026.bed > Anc015_Merged_rmsk.fasta.filt.bed"_temp" && mv Anc015_Merged_rmsk.fasta.filt.bed"_temp" Anc015_Merged_rmsk.fasta.filt.bed

bedops --chop 1 Anc015_Merged_rmsk.fasta.filt.bed | shuf -n 100000 | sort -k1,1 -k2,2n | bedtools merge -i - > Anc015_Merged_rmsk.fasta.filt.100kb.bed

#For the next step, we printed out which species we need using a short python script
python ../get_subtree_species.py ../hg38.447way.tree.nh PrimatesAnc015

../cactus-bin-v2.6.13/bin/hal2maf --refTargets Anc015_Merged_rmsk.fasta.filt.100kb.bed --refGenome PrimatesAnc015 --onlyOrthologs --targetGenomes "Pan_paniscus,Pan_troglodytes,Homo_sapiens,Gorilla_gorilla,Gorilla_beringei,Pongo_abelii,Pongo_pygmaeus,Hylobates_pileatus_b,Hylobates_pileatus_a,Hylobates_abbotti,Hylobates_muelleri,Hylobates_agilis,Hylobates_klossii,Hoolock_leuconedys,Nomascus_siki_b,Nomascus_siki_a,Nomascus_gabriellae,Nomascus_annamensis,Nomascus_concolor,Symphalangus_syndactylus" ../hg38.447way.hal PrimatesAnc015.100kb.maf

#The values produced from this command line up nicely with existing values from the all mammals alignment!
../phast/bin/phyloFit PrimatesAnc015.100kb.maf -i MAF --subst-mod REV --EM --tree ../hg38.447way.scientificNames.nh.txt --out-root PrimatesAnc015.100kb

../cactus-bin-v2.6.13/bin/halLiftover ../hg38.447way.hal PrimatesAnc015 Anc015_Merged_rmsk.fasta.filt.bed Homo_sapiens PrimatesAnc015_Merged_rmsk.fasta.filt.Homo_sapiens.bed --noDupes --outPSL


#Now we will do it for chrX and chrY
awk -v OFS='\t' '{if ($14=="chrX") print $10,$12,$13,$14,$16,$17}' PrimatesAnc015_Merged_rmsk.fasta.filt.Homo_sapiens.bed | bedops --chop 1 - | shuf -n 100000 | sort -k1,1 -k2,2n | bedtools merge -i - > PrimatesAnc015_Merged_rmsk.fasta.filt.chrX.100kb.bed
awk -v OFS='\t' '{if ($14=="chrY") print $10,$12,$13,$14,$16,$17}' PrimatesAnc015_Merged_rmsk.fasta.filt.Homo_sapiens.bed | bedops --chop 1 - | shuf -n 100000 | sort -k1,1 -k2,2n | bedtools merge -i - > PrimatesAnc015_Merged_rmsk.fasta.filt.chrY.100kb.bed

../cactus-bin-v2.6.13/bin/hal2maf --refTargets PrimatesAnc015_Merged_rmsk.fasta.filt.chrX.100kb.bed --refGenome PrimatesAnc015 --onlyOrthologs --targetGenomes "Pan_paniscus,Pan_troglodytes,Homo_sapiens,Gorilla_gorilla,Gorilla_beringei,Pongo_abelii,Pongo_pygmaeus,Hylobates_pileatus_b,Hylobates_pileatus_a,Hylobates_abbotti,Hylobates_muelleri,Hylobates_agilis,Hylobates_klossii,Hoolock_leuconedys,Nomascus_siki_b,Nomascus_siki_a,Nomascus_gabriellae,Nomascus_annamensis,Nomascus_concolor,Symphalangus_syndactylus" ../hg38.447way.hal PrimatesAnc015.100kb.chrX.maf
../cactus-bin-v2.6.13/bin/hal2maf --refTargets PrimatesAnc015_Merged_rmsk.fasta.filt.chrY.100kb.bed --refGenome PrimatesAnc015 --onlyOrthologs --targetGenomes "Pan_paniscus,Pan_troglodytes,Homo_sapiens,Gorilla_gorilla,Gorilla_beringei,Pongo_abelii,Pongo_pygmaeus,Hylobates_pileatus_b,Hylobates_pileatus_a,Hylobates_abbotti,Hylobates_muelleri,Hylobates_agilis,Hylobates_klossii,Hoolock_leuconedys,Nomascus_siki_b,Nomascus_siki_a,Nomascus_gabriellae,Nomascus_annamensis,Nomascus_concolor,Symphalangus_syndactylus" ../hg38.447way.hal PrimatesAnc015.100kb.chrY.maf

../phast/bin/phyloFit PrimatesAnc015.100kb.chrX.maf -i MAF --subst-mod REV --EM --tree ../hg38.447way.scientificNames.nh.txt --out-root PrimatesAnc015.100kb.chrX
../phast/bin/phyloFit PrimatesAnc015.100kb.chrY.maf -i MAF --subst-mod REV --EM --tree ../hg38.447way.scientificNames.nh.txt --out-root PrimatesAnc015.100kb.chrY
