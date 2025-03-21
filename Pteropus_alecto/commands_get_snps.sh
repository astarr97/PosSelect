#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p hbfraser
#SBATCH --mem=16GB
#SBATCH -c 1

#Downloaded variants from this link: https://1drv.ms/u/c/d134473bb18db4f7/ERVvwEk6q9FHnZKsrXskfFgB8m2sNnYaD53pNZjz7A4jDg?e=AB05Z3
#Downloaded sequence report from this link https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000325575.1/
#Used that to convert chromosome names to those found in the hal file

#Pull SNPs
python bleh.py

#Sort SNPs file
sort -k1,1 -k2,2n bat.indel99-90.VQSR.bed > bat.indel99-90.VQSR.sort.bed

#Pull information for outgroups from the hal file
/scratch/users/astarr97/Common_Software/cactus-bin-v2.6.13/bin/hal2maf --refGenome Pteropus_alecto --onlyOrthologs --targetGenomes "Pteropus_alecto,Rousettus_aegyptiacus" /scratch/users/astarr97/PhyloP/hg38.447way.hal Alecto_Rousettus.maf
/scratch/users/astarr97/Common_Software/mafTools/bin/mafDuplicateFilter -m Alecto_Rousettus.maf > Alecto_Rousettus.dedup.maf
python callSNPsFromMAF.py Alecto_Rousettus.dedup.maf Alecto_Rousettus.dedup.All.txt
python convert_to_bed_am.py Alecto_Rousettus.dedup.All.txt
sort -k1,1 -k2,2n Alecto_Rousettus.dedup.All.bed > Alecto_Rousettus.dedup.All.sort.bed

/scratch/users/astarr97/Common_Software/cactus-bin-v2.6.13/bin/hal2maf --refGenome Pteropus_alecto --onlyOrthologs --targetGenomes "Pteropus_alecto,Eidolon_helvum" /scratch/users/astarr97/PhyloP/hg38.447way.hal Alecto_Eidolon.maf
/scratch/users/astarr97/Common_Software/mafTools/bin/mafDuplicateFilter -m Alecto_Eidolon.maf > Alecto_Eidolon.dedup.maf
python callSNPsFromMAF.py Alecto_Eidolon.dedup.maf Alecto_Eidolon.dedup.All.txt
python convert_to_bed_am.py Alecto_Eidolon.dedup.All.txt
sort -k1,1 -k2,2n Alecto_Eidolon.dedup.All.bed > Alecto_Eidolon.dedup.All.sort.bed

/scratch/users/astarr97/Common_Software/cactus-bin-v2.6.13/bin/hal2maf --refGenome Pteropus_alecto --onlyOrthologs --targetGenomes "Pteropus_alecto,Pteropus_vampyrus" /scratch/users/astarr97/PhyloP/hg38.447way.hal Alecto_Vampyrus.maf
/scratch/users/astarr97/Common_Software/mafTools/bin/mafDuplicateFilter -m Alecto_Vampyrus.maf > Alecto_Vampyrus.dedup.maf
python callSNPsFromMAF.py Alecto_Vampyrus.dedup.maf Alecto_Vampyrus.dedup.All.txt
python convert_to_bed_am.py Alecto_Vampyrus.dedup.All.txt
sort -k1,1 -k2,2n Alecto_Vampyrus.dedup.All.bed > Alecto_Vampyrus.dedup.All.sort.bed

#Get differences between Alecto and Vampyrus
awk -F'\t' '$4 != $5' Alecto_Vampyrus.dedup.All.sort.bed OFS='\t' > Alecto_Vampyrus.difs.sort.bed

#Intersect with SNPs
bedtools intersect -sorted -wao -a Alecto_Vampyrus.difs.sort.bed -b bat.indel99-90.VQSR.sort.bed > Alecto_Vampyrus.difs.sort.WPoly.bed

#Remove any that are polymorphic at all
python filter_fixed.py

#Intersect with other species and toss redundant columns
bedtools intersect -sorted -wao -a Alecto_Vampyrus.difs.sort.WPoly.Fixed.bed -b Alecto_Rousettus.dedup.All.sort.bed > Alecto_Vampyrus.difs.sort.Rousettus.bed
bedtools intersect -sorted -wao -a Alecto_Vampyrus.difs.sort.Rousettus.bed -b Alecto_Eidolon.dedup.All.sort.bed > Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.bed
awk -F'\t' '{print $1, $2, $3, $4, $5, $10, $16}' OFS='\t' Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.bed > Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.Ready.bed

#Intersect with PhyloP, nearest gene based on CDS, and SpecSup447
annotation_path="/oak/stanford/groups/hbfraser/astarr/AccelConvDist/Annotations/"
phylop_path="/scratch/users/astarr97/PhyloP/Feasibility/Pteropus_alecto_PhyloP_MaskPteAle/All/"
bedtools intersect -sorted -wao -a Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.Ready.bed -b ${phylop_path}All_Pteropus_alecto_PhyloP_MaskPteAle.sort.NoID.bed > Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.PhyloP.bed
bedtools closest -d -wao -a Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.PhyloP.bed -b ${annotation_path}geneAnnotation_CDS_Pteropus_alecto.sort.bed > Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.PhyloP.NearestGene.ToFix.bed
python remove_dot.py Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.PhyloP.NearestGene.ToFix.bed
bedtools intersect -sorted -wao -a Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.PhyloP.NearestGene.bed -b ${phylop_path}All_Pteropus_alecto_PhyloP_MaskPteAle.SpecSup.sort.bed > Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.PhyloP.NearestGene.SpecSup.ToFix.bed

#Filter columns
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $7, $11, $16, $17, $21}' OFS='\t' Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.PhyloP.NearestGene.SpecSup.ToFix.bed > Alecto_Vampyrus.difs.sort.Rousettus.Eidolon.PhyloP.NearestGene.SpecSup.Ready.bed

#Filter SNPs by MAF to reduce work
python filter_snps.py

#Intersect with outgroups
bedtools intersect -sorted -wao -a bat.indel99-90.VQSR.sort.MAF0.1-0.9.bed -b Alecto_Vampyrus.dedup.All.sort.bed > bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.bed
bedtools intersect -sorted -wao -a bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.bed -b Alecto_Rousettus.dedup.All.sort.bed > bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.bed
bedtools intersect -sorted -wao -a bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.bed -b Alecto_Eidolon.dedup.All.sort.bed > bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.bed

#Get rid of extraneous columns
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $10, $11, $17, $23}' OFS='\t' bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.bed > bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.Ready.bed


#Intersect with PhyloP, nearest gene based on CDS, and SpecSup447
annotation_path="/oak/stanford/groups/hbfraser/astarr/AccelConvDist/Annotations/"
phylop_path="/scratch/users/astarr97/PhyloP/Feasibility/Pteropus_alecto_PhyloP_MaskPteAle/All/"
bedtools intersect -sorted -wao -a bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.Ready.bed -b ${phylop_path}All_Pteropus_alecto_PhyloP_MaskPteAle.sort.NoID.bed > bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.PhyloP.bed
bedtools closest -d -wao -a bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.PhyloP.bed -b ${annotation_path}geneAnnotation_CDS_Pteropus_alecto.sort.bed > bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.PhyloP.NearestGene.ToFix.bed
python remove_dot.py bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.PhyloP.NearestGene.ToFix.bed
bedtools intersect -sorted -wao -a bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.PhyloP.NearestGene.bed -b ${phylop_path}All_Pteropus_alecto_PhyloP_MaskPteAle.SpecSup.sort.bed > bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.PhyloP.NearestGene.SpecSup.ToFix.bed

#Get rid of extraneous columns
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $14, $19, $20, $24}' OFS='\t' bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.PhyloP.NearestGene.SpecSup.ToFix.bed > bat.indel99-90.VQSR.sort.MAF0.1-0.9.Vampyrus.Rousettus.Eidolon.PhyloP.NearestGene.SpecSup.Ready.bed

#Lastly need to call who is derived, remove Ns, etc.
#Do filtering and call which species is derived for fixed and which allele is derived for polymorphic
python call_derived_fixed.py
python call_derived_poly.py

