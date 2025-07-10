#!/bin/bash
#SBATCH --time=120:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB
#SBATCH -c 1


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_PGC.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_PGC.fragments.tsv FCA_GND8046539/FCA_GND8046539_PGC.fragments.tsv FCA_GND8768484/FCA_GND8768484_PGC.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_PGC.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_PGC.fragments.tsv FCA_GND8768483/FCA_GND8768483_PGC.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_PGC.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_PGC.fragments.tsv FCA_GND8768485/FCA_GND8768485_PGC.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_PGC.fragments.tsv > PGC_Female.fragments.tsv
sort -k1,1 -k2,2n PGC_Female.fragments.tsv > PGC_Female.fragments.sort.tsv
macs2 callpeak -t PGC_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n PGC_Female

cat FCA_GND8795928/FCA_GND8795928_PGC.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_PGC.fragments.tsv FCA_GND8768482/FCA_GND8768482_PGC.fragments.tsv FCA_GND8768481/FCA_GND8768481_PGC.fragments.tsv FCA_GND8768487/FCA_GND8768487_PGC.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_PGC.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_PGC.fragments.tsv FCA_GND8795927/FCA_GND8795927_PGC.fragments.tsv FCA_GND9332157/FCA_GND9332157_PGC.fragments.tsv > PGC_Male.fragments.tsv
sort -k1,1 -k2,2n PGC_Male.fragments.tsv > PGC_Male.fragments.sort.tsv
macs2 callpeak -t PGC_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n PGC_Male

cat PGC_Female_peaks.narrowPeak PGC_Male_peaks.narrowPeak > PGC_All_peaks.narrowPeak
sort -k1,1 -k2,2n PGC_All_peaks.narrowPeak > PGC_All_peaks.sort.narrowPeak
bedtools merge -i PGC_All_peaks.sort.narrowPeak > PGC_All_peaks.merged.narrowPeak

mv PGC_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv PGC_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv PGC_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip PGC_Female.fragments.sort.tsv
tabix -p bed PGC_Female.fragments.sort.tsv.gz
mv PGC_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv PGC_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip PGC_Male.fragments.sort.tsv
tabix -p bed PGC_Male.fragments.sort.tsv.gz
mv PGC_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv PGC_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_GC.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_GC.fragments.tsv FCA_GND8046539/FCA_GND8046539_GC.fragments.tsv FCA_GND8768484/FCA_GND8768484_GC.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_GC.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_GC.fragments.tsv FCA_GND8768483/FCA_GND8768483_GC.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_GC.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_GC.fragments.tsv FCA_GND8768485/FCA_GND8768485_GC.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_GC.fragments.tsv > GC_Female.fragments.tsv
sort -k1,1 -k2,2n GC_Female.fragments.tsv > GC_Female.fragments.sort.tsv
macs2 callpeak -t GC_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n GC_Female

cat FCA_GND8795928/FCA_GND8795928_GC.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_GC.fragments.tsv FCA_GND8768482/FCA_GND8768482_GC.fragments.tsv FCA_GND8768481/FCA_GND8768481_GC.fragments.tsv FCA_GND8768487/FCA_GND8768487_GC.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_GC.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_GC.fragments.tsv FCA_GND8795927/FCA_GND8795927_GC.fragments.tsv FCA_GND9332157/FCA_GND9332157_GC.fragments.tsv > GC_Male.fragments.tsv
sort -k1,1 -k2,2n GC_Male.fragments.tsv > GC_Male.fragments.sort.tsv
macs2 callpeak -t GC_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n GC_Male

cat GC_Female_peaks.narrowPeak GC_Male_peaks.narrowPeak > GC_All_peaks.narrowPeak
sort -k1,1 -k2,2n GC_All_peaks.narrowPeak > GC_All_peaks.sort.narrowPeak
bedtools merge -i GC_All_peaks.sort.narrowPeak > GC_All_peaks.merged.narrowPeak

