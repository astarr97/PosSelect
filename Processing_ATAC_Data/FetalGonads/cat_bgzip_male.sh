#!/bin/bash
#SBATCH --time=120:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB
#SBATCH -c 1


cat FCA_GND8795928/FCA_GND8795928_pre_spermatogonia.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_pre_spermatogonia.fragments.tsv FCA_GND8768482/FCA_GND8768482_pre_spermatogonia.fragments.tsv FCA_GND8768481/FCA_GND8768481_pre_spermatogonia.fragments.tsv FCA_GND8768487/FCA_GND8768487_pre_spermatogonia.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_pre_spermatogonia.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_pre_spermatogonia.fragments.tsv FCA_GND8795927/FCA_GND8795927_pre_spermatogonia.fragments.tsv FCA_GND9332157/FCA_GND9332157_pre_spermatogonia.fragments.tsv > pre_spermatogonia_Male.fragments.tsv
sort -k1,1 -k2,2n pre_spermatogonia_Male.fragments.tsv > pre_spermatogonia_Male.fragments.sort.tsv
macs2 callpeak -t pre_spermatogonia_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n pre_spermatogonia_Male
mv pre_spermatogonia_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip pre_spermatogonia_Male.fragments.sort.tsv
tabix -p bed pre_spermatogonia_Male.fragments.sort.tsv.gz
mv pre_spermatogonia_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv pre_spermatogonia_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND8795928/FCA_GND8795928_Ti.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Ti.fragments.tsv FCA_GND8768482/FCA_GND8768482_Ti.fragments.tsv FCA_GND8768481/FCA_GND8768481_Ti.fragments.tsv FCA_GND8768487/FCA_GND8768487_Ti.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Ti.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Ti.fragments.tsv FCA_GND8795927/FCA_GND8795927_Ti.fragments.tsv FCA_GND9332157/FCA_GND9332157_Ti.fragments.tsv > Ti_Male.fragments.tsv
sort -k1,1 -k2,2n Ti_Male.fragments.tsv > Ti_Male.fragments.sort.tsv
macs2 callpeak -t Ti_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Ti_Male
mv Ti_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip Ti_Male.fragments.sort.tsv
tabix -p bed Ti_Male.fragments.sort.tsv.gz
mv Ti_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Ti_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND8795928/FCA_GND8795928_Sertoli.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Sertoli.fragments.tsv FCA_GND8768482/FCA_GND8768482_Sertoli.fragments.tsv FCA_GND8768481/FCA_GND8768481_Sertoli.fragments.tsv FCA_GND8768487/FCA_GND8768487_Sertoli.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Sertoli.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Sertoli.fragments.tsv FCA_GND8795927/FCA_GND8795927_Sertoli.fragments.tsv FCA_GND9332157/FCA_GND9332157_Sertoli.fragments.tsv > Sertoli_Male.fragments.tsv
sort -k1,1 -k2,2n Sertoli_Male.fragments.tsv > Sertoli_Male.fragments.sort.tsv
macs2 callpeak -t Sertoli_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Sertoli_Male
mv Sertoli_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip Sertoli_Male.fragments.sort.tsv
tabix -p bed Sertoli_Male.fragments.sort.tsv.gz
mv Sertoli_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Sertoli_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND8795928/FCA_GND8795928_sPAX8.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_sPAX8.fragments.tsv FCA_GND8768482/FCA_GND8768482_sPAX8.fragments.tsv FCA_GND8768481/FCA_GND8768481_sPAX8.fragments.tsv FCA_GND8768487/FCA_GND8768487_sPAX8.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_sPAX8.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_sPAX8.fragments.tsv FCA_GND8795927/FCA_GND8795927_sPAX8.fragments.tsv FCA_GND9332157/FCA_GND9332157_sPAX8.fragments.tsv > sPAX8_Male.fragments.tsv
sort -k1,1 -k2,2n sPAX8_Male.fragments.tsv > sPAX8_Male.fragments.sort.tsv
macs2 callpeak -t sPAX8_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n sPAX8_Male
mv sPAX8_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip sPAX8_Male.fragments.sort.tsv
tabix -p bed sPAX8_Male.fragments.sort.tsv.gz
mv sPAX8_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv sPAX8_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads


cat FCA_GND8795928/FCA_GND8795928_FetalLeydig.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_FetalLeydig.fragments.tsv FCA_GND8768482/FCA_GND8768482_FetalLeydig.fragments.tsv FCA_GND8768481/FCA_GND8768481_FetalLeydig.fragments.tsv FCA_GND8768487/FCA_GND8768487_FetalLeydig.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_FetalLeydig.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_FetalLeydig.fragments.tsv FCA_GND8795927/FCA_GND8795927_FetalLeydig.fragments.tsv FCA_GND9332157/FCA_GND9332157_FetalLeydig.fragments.tsv > FetalLeydig_Male.fragments.tsv
sort -k1,1 -k2,2n FetalLeydig_Male.fragments.tsv > FetalLeydig_Male.fragments.sort.tsv
macs2 callpeak -t FetalLeydig_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n FetalLeydig_Male
mv FetalLeydig_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip FetalLeydig_Male.fragments.sort.tsv
tabix -p bed FetalLeydig_Male.fragments.sort.tsv.gz
mv FetalLeydig_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv FetalLeydig_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

mv *summits.bed /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks

