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