mv GC_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv GC_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv GC_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip GC_Female.fragments.sort.tsv
tabix -p bed GC_Female.fragments.sort.tsv.gz
mv GC_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv GC_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip GC_Male.fragments.sort.tsv
tabix -p bed GC_Male.fragments.sort.tsv.gz
mv GC_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv GC_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_CoelEpi_LHX9.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_CoelEpi_LHX9.fragments.tsv FCA_GND8046539/FCA_GND8046539_CoelEpi_LHX9.fragments.tsv FCA_GND8768484/FCA_GND8768484_CoelEpi_LHX9.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_CoelEpi_LHX9.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_CoelEpi_LHX9.fragments.tsv FCA_GND8768483/FCA_GND8768483_CoelEpi_LHX9.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_CoelEpi_LHX9.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_CoelEpi_LHX9.fragments.tsv FCA_GND8768485/FCA_GND8768485_CoelEpi_LHX9.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_CoelEpi_LHX9.fragments.tsv > CoelEpi_LHX9_Female.fragments.tsv
sort -k1,1 -k2,2n CoelEpi_LHX9_Female.fragments.tsv > CoelEpi_LHX9_Female.fragments.sort.tsv
macs2 callpeak -t CoelEpi_LHX9_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n CoelEpi_LHX9_Female

cat FCA_GND8795928/FCA_GND8795928_CoelEpi_LHX9.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_CoelEpi_LHX9.fragments.tsv FCA_GND8768482/FCA_GND8768482_CoelEpi_LHX9.fragments.tsv FCA_GND8768481/FCA_GND8768481_CoelEpi_LHX9.fragments.tsv FCA_GND8768487/FCA_GND8768487_CoelEpi_LHX9.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_CoelEpi_LHX9.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_CoelEpi_LHX9.fragments.tsv FCA_GND8795927/FCA_GND8795927_CoelEpi_LHX9.fragments.tsv FCA_GND9332157/FCA_GND9332157_CoelEpi_LHX9.fragments.tsv > CoelEpi_LHX9_Male.fragments.tsv
sort -k1,1 -k2,2n CoelEpi_LHX9_Male.fragments.tsv > CoelEpi_LHX9_Male.fragments.sort.tsv
macs2 callpeak -t CoelEpi_LHX9_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n CoelEpi_LHX9_Male

cat CoelEpi_LHX9_Female_peaks.narrowPeak CoelEpi_LHX9_Male_peaks.narrowPeak > CoelEpi_LHX9_All_peaks.narrowPeak
sort -k1,1 -k2,2n CoelEpi_LHX9_All_peaks.narrowPeak > CoelEpi_LHX9_All_peaks.sort.narrowPeak
bedtools merge -i CoelEpi_LHX9_All_peaks.sort.narrowPeak > CoelEpi_LHX9_All_peaks.merged.narrowPeak

mv CoelEpi_LHX9_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv CoelEpi_LHX9_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv CoelEpi_LHX9_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip CoelEpi_LHX9_Female.fragments.sort.tsv
tabix -p bed CoelEpi_LHX9_Female.fragments.sort.tsv.gz
mv CoelEpi_LHX9_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv CoelEpi_LHX9_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip CoelEpi_LHX9_Male.fragments.sort.tsv
tabix -p bed CoelEpi_LHX9_Male.fragments.sort.tsv.gz
mv CoelEpi_LHX9_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv CoelEpi_LHX9_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_CoelEpi_GATA2.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_CoelEpi_GATA2.fragments.tsv FCA_GND8046539/FCA_GND8046539_CoelEpi_GATA2.fragments.tsv FCA_GND8768484/FCA_GND8768484_CoelEpi_GATA2.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_CoelEpi_GATA2.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_CoelEpi_GATA2.fragments.tsv FCA_GND8768483/FCA_GND8768483_CoelEpi_GATA2.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_CoelEpi_GATA2.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_CoelEpi_GATA2.fragments.tsv FCA_GND8768485/FCA_GND8768485_CoelEpi_GATA2.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_CoelEpi_GATA2.fragments.tsv > CoelEpi_GATA2_Female.fragments.tsv
sort -k1,1 -k2,2n CoelEpi_GATA2_Female.fragments.tsv > CoelEpi_GATA2_Female.fragments.sort.tsv
macs2 callpeak -t CoelEpi_GATA2_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n CoelEpi_GATA2_Female

cat FCA_GND8795928/FCA_GND8795928_CoelEpi_GATA2.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_CoelEpi_GATA2.fragments.tsv FCA_GND8768482/FCA_GND8768482_CoelEpi_GATA2.fragments.tsv FCA_GND8768481/FCA_GND8768481_CoelEpi_GATA2.fragments.tsv FCA_GND8768487/FCA_GND8768487_CoelEpi_GATA2.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_CoelEpi_GATA2.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_CoelEpi_GATA2.fragments.tsv FCA_GND8795927/FCA_GND8795927_CoelEpi_GATA2.fragments.tsv FCA_GND9332157/FCA_GND9332157_CoelEpi_GATA2.fragments.tsv > CoelEpi_GATA2_Male.fragments.tsv
sort -k1,1 -k2,2n CoelEpi_GATA2_Male.fragments.tsv > CoelEpi_GATA2_Male.fragments.sort.tsv
macs2 callpeak -t CoelEpi_GATA2_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n CoelEpi_GATA2_Male

cat CoelEpi_GATA2_Female_peaks.narrowPeak CoelEpi_GATA2_Male_peaks.narrowPeak > CoelEpi_GATA2_All_peaks.narrowPeak
sort -k1,1 -k2,2n CoelEpi_GATA2_All_peaks.narrowPeak > CoelEpi_GATA2_All_peaks.sort.narrowPeak
bedtools merge -i CoelEpi_GATA2_All_peaks.sort.narrowPeak > CoelEpi_GATA2_All_peaks.merged.narrowPeak

mv CoelEpi_GATA2_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv CoelEpi_GATA2_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv CoelEpi_GATA2_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip CoelEpi_GATA2_Female.fragments.sort.tsv
tabix -p bed CoelEpi_GATA2_Female.fragments.sort.tsv.gz
mv CoelEpi_GATA2_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv CoelEpi_GATA2_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip CoelEpi_GATA2_Male.fragments.sort.tsv
tabix -p bed CoelEpi_GATA2_Male.fragments.sort.tsv.gz
mv CoelEpi_GATA2_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv CoelEpi_GATA2_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_Gi.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_Gi.fragments.tsv FCA_GND8046539/FCA_GND8046539_Gi.fragments.tsv FCA_GND8768484/FCA_GND8768484_Gi.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_Gi.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_Gi.fragments.tsv FCA_GND8768483/FCA_GND8768483_Gi.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_Gi.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_Gi.fragments.tsv FCA_GND8768485/FCA_GND8768485_Gi.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_Gi.fragments.tsv > Gi_Female.fragments.tsv
sort -k1,1 -k2,2n Gi_Female.fragments.tsv > Gi_Female.fragments.sort.tsv
macs2 callpeak -t Gi_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Gi_Female

cat FCA_GND8795928/FCA_GND8795928_Gi.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Gi.fragments.tsv FCA_GND8768482/FCA_GND8768482_Gi.fragments.tsv FCA_GND8768481/FCA_GND8768481_Gi.fragments.tsv FCA_GND8768487/FCA_GND8768487_Gi.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Gi.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Gi.fragments.tsv FCA_GND8795927/FCA_GND8795927_Gi.fragments.tsv FCA_GND9332157/FCA_GND9332157_Gi.fragments.tsv > Gi_Male.fragments.tsv
sort -k1,1 -k2,2n Gi_Male.fragments.tsv > Gi_Male.fragments.sort.tsv
macs2 callpeak -t Gi_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Gi_Male

cat Gi_Female_peaks.narrowPeak Gi_Male_peaks.narrowPeak > Gi_All_peaks.narrowPeak
sort -k1,1 -k2,2n Gi_All_peaks.narrowPeak > Gi_All_peaks.sort.narrowPeak
bedtools merge -i Gi_All_peaks.sort.narrowPeak > Gi_All_peaks.merged.narrowPeak

mv Gi_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Gi_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Gi_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip Gi_Female.fragments.sort.tsv
tabix -p bed Gi_Female.fragments.sort.tsv.gz
mv Gi_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Gi_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip Gi_Male.fragments.sort.tsv
tabix -p bed Gi_Male.fragments.sort.tsv.gz
mv Gi_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Gi_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_early_supporting.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_early_supporting.fragments.tsv FCA_GND8046539/FCA_GND8046539_early_supporting.fragments.tsv FCA_GND8768484/FCA_GND8768484_early_supporting.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_early_supporting.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_early_supporting.fragments.tsv FCA_GND8768483/FCA_GND8768483_early_supporting.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_early_supporting.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_early_supporting.fragments.tsv FCA_GND8768485/FCA_GND8768485_early_supporting.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_early_supporting.fragments.tsv > early_supporting_Female.fragments.tsv
sort -k1,1 -k2,2n early_supporting_Female.fragments.tsv > early_supporting_Female.fragments.sort.tsv
macs2 callpeak -t early_supporting_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n early_supporting_Female

cat FCA_GND8795928/FCA_GND8795928_early_supporting.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_early_supporting.fragments.tsv FCA_GND8768482/FCA_GND8768482_early_supporting.fragments.tsv FCA_GND8768481/FCA_GND8768481_early_supporting.fragments.tsv FCA_GND8768487/FCA_GND8768487_early_supporting.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_early_supporting.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_early_supporting.fragments.tsv FCA_GND8795927/FCA_GND8795927_early_supporting.fragments.tsv FCA_GND9332157/FCA_GND9332157_early_supporting.fragments.tsv > early_supporting_Male.fragments.tsv
sort -k1,1 -k2,2n early_supporting_Male.fragments.tsv > early_supporting_Male.fragments.sort.tsv
macs2 callpeak -t early_supporting_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n early_supporting_Male

cat early_supporting_Female_peaks.narrowPeak early_supporting_Male_peaks.narrowPeak > early_supporting_All_peaks.narrowPeak
sort -k1,1 -k2,2n early_supporting_All_peaks.narrowPeak > early_supporting_All_peaks.sort.narrowPeak
bedtools merge -i early_supporting_All_peaks.sort.narrowPeak > early_supporting_All_peaks.merged.narrowPeak

mv early_supporting_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv early_supporting_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv early_supporting_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip early_supporting_Female.fragments.sort.tsv
tabix -p bed early_supporting_Female.fragments.sort.tsv.gz
mv early_supporting_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv early_supporting_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip early_supporting_Male.fragments.sort.tsv
tabix -p bed early_supporting_Male.fragments.sort.tsv.gz
mv early_supporting_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv early_supporting_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_Endothelial.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_Endothelial.fragments.tsv FCA_GND8046539/FCA_GND8046539_Endothelial.fragments.tsv FCA_GND8768484/FCA_GND8768484_Endothelial.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_Endothelial.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_Endothelial.fragments.tsv FCA_GND8768483/FCA_GND8768483_Endothelial.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_Endothelial.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_Endothelial.fragments.tsv FCA_GND8768485/FCA_GND8768485_Endothelial.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_Endothelial.fragments.tsv > Endothelial_Female.fragments.tsv
sort -k1,1 -k2,2n Endothelial_Female.fragments.tsv > Endothelial_Female.fragments.sort.tsv
macs2 callpeak -t Endothelial_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Endothelial_Female

