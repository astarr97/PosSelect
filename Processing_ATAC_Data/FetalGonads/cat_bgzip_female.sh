#!/bin/bash
#SBATCH --time=120:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB
#SBATCH -c 1


cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_oogonia_STRA8.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_oogonia_STRA8.fragments.tsv FCA_GND8046539/FCA_GND8046539_oogonia_STRA8.fragments.tsv FCA_GND8768484/FCA_GND8768484_oogonia_STRA8.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_oogonia_STRA8.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_oogonia_STRA8.fragments.tsv FCA_GND8768483/FCA_GND8768483_oogonia_STRA8.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_oogonia_STRA8.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_oogonia_STRA8.fragments.tsv FCA_GND8768485/FCA_GND8768485_oogonia_STRA8.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_oogonia_STRA8.fragments.tsv > oogonia_STRA8_Female.fragments.tsv
sort -k1,1 -k2,2n oogonia_STRA8_Female.fragments.tsv > oogonia_STRA8_Female.fragments.sort.tsv
macs2 callpeak -t oogonia_STRA8_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n oogonia_STRA8_Female
mv oogonia_STRA8_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip oogonia_STRA8_Female.fragments.sort.tsv
tabix -p bed oogonia_STRA8_Female.fragments.sort.tsv.gz
mv oogonia_STRA8_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv oogonia_STRA8_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_oogonia_meiotic.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_oogonia_meiotic.fragments.tsv FCA_GND8046539/FCA_GND8046539_oogonia_meiotic.fragments.tsv FCA_GND8768484/FCA_GND8768484_oogonia_meiotic.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_oogonia_meiotic.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_oogonia_meiotic.fragments.tsv FCA_GND8768483/FCA_GND8768483_oogonia_meiotic.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_oogonia_meiotic.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_oogonia_meiotic.fragments.tsv FCA_GND8768485/FCA_GND8768485_oogonia_meiotic.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_oogonia_meiotic.fragments.tsv > oogonia_meiotic_Female.fragments.tsv
sort -k1,1 -k2,2n oogonia_meiotic_Female.fragments.tsv > oogonia_meiotic_Female.fragments.sort.tsv
macs2 callpeak -t oogonia_meiotic_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n oogonia_meiotic_Female
mv oogonia_meiotic_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip oogonia_meiotic_Female.fragments.sort.tsv
tabix -p bed oogonia_meiotic_Female.fragments.sort.tsv.gz
mv oogonia_meiotic_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv oogonia_meiotic_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_pre_oocyte.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_pre_oocyte.fragments.tsv FCA_GND8046539/FCA_GND8046539_pre_oocyte.fragments.tsv FCA_GND8768484/FCA_GND8768484_pre_oocyte.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_pre_oocyte.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_pre_oocyte.fragments.tsv FCA_GND8768483/FCA_GND8768483_pre_oocyte.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_pre_oocyte.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_pre_oocyte.fragments.tsv FCA_GND8768485/FCA_GND8768485_pre_oocyte.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_pre_oocyte.fragments.tsv > pre_oocyte_Female.fragments.tsv
sort -k1,1 -k2,2n pre_oocyte_Female.fragments.tsv > pre_oocyte_Female.fragments.sort.tsv
macs2 callpeak -t pre_oocyte_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n pre_oocyte_Female
mv pre_oocyte_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip pre_oocyte_Female.fragments.sort.tsv
tabix -p bed pre_oocyte_Female.fragments.sort.tsv.gz
mv pre_oocyte_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv pre_oocyte_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_oocyte.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_oocyte.fragments.tsv FCA_GND8046539/FCA_GND8046539_oocyte.fragments.tsv FCA_GND8768484/FCA_GND8768484_oocyte.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_oocyte.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_oocyte.fragments.tsv FCA_GND8768483/FCA_GND8768483_oocyte.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_oocyte.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_oocyte.fragments.tsv FCA_GND8768485/FCA_GND8768485_oocyte.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_oocyte.fragments.tsv > oocyte_Female.fragments.tsv
sort -k1,1 -k2,2n oocyte_Female.fragments.tsv > oocyte_Female.fragments.sort.tsv
macs2 callpeak -t oocyte_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n oocyte_Female
mv oocyte_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip oocyte_Female.fragments.sort.tsv
tabix -p bed oocyte_Female.fragments.sort.tsv.gz
mv oocyte_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv oocyte_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_preGC_I.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_preGC_I.fragments.tsv FCA_GND8046539/FCA_GND8046539_preGC_I.fragments.tsv FCA_GND8768484/FCA_GND8768484_preGC_I.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_preGC_I.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_preGC_I.fragments.tsv FCA_GND8768483/FCA_GND8768483_preGC_I.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_preGC_I.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_preGC_I.fragments.tsv FCA_GND8768485/FCA_GND8768485_preGC_I.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_preGC_I.fragments.tsv > preGC_I_Female.fragments.tsv
sort -k1,1 -k2,2n preGC_I_Female.fragments.tsv > preGC_I_Female.fragments.sort.tsv
macs2 callpeak -t preGC_I_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n preGC_I_Female
mv preGC_I_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip preGC_I_Female.fragments.sort.tsv
tabix -p bed preGC_I_Female.fragments.sort.tsv.gz
mv preGC_I_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv preGC_I_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_preGC_IIa.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_preGC_IIa.fragments.tsv FCA_GND8046539/FCA_GND8046539_preGC_IIa.fragments.tsv FCA_GND8768484/FCA_GND8768484_preGC_IIa.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_preGC_IIa.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_preGC_IIa.fragments.tsv FCA_GND8768483/FCA_GND8768483_preGC_IIa.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_preGC_IIa.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_preGC_IIa.fragments.tsv FCA_GND8768485/FCA_GND8768485_preGC_IIa.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_preGC_IIa.fragments.tsv > preGC_IIa_Female.fragments.tsv
sort -k1,1 -k2,2n preGC_IIa_Female.fragments.tsv > preGC_IIa_Female.fragments.sort.tsv
macs2 callpeak -t preGC_IIa_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n preGC_IIa_Female
mv preGC_IIa_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip preGC_IIa_Female.fragments.sort.tsv
tabix -p bed preGC_IIa_Female.fragments.sort.tsv.gz
mv preGC_IIa_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv preGC_IIa_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_Oi.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_Oi.fragments.tsv FCA_GND8046539/FCA_GND8046539_Oi.fragments.tsv FCA_GND8768484/FCA_GND8768484_Oi.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_Oi.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_Oi.fragments.tsv FCA_GND8768483/FCA_GND8768483_Oi.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_Oi.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_Oi.fragments.tsv FCA_GND8768485/FCA_GND8768485_Oi.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_Oi.fragments.tsv > Oi_Female.fragments.tsv
sort -k1,1 -k2,2n Oi_Female.fragments.tsv > Oi_Female.fragments.sort.tsv
macs2 callpeak -t Oi_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Oi_Female
mv Oi_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip Oi_Female.fragments.sort.tsv
tabix -p bed Oi_Female.fragments.sort.tsv.gz
mv Oi_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Oi_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_preGC_IIb.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_preGC_IIb.fragments.tsv FCA_GND8046539/FCA_GND8046539_preGC_IIb.fragments.tsv FCA_GND8768484/FCA_GND8768484_preGC_IIb.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_preGC_IIb.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_preGC_IIb.fragments.tsv FCA_GND8768483/FCA_GND8768483_preGC_IIb.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_preGC_IIb.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_preGC_IIb.fragments.tsv FCA_GND8768485/FCA_GND8768485_preGC_IIb.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_preGC_IIb.fragments.tsv > preGC_IIb_Female.fragments.tsv
sort -k1,1 -k2,2n preGC_IIb_Female.fragments.tsv > preGC_IIb_Female.fragments.sort.tsv
macs2 callpeak -t preGC_IIb_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n preGC_IIb_Female
mv preGC_IIb_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip preGC_IIb_Female.fragments.sort.tsv
tabix -p bed preGC_IIb_Female.fragments.sort.tsv.gz
mv preGC_IIb_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv preGC_IIb_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_OSE.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_OSE.fragments.tsv FCA_GND8046539/FCA_GND8046539_OSE.fragments.tsv FCA_GND8768484/FCA_GND8768484_OSE.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_OSE.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_OSE.fragments.tsv FCA_GND8768483/FCA_GND8768483_OSE.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_OSE.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_OSE.fragments.tsv FCA_GND8768485/FCA_GND8768485_OSE.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_OSE.fragments.tsv > OSE_Female.fragments.tsv
sort -k1,1 -k2,2n OSE_Female.fragments.tsv > OSE_Female.fragments.sort.tsv
macs2 callpeak -t OSE_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n OSE_Female
mv OSE_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip OSE_Female.fragments.sort.tsv
tabix -p bed OSE_Female.fragments.sort.tsv.gz
mv OSE_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv OSE_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_granulosa.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_granulosa.fragments.tsv FCA_GND8046539/FCA_GND8046539_granulosa.fragments.tsv FCA_GND8768484/FCA_GND8768484_granulosa.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_granulosa.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_granulosa.fragments.tsv FCA_GND8768483/FCA_GND8768483_granulosa.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_granulosa.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_granulosa.fragments.tsv FCA_GND8768485/FCA_GND8768485_granulosa.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_granulosa.fragments.tsv > granulosa_Female.fragments.tsv
sort -k1,1 -k2,2n granulosa_Female.fragments.tsv > granulosa_Female.fragments.sort.tsv
macs2 callpeak -t granulosa_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n granulosa_Female
mv granulosa_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip granulosa_Female.fragments.sort.tsv
tabix -p bed granulosa_Female.fragments.sort.tsv.gz
mv granulosa_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv granulosa_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

cat FCA_GND10288176_FCA_GND10287600/FCA_GND10288176_FCA_GND10287600_SMCs.fragments.tsv FCA_GND10288177_FCA_GND10287601/FCA_GND10288177_FCA_GND10287601_SMCs.fragments.tsv FCA_GND8046539/FCA_GND8046539_SMCs.fragments.tsv FCA_GND8768484/FCA_GND8768484_SMCs.fragments.tsv HD_F_GON9883959/HD_F_GON9883959_SMCs.fragments.tsv HD_F_GON9883960/HD_F_GON9883960_SMCs.fragments.tsv FCA_GND8768483/FCA_GND8768483_SMCs.fragments.tsv HD_F_GON9479873/HD_F_GON9479873_SMCs.fragments.tsv HD_F_GON9479874/HD_F_GON9479874_SMCs.fragments.tsv FCA_GND8768485/FCA_GND8768485_SMCs.fragments.tsv HD_F_GON9479875/HD_F_GON9479875_SMCs.fragments.tsv > SMCs_Female.fragments.tsv
sort -k1,1 -k2,2n SMCs_Female.fragments.tsv > SMCs_Female.fragments.sort.tsv
macs2 callpeak -t SMCs_Female.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n SMCs_Female
mv SMCs_Female_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip SMCs_Female.fragments.sort.tsv
tabix -p bed SMCs_Female.fragments.sort.tsv.gz
mv SMCs_Female.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv SMCs_Female.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads

mv *summits.bed /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
