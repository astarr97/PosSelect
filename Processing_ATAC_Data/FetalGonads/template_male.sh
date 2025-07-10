cat FCA_GND8795928/FCA_GND8795928_Epithelial.fragments.tsv HD_F_GON9883955/HD_F_GON9883955_Epithelial.fragments.tsv FCA_GND8768482/FCA_GND8768482_Epithelial.fragments.tsv FCA_GND8768481/FCA_GND8768481_Epithelial.fragments.tsv FCA_GND8768487/FCA_GND8768487_Epithelial.fragments.tsv HD_F_GON9883958/HD_F_GON9883958_Epithelial.fragments.tsv HD_F_GON9479872/HD_F_GON9479872_Epithelial.fragments.tsv FCA_GND8795927/FCA_GND8795927_Epithelial.fragments.tsv FCA_GND9332157/FCA_GND9332157_Epithelial.fragments.tsv > Epithelial_Male.fragments.tsv
sort -k1,1 -k2,2n Epithelial_Male.fragments.tsv > Epithelial_Male.fragments.sort.tsv
macs2 callpeak -t Epithelial_Male.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Epithelial_Male
mv Epithelial_Male_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/peaks
bgzip Epithelial_Male.fragments.sort.tsv
tabix -p bed Epithelial_Male.fragments.sort.tsv.gz
mv Epithelial_Male.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
mv Epithelial_Male.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Gonads/inputs/reads