cat FCA_GND8795928/FCA_GND8795928_Endothelial.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Endothelial.fragments.tsv FCA_GND8768482/FCA_GND8768482_Endothelial.fragments.tsv FCA_GND8768481/FCA_GND8768481_Endothelial.fragments.tsv FCA_GND8768487/FCA_GND8768487_Endothelial.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Endothelial.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Endothelial.fragments.tsv FCA_GND8795927/FCA_GND8795927_Endothelial.fragments.tsv FCA_GND9332157/FCA_GND9332157_Endothelial.fragments.tsv > Endothelial_Male.fragments.tsv
sort -k1,1 -k2,2n Endothelial_Male.fragments.tsv > Endothelial_Male.fragments.sort.tsv
macs2 callpeak -t Endothelial_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Endothelial_Male

cat Endothelial_Female_peaks.narrowPeak Endothelial_Male_peaks.narrowPeak > Endothelial_All_peaks.narrowPeak
sort -k1,1 -k2,2n Endothelial_All_peaks.narrowPeak > Endothelial_All_peaks.sort.narrowPeak
bedtools merge -i Endothelial_All_peaks.sort.narrowPeak > Endothelial_All_peaks.merged.narrowPeak

mv Endothelial_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Endothelial_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Endothelial_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip Endothelial_Female.fragments.sort.tsv
tabix -p bed Endothelial_Female.fragments.sort.tsv.gz
mv Endothelial_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Endothelial_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip Endothelial_Male.fragments.sort.tsv
tabix -p bed Endothelial_Male.fragments.sort.tsv.gz
mv Endothelial_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Endothelial_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_Epithelial.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_Epithelial.fragments.tsv FCA_GND8046539/FCA_GND8046539_Epithelial.fragments.tsv FCA_GND8768484/FCA_GND8768484_Epithelial.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_Epithelial.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_Epithelial.fragments.tsv FCA_GND8768483/FCA_GND8768483_Epithelial.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_Epithelial.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_Epithelial.fragments.tsv FCA_GND8768485/FCA_GND8768485_Epithelial.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_Epithelial.fragments.tsv > Epithelial_Female.fragments.tsv
sort -k1,1 -k2,2n Epithelial_Female.fragments.tsv > Epithelial_Female.fragments.sort.tsv
macs2 callpeak -t Epithelial_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Epithelial_Female

cat FCA_GND8795928/FCA_GND8795928_Epithelial.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Epithelial.fragments.tsv FCA_GND8768482/FCA_GND8768482_Epithelial.fragments.tsv FCA_GND8768481/FCA_GND8768481_Epithelial.fragments.tsv FCA_GND8768487/FCA_GND8768487_Epithelial.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Epithelial.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Epithelial.fragments.tsv FCA_GND8795927/FCA_GND8795927_Epithelial.fragments.tsv FCA_GND9332157/FCA_GND9332157_Epithelial.fragments.tsv > Epithelial_Male.fragments.tsv
sort -k1,1 -k2,2n Epithelial_Male.fragments.tsv > Epithelial_Male.fragments.sort.tsv
macs2 callpeak -t Epithelial_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Epithelial_Male

cat Epithelial_Female_peaks.narrowPeak Epithelial_Male_peaks.narrowPeak > Epithelial_All_peaks.narrowPeak
sort -k1,1 -k2,2n Epithelial_All_peaks.narrowPeak > Epithelial_All_peaks.sort.narrowPeak
bedtools merge -i Epithelial_All_peaks.sort.narrowPeak > Epithelial_All_peaks.merged.narrowPeak

mv Epithelial_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Epithelial_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Epithelial_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip Epithelial_Female.fragments.sort.tsv
tabix -p bed Epithelial_Female.fragments.sort.tsv.gz
mv Epithelial_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Epithelial_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip Epithelial_Male.fragments.sort.tsv
tabix -p bed Epithelial_Male.fragments.sort.tsv.gz
mv Epithelial_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Epithelial_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_Erythrocyte.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_Erythrocyte.fragments.tsv FCA_GND8046539/FCA_GND8046539_Erythrocyte.fragments.tsv FCA_GND8768484/FCA_GND8768484_Erythrocyte.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_Erythrocyte.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_Erythrocyte.fragments.tsv FCA_GND8768483/FCA_GND8768483_Erythrocyte.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_Erythrocyte.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_Erythrocyte.fragments.tsv FCA_GND8768485/FCA_GND8768485_Erythrocyte.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_Erythrocyte.fragments.tsv > Erythrocyte_Female.fragments.tsv
sort -k1,1 -k2,2n Erythrocyte_Female.fragments.tsv > Erythrocyte_Female.fragments.sort.tsv
macs2 callpeak -t Erythrocyte_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Erythrocyte_Female

cat FCA_GND8795928/FCA_GND8795928_Erythrocyte.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Erythrocyte.fragments.tsv FCA_GND8768482/FCA_GND8768482_Erythrocyte.fragments.tsv FCA_GND8768481/FCA_GND8768481_Erythrocyte.fragments.tsv FCA_GND8768487/FCA_GND8768487_Erythrocyte.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Erythrocyte.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Erythrocyte.fragments.tsv FCA_GND8795927/FCA_GND8795927_Erythrocyte.fragments.tsv FCA_GND9332157/FCA_GND9332157_Erythrocyte.fragments.tsv > Erythrocyte_Male.fragments.tsv
sort -k1,1 -k2,2n Erythrocyte_Male.fragments.tsv > Erythrocyte_Male.fragments.sort.tsv
macs2 callpeak -t Erythrocyte_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Erythrocyte_Male

cat Erythrocyte_Female_peaks.narrowPeak Erythrocyte_Male_peaks.narrowPeak > Erythrocyte_All_peaks.narrowPeak
sort -k1,1 -k2,2n Erythrocyte_All_peaks.narrowPeak > Erythrocyte_All_peaks.sort.narrowPeak
bedtools merge -i Erythrocyte_All_peaks.sort.narrowPeak > Erythrocyte_All_peaks.merged.narrowPeak

mv Erythrocyte_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Erythrocyte_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Erythrocyte_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip Erythrocyte_Female.fragments.sort.tsv
tabix -p bed Erythrocyte_Female.fragments.sort.tsv.gz
mv Erythrocyte_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Erythrocyte_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip Erythrocyte_Male.fragments.sort.tsv
tabix -p bed Erythrocyte_Male.fragments.sort.tsv.gz
mv Erythrocyte_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Erythrocyte_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_Immune.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_Immune.fragments.tsv FCA_GND8046539/FCA_GND8046539_Immune.fragments.tsv FCA_GND8768484/FCA_GND8768484_Immune.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_Immune.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_Immune.fragments.tsv FCA_GND8768483/FCA_GND8768483_Immune.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_Immune.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_Immune.fragments.tsv FCA_GND8768485/FCA_GND8768485_Immune.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_Immune.fragments.tsv > Immune_Female.fragments.tsv
sort -k1,1 -k2,2n Immune_Female.fragments.tsv > Immune_Female.fragments.sort.tsv
macs2 callpeak -t Immune_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Immune_Female

cat FCA_GND8795928/FCA_GND8795928_Immune.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Immune.fragments.tsv FCA_GND8768482/FCA_GND8768482_Immune.fragments.tsv FCA_GND8768481/FCA_GND8768481_Immune.fragments.tsv FCA_GND8768487/FCA_GND8768487_Immune.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Immune.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Immune.fragments.tsv FCA_GND8795927/FCA_GND8795927_Immune.fragments.tsv FCA_GND9332157/FCA_GND9332157_Immune.fragments.tsv > Immune_Male.fragments.tsv
sort -k1,1 -k2,2n Immune_Male.fragments.tsv > Immune_Male.fragments.sort.tsv
macs2 callpeak -t Immune_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Immune_Male

cat Immune_Female_peaks.narrowPeak Immune_Male_peaks.narrowPeak > Immune_All_peaks.narrowPeak
sort -k1,1 -k2,2n Immune_All_peaks.narrowPeak > Immune_All_peaks.sort.narrowPeak
bedtools merge -i Immune_All_peaks.sort.narrowPeak > Immune_All_peaks.merged.narrowPeak

mv Immune_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Immune_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Immune_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip Immune_Female.fragments.sort.tsv
tabix -p bed Immune_Female.fragments.sort.tsv.gz
mv Immune_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Immune_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip Immune_Male.fragments.sort.tsv
tabix -p bed Immune_Male.fragments.sort.tsv.gz
mv Immune_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Immune_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_Mesenchymal_GATA2.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_Mesenchymal_GATA2.fragments.tsv FCA_GND8046539/FCA_GND8046539_Mesenchymal_GATA2.fragments.tsv FCA_GND8768484/FCA_GND8768484_Mesenchymal_GATA2.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_Mesenchymal_GATA2.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_Mesenchymal_GATA2.fragments.tsv FCA_GND8768483/FCA_GND8768483_Mesenchymal_GATA2.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_Mesenchymal_GATA2.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_Mesenchymal_GATA2.fragments.tsv FCA_GND8768485/FCA_GND8768485_Mesenchymal_GATA2.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_Mesenchymal_GATA2.fragments.tsv > Mesenchymal_GATA2_Female.fragments.tsv
sort -k1,1 -k2,2n Mesenchymal_GATA2_Female.fragments.tsv > Mesenchymal_GATA2_Female.fragments.sort.tsv
macs2 callpeak -t Mesenchymal_GATA2_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Mesenchymal_GATA2_Female

cat FCA_GND8795928/FCA_GND8795928_Mesenchymal_GATA2.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Mesenchymal_GATA2.fragments.tsv FCA_GND8768482/FCA_GND8768482_Mesenchymal_GATA2.fragments.tsv FCA_GND8768481/FCA_GND8768481_Mesenchymal_GATA2.fragments.tsv FCA_GND8768487/FCA_GND8768487_Mesenchymal_GATA2.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Mesenchymal_GATA2.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Mesenchymal_GATA2.fragments.tsv FCA_GND8795927/FCA_GND8795927_Mesenchymal_GATA2.fragments.tsv FCA_GND9332157/FCA_GND9332157_Mesenchymal_GATA2.fragments.tsv > Mesenchymal_GATA2_Male.fragments.tsv
sort -k1,1 -k2,2n Mesenchymal_GATA2_Male.fragments.tsv > Mesenchymal_GATA2_Male.fragments.sort.tsv
macs2 callpeak -t Mesenchymal_GATA2_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Mesenchymal_GATA2_Male

cat Mesenchymal_GATA2_Female_peaks.narrowPeak Mesenchymal_GATA2_Male_peaks.narrowPeak > Mesenchymal_GATA2_All_peaks.narrowPeak
sort -k1,1 -k2,2n Mesenchymal_GATA2_All_peaks.narrowPeak > Mesenchymal_GATA2_All_peaks.sort.narrowPeak
bedtools merge -i Mesenchymal_GATA2_All_peaks.sort.narrowPeak > Mesenchymal_GATA2_All_peaks.merged.narrowPeak

mv Mesenchymal_GATA2_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Mesenchymal_GATA2_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Mesenchymal_GATA2_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip Mesenchymal_GATA2_Female.fragments.sort.tsv
tabix -p bed Mesenchymal_GATA2_Female.fragments.sort.tsv.gz
mv Mesenchymal_GATA2_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Mesenchymal_GATA2_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip Mesenchymal_GATA2_Male.fragments.sort.tsv
tabix -p bed Mesenchymal_GATA2_Male.fragments.sort.tsv.gz
mv Mesenchymal_GATA2_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Mesenchymal_GATA2_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_Neural.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_Neural.fragments.tsv FCA_GND8046539/FCA_GND8046539_Neural.fragments.tsv FCA_GND8768484/FCA_GND8768484_Neural.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_Neural.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_Neural.fragments.tsv FCA_GND8768483/FCA_GND8768483_Neural.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_Neural.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_Neural.fragments.tsv FCA_GND8768485/FCA_GND8768485_Neural.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_Neural.fragments.tsv > Neural_Female.fragments.tsv
sort -k1,1 -k2,2n Neural_Female.fragments.tsv > Neural_Female.fragments.sort.tsv
macs2 callpeak -t Neural_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Neural_Female

cat FCA_GND8795928/FCA_GND8795928_Neural.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Neural.fragments.tsv FCA_GND8768482/FCA_GND8768482_Neural.fragments.tsv FCA_GND8768481/FCA_GND8768481_Neural.fragments.tsv FCA_GND8768487/FCA_GND8768487_Neural.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Neural.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Neural.fragments.tsv FCA_GND8795927/FCA_GND8795927_Neural.fragments.tsv FCA_GND9332157/FCA_GND9332157_Neural.fragments.tsv > Neural_Male.fragments.tsv
sort -k1,1 -k2,2n Neural_Male.fragments.tsv > Neural_Male.fragments.sort.tsv
macs2 callpeak -t Neural_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Neural_Male

cat Neural_Female_peaks.narrowPeak Neural_Male_peaks.narrowPeak > Neural_All_peaks.narrowPeak
sort -k1,1 -k2,2n Neural_All_peaks.narrowPeak > Neural_All_peaks.sort.narrowPeak
bedtools merge -i Neural_All_peaks.sort.narrowPeak > Neural_All_peaks.merged.narrowPeak

mv Neural_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Neural_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv Neural_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip Neural_Female.fragments.sort.tsv
tabix -p bed Neural_Female.fragments.sort.tsv.gz
mv Neural_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Neural_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip Neural_Male.fragments.sort.tsv
tabix -p bed Neural_Male.fragments.sort.tsv.gz
mv Neural_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Neural_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_PV.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_PV.fragments.tsv FCA_GND8046539/FCA_GND8046539_PV.fragments.tsv FCA_GND8768484/FCA_GND8768484_PV.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_PV.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_PV.fragments.tsv FCA_GND8768483/FCA_GND8768483_PV.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_PV.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_PV.fragments.tsv FCA_GND8768485/FCA_GND8768485_PV.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_PV.fragments.tsv > PV_Female.fragments.tsv
sort -k1,1 -k2,2n PV_Female.fragments.tsv > PV_Female.fragments.sort.tsv
macs2 callpeak -t PV_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n PV_Female

cat FCA_GND8795928/FCA_GND8795928_PV.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_PV.fragments.tsv FCA_GND8768482/FCA_GND8768482_PV.fragments.tsv FCA_GND8768481/FCA_GND8768481_PV.fragments.tsv FCA_GND8768487/FCA_GND8768487_PV.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_PV.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_PV.fragments.tsv FCA_GND8795927/FCA_GND8795927_PV.fragments.tsv FCA_GND9332157/FCA_GND9332157_PV.fragments.tsv > PV_Male.fragments.tsv
sort -k1,1 -k2,2n PV_Male.fragments.tsv > PV_Male.fragments.sort.tsv
macs2 callpeak -t PV_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n PV_Male

cat PV_Female_peaks.narrowPeak PV_Male_peaks.narrowPeak > PV_All_peaks.narrowPeak
sort -k1,1 -k2,2n PV_All_peaks.narrowPeak > PV_All_peaks.sort.narrowPeak
bedtools merge -i PV_All_peaks.sort.narrowPeak > PV_All_peaks.merged.narrowPeak

mv PV_All_peaks.merged.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv PV_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
mv PV_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

bgzip PV_Female.fragments.sort.tsv
tabix -p bed PV_Female.fragments.sort.tsv.gz
mv PV_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv PV_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

bgzip PV_Male.fragments.sort.tsv
tabix -p bed PV_Male.fragments.sort.tsv.gz
mv PV_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv PV_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

mv *summits.bed /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
