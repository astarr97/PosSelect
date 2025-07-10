#!/bin/bash
#SBATCH --time=120:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB
#SBATCH -c 1

cat 10X312_5/10X312_5_Rgl_CB_3.fragments.tsv 10X232_2/10X232_2_Rgl_CB_3.fragments.tsv 10X290_2/10X290_2_Rgl_CB_3.fragments.tsv 10X232_4/10X232_4_Rgl_CB_3.fragments.tsv 10X312_6/10X312_6_Rgl_CB_3.fragments.tsv 10X232_1/10X232_1_Rgl_CB_3.fragments.tsv 10X407_3/10X407_3_Rgl_CB_3.fragments.tsv 10X232_3/10X232_3_Rgl_CB_3.fragments.tsv 10X291_3/10X291_3_Rgl_CB_3.fragments.tsv 10X313_6/10X313_6_Rgl_CB_3.fragments.tsv 10X366_2/10X366_2_Rgl_CB_3.fragments.tsv 10X340_4/10X340_4_Rgl_CB_3.fragments.tsv 10X407_2/10X407_2_Rgl_CB_3.fragments.tsv 10X250_4/10X250_4_Rgl_CB_3.fragments.tsv 10X407_1/10X407_1_Rgl_CB_3.fragments.tsv 10X312_3/10X312_3_Rgl_CB_3.fragments.tsv 10X290_1/10X290_1_Rgl_CB_3.fragments.tsv 10X312_4/10X312_4_Rgl_CB_3.fragments.tsv > Rgl_CB_3.fragments.tsv
sort -k1,1 -k2,2n Rgl_CB_3.fragments.tsv > Rgl_CB_3.fragments.sort.tsv
macs2 callpeak -t Rgl_CB_3.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Rgl_CB_3
mv Rgl_CB_3_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip Rgl_CB_3.fragments.sort.tsv
tabix -p bed Rgl_CB_3.fragments.sort.tsv.gz
mv Rgl_CB_3.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv Rgl_CB_3.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X317_5/10X317_5_End_8.fragments.tsv 10X346_4/10X346_4_End_8.fragments.tsv 10X372_1/10X372_1_End_8.fragments.tsv 10X340_3/10X340_3_End_8.fragments.tsv 10X316_6/10X316_6_End_8.fragments.tsv 10X232_2/10X232_2_End_8.fragments.tsv 10X315_2/10X315_2_End_8.fragments.tsv 10X347_4/10X347_4_End_8.fragments.tsv 10X366_5/10X366_5_End_8.fragments.tsv 10X325_6/10X325_6_End_8.fragments.tsv 10X406_5/10X406_5_End_8.fragments.tsv 10X316_1/10X316_1_End_8.fragments.tsv 10X315_7/10X315_7_End_8.fragments.tsv 10X420_5/10X420_5_End_8.fragments.tsv 10X315_5/10X315_5_End_8.fragments.tsv 10X316_4/10X316_4_End_8.fragments.tsv 10X321_5/10X321_5_End_8.fragments.tsv 10X369_1/10X369_1_End_8.fragments.tsv 10X369_2/10X369_2_End_8.fragments.tsv 10X369_3/10X369_3_End_8.fragments.tsv 10X315_3/10X315_3_End_8.fragments.tsv 10X313_5/10X313_5_End_8.fragments.tsv 10X232_1/10X232_1_End_8.fragments.tsv 10X340_1/10X340_1_End_8.fragments.tsv 10X406_4/10X406_4_End_8.fragments.tsv 10X315_4/10X315_4_End_8.fragments.tsv 10X365_2/10X365_2_End_8.fragments.tsv 10X406_3/10X406_3_End_8.fragments.tsv 10X250_3/10X250_3_End_8.fragments.tsv 10X364_2/10X364_2_End_8.fragments.tsv 10X242_2/10X242_2_End_8.fragments.tsv 10X232_3/10X232_3_End_8.fragments.tsv 10X340_2/10X340_2_End_8.fragments.tsv 10X372_4/10X372_4_End_8.fragments.tsv 10X321_4/10X321_4_End_8.fragments.tsv 10X346_3/10X346_3_End_8.fragments.tsv 10X372_2/10X372_2_End_8.fragments.tsv 10X321_1/10X321_1_End_8.fragments.tsv 10X316_5/10X316_5_End_8.fragments.tsv 10X347_2/10X347_2_End_8.fragments.tsv 10X366_2/10X366_2_End_8.fragments.tsv 10X346_1/10X346_1_End_8.fragments.tsv 10X364_4/10X364_4_End_8.fragments.tsv 10X347_1/10X347_1_End_8.fragments.tsv 10X369_4/10X369_4_End_8.fragments.tsv 10X340_4/10X340_4_End_8.fragments.tsv 10X370_2/10X370_2_End_8.fragments.tsv 10X420_3/10X420_3_End_8.fragments.tsv 10X366_6/10X366_6_End_8.fragments.tsv 10X372_3/10X372_3_End_8.fragments.tsv 10X365_4/10X365_4_End_8.fragments.tsv 10X370_3/10X370_3_End_8.fragments.tsv 10X315_1/10X315_1_End_8.fragments.tsv 10X370_1/10X370_1_End_8.fragments.tsv 10X242_3/10X242_3_End_8.fragments.tsv 10X242_1/10X242_1_End_8.fragments.tsv 10X317_4/10X317_4_End_8.fragments.tsv 10X370_4/10X370_4_End_8.fragments.tsv 10X313_4/10X313_4_End_8.fragments.tsv 10X347_3/10X347_3_End_8.fragments.tsv 10X317_3/10X317_3_End_8.fragments.tsv 10X317_6/10X317_6_End_8.fragments.tsv 10X321_6/10X321_6_End_8.fragments.tsv 10X242_4/10X242_4_End_8.fragments.tsv 10X321_3/10X321_3_End_8.fragments.tsv 10X315_6/10X315_6_End_8.fragments.tsv > End_8.fragments.tsv
sort -k1,1 -k2,2n End_8.fragments.tsv > End_8.fragments.sort.tsv
macs2 callpeak -t End_8.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n End_8
mv End_8_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip End_8.fragments.sort.tsv
tabix -p bed End_8.fragments.sort.tsv.gz
mv End_8.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv End_8.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X317_5/10X317_5_Gbl_late.fragments.tsv 10X372_1/10X372_1_Gbl_late.fragments.tsv 10X340_3/10X340_3_Gbl_late.fragments.tsv 10X316_6/10X316_6_Gbl_late.fragments.tsv 10X315_2/10X315_2_Gbl_late.fragments.tsv 10X316_1/10X316_1_Gbl_late.fragments.tsv 10X315_7/10X315_7_Gbl_late.fragments.tsv 10X315_5/10X315_5_Gbl_late.fragments.tsv 10X316_4/10X316_4_Gbl_late.fragments.tsv 10X321_5/10X321_5_Gbl_late.fragments.tsv 10X369_1/10X369_1_Gbl_late.fragments.tsv 10X369_2/10X369_2_Gbl_late.fragments.tsv 10X369_3/10X369_3_Gbl_late.fragments.tsv 10X315_3/10X315_3_Gbl_late.fragments.tsv 10X315_4/10X315_4_Gbl_late.fragments.tsv 10X313_2/10X313_2_Gbl_late.fragments.tsv 10X321_4/10X321_4_Gbl_late.fragments.tsv 10X315_8/10X315_8_Gbl_late.fragments.tsv 10X316_5/10X316_5_Gbl_late.fragments.tsv 10X369_4/10X369_4_Gbl_late.fragments.tsv 10X316_3/10X316_3_Gbl_late.fragments.tsv 10X340_4/10X340_4_Gbl_late.fragments.tsv 10X370_2/10X370_2_Gbl_late.fragments.tsv 10X370_3/10X370_3_Gbl_late.fragments.tsv 10X315_1/10X315_1_Gbl_late.fragments.tsv 10X370_1/10X370_1_Gbl_late.fragments.tsv 10X317_4/10X317_4_Gbl_late.fragments.tsv 10X317_1/10X317_1_Gbl_late.fragments.tsv 10X370_4/10X370_4_Gbl_late.fragments.tsv 10X347_3/10X347_3_Gbl_late.fragments.tsv 10X317_3/10X317_3_Gbl_late.fragments.tsv 10X317_6/10X317_6_Gbl_late.fragments.tsv 10X325_1/10X325_1_Gbl_late.fragments.tsv 10X315_6/10X315_6_Gbl_late.fragments.tsv > Gbl_late.fragments.tsv
sort -k1,1 -k2,2n Gbl_late.fragments.tsv > Gbl_late.fragments.sort.tsv
macs2 callpeak -t Gbl_late.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Gbl_late
mv Gbl_late_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip Gbl_late.fragments.sort.tsv
tabix -p bed Gbl_late.fragments.sort.tsv.gz
mv Gbl_late.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv Gbl_late.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X317_5/10X317_5_OPC_2.fragments.tsv 10X346_4/10X346_4_OPC_2.fragments.tsv 10X313_3/10X313_3_OPC_2.fragments.tsv 10X340_3/10X340_3_OPC_2.fragments.tsv 10X316_6/10X316_6_OPC_2.fragments.tsv 10X347_4/10X347_4_OPC_2.fragments.tsv 10X325_6/10X325_6_OPC_2.fragments.tsv 10X406_5/10X406_5_OPC_2.fragments.tsv 10X315_7/10X315_7_OPC_2.fragments.tsv 10X420_5/10X420_5_OPC_2.fragments.tsv 10X315_5/10X315_5_OPC_2.fragments.tsv 10X371_1/10X371_1_OPC_2.fragments.tsv 10X316_4/10X316_4_OPC_2.fragments.tsv 10X321_5/10X321_5_OPC_2.fragments.tsv 10X280_2/10X280_2_OPC_2.fragments.tsv 10X369_2/10X369_2_OPC_2.fragments.tsv 10X369_3/10X369_3_OPC_2.fragments.tsv 10X315_3/10X315_3_OPC_2.fragments.tsv 10X406_4/10X406_4_OPC_2.fragments.tsv 10X279_3/10X279_3_OPC_2.fragments.tsv 10X315_4/10X315_4_OPC_2.fragments.tsv 10X406_3/10X406_3_OPC_2.fragments.tsv 10X250_3/10X250_3_OPC_2.fragments.tsv 10X242_2/10X242_2_OPC_2.fragments.tsv 10X280_3/10X280_3_OPC_2.fragments.tsv 10X279_2/10X279_2_OPC_2.fragments.tsv 10X340_2/10X340_2_OPC_2.fragments.tsv 10X372_4/10X372_4_OPC_2.fragments.tsv 10X291_3/10X291_3_OPC_2.fragments.tsv 10X321_4/10X321_4_OPC_2.fragments.tsv 10X371_2/10X371_2_OPC_2.fragments.tsv 10X346_3/10X346_3_OPC_2.fragments.tsv 10X315_8/10X315_8_OPC_2.fragments.tsv 10X372_2/10X372_2_OPC_2.fragments.tsv 10X316_5/10X316_5_OPC_2.fragments.tsv 10X347_2/10X347_2_OPC_2.fragments.tsv 10X364_4/10X364_4_OPC_2.fragments.tsv 10X369_4/10X369_4_OPC_2.fragments.tsv 10X316_3/10X316_3_OPC_2.fragments.tsv 10X340_4/10X340_4_OPC_2.fragments.tsv 10X370_2/10X370_2_OPC_2.fragments.tsv 10X420_3/10X420_3_OPC_2.fragments.tsv 10X366_6/10X366_6_OPC_2.fragments.tsv 10X372_3/10X372_3_OPC_2.fragments.tsv 10X365_4/10X365_4_OPC_2.fragments.tsv 10X407_2/10X407_2_OPC_2.fragments.tsv 10X370_3/10X370_3_OPC_2.fragments.tsv 10X315_1/10X315_1_OPC_2.fragments.tsv 10X370_1/10X370_1_OPC_2.fragments.tsv 10X242_3/10X242_3_OPC_2.fragments.tsv 10X250_4/10X250_4_OPC_2.fragments.tsv 10X242_1/10X242_1_OPC_2.fragments.tsv 10X317_4/10X317_4_OPC_2.fragments.tsv 10X370_4/10X370_4_OPC_2.fragments.tsv 10X406_7/10X406_7_OPC_2.fragments.tsv 10X313_4/10X313_4_OPC_2.fragments.tsv 10X347_3/10X347_3_OPC_2.fragments.tsv 10X317_3/10X317_3_OPC_2.fragments.tsv 10X317_6/10X317_6_OPC_2.fragments.tsv 10X242_4/10X242_4_OPC_2.fragments.tsv 10X406_2/10X406_2_OPC_2.fragments.tsv 10X321_3/10X321_3_OPC_2.fragments.tsv 10X315_6/10X315_6_OPC_2.fragments.tsv > OPC_2.fragments.tsv
sort -k1,1 -k2,2n OPC_2.fragments.tsv > OPC_2.fragments.sort.tsv
macs2 callpeak -t OPC_2.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n OPC_2
mv OPC_2_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip OPC_2.fragments.sort.tsv
tabix -p bed OPC_2.fragments.sort.tsv.gz
mv OPC_2.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv OPC_2.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X346_4/10X346_4_PreOPC_4.fragments.tsv 10X366_5/10X366_5_PreOPC_4.fragments.tsv 10X406_5/10X406_5_PreOPC_4.fragments.tsv 10X406_1/10X406_1_PreOPC_4.fragments.tsv 10X406_4/10X406_4_PreOPC_4.fragments.tsv 10X406_3/10X406_3_PreOPC_4.fragments.tsv 10X364_2/10X364_2_PreOPC_4.fragments.tsv 10X242_2/10X242_2_PreOPC_4.fragments.tsv 10X346_3/10X346_3_PreOPC_4.fragments.tsv 10X364_4/10X364_4_PreOPC_4.fragments.tsv 10X366_6/10X366_6_PreOPC_4.fragments.tsv 10X365_4/10X365_4_PreOPC_4.fragments.tsv 10X250_4/10X250_4_PreOPC_4.fragments.tsv 10X347_3/10X347_3_PreOPC_4.fragments.tsv 10X406_2/10X406_2_PreOPC_4.fragments.tsv > PreOPC_4.fragments.tsv
sort -k1,1 -k2,2n PreOPC_4.fragments.tsv > PreOPC_4.fragments.sort.tsv
macs2 callpeak -t PreOPC_4.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n PreOPC_4
mv PreOPC_4_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip PreOPC_4.fragments.sort.tsv
tabix -p bed PreOPC_4.fragments.sort.tsv.gz
mv PreOPC_4.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv PreOPC_4.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X346_4/10X346_4_Schwl_2.fragments.tsv 10X313_3/10X313_3_Schwl_2.fragments.tsv 10X340_3/10X340_3_Schwl_2.fragments.tsv 10X347_4/10X347_4_Schwl_2.fragments.tsv 10X406_5/10X406_5_Schwl_2.fragments.tsv 10X420_5/10X420_5_Schwl_2.fragments.tsv 10X369_1/10X369_1_Schwl_2.fragments.tsv 10X280_2/10X280_2_Schwl_2.fragments.tsv 10X369_2/10X369_2_Schwl_2.fragments.tsv 10X369_3/10X369_3_Schwl_2.fragments.tsv 10X315_3/10X315_3_Schwl_2.fragments.tsv 10X406_4/10X406_4_Schwl_2.fragments.tsv 10X346_2/10X346_2_Schwl_2.fragments.tsv 10X315_4/10X315_4_Schwl_2.fragments.tsv 10X250_3/10X250_3_Schwl_2.fragments.tsv 10X242_2/10X242_2_Schwl_2.fragments.tsv 10X279_2/10X279_2_Schwl_2.fragments.tsv 10X340_2/10X340_2_Schwl_2.fragments.tsv 10X321_4/10X321_4_Schwl_2.fragments.tsv 10X371_2/10X371_2_Schwl_2.fragments.tsv 10X346_3/10X346_3_Schwl_2.fragments.tsv 10X372_2/10X372_2_Schwl_2.fragments.tsv 10X313_6/10X313_6_Schwl_2.fragments.tsv 10X321_1/10X321_1_Schwl_2.fragments.tsv 10X347_2/10X347_2_Schwl_2.fragments.tsv 10X364_4/10X364_4_Schwl_2.fragments.tsv 10X347_1/10X347_1_Schwl_2.fragments.tsv 10X369_4/10X369_4_Schwl_2.fragments.tsv 10X316_3/10X316_3_Schwl_2.fragments.tsv 10X370_2/10X370_2_Schwl_2.fragments.tsv 10X366_6/10X366_6_Schwl_2.fragments.tsv 10X372_3/10X372_3_Schwl_2.fragments.tsv 10X365_4/10X365_4_Schwl_2.fragments.tsv 10X370_3/10X370_3_Schwl_2.fragments.tsv 10X370_1/10X370_1_Schwl_2.fragments.tsv 10X250_4/10X250_4_Schwl_2.fragments.tsv 10X242_1/10X242_1_Schwl_2.fragments.tsv 10X370_4/10X370_4_Schwl_2.fragments.tsv 10X313_4/10X313_4_Schwl_2.fragments.tsv 10X347_3/10X347_3_Schwl_2.fragments.tsv 10X317_3/10X317_3_Schwl_2.fragments.tsv 10X242_4/10X242_4_Schwl_2.fragments.tsv 10X321_3/10X321_3_Schwl_2.fragments.tsv 10X315_6/10X315_6_Schwl_2.fragments.tsv > Schwl_2.fragments.tsv
sort -k1,1 -k2,2n Schwl_2.fragments.tsv > Schwl_2.fragments.sort.tsv
macs2 callpeak -t Schwl_2.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Schwl_2
mv Schwl_2_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip Schwl_2.fragments.sort.tsv
tabix -p bed Schwl_2.fragments.sort.tsv.gz
mv Schwl_2.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv Schwl_2.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X346_4/10X346_4_Gbl_MB.fragments.tsv 10X315_2/10X315_2_Gbl_MB.fragments.tsv 10X347_4/10X347_4_Gbl_MB.fragments.tsv 10X316_4/10X316_4_Gbl_MB.fragments.tsv 10X321_5/10X321_5_Gbl_MB.fragments.tsv 10X313_5/10X313_5_Gbl_MB.fragments.tsv 10X346_2/10X346_2_Gbl_MB.fragments.tsv 10X364_2/10X364_2_Gbl_MB.fragments.tsv 10X340_2/10X340_2_Gbl_MB.fragments.tsv 10X321_4/10X321_4_Gbl_MB.fragments.tsv 10X346_3/10X346_3_Gbl_MB.fragments.tsv 10X372_2/10X372_2_Gbl_MB.fragments.tsv 10X347_2/10X347_2_Gbl_MB.fragments.tsv 10X346_1/10X346_1_Gbl_MB.fragments.tsv 10X347_1/10X347_1_Gbl_MB.fragments.tsv 10X369_4/10X369_4_Gbl_MB.fragments.tsv 10X242_3/10X242_3_Gbl_MB.fragments.tsv 10X317_4/10X317_4_Gbl_MB.fragments.tsv 10X370_4/10X370_4_Gbl_MB.fragments.tsv 10X347_3/10X347_3_Gbl_MB.fragments.tsv 10X321_6/10X321_6_Gbl_MB.fragments.tsv 10X321_3/10X321_3_Gbl_MB.fragments.tsv > Gbl_MB.fragments.tsv
sort -k1,1 -k2,2n Gbl_MB.fragments.tsv > Gbl_MB.fragments.sort.tsv
macs2 callpeak -t Gbl_MB.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Gbl_MB
mv Gbl_MB_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip Gbl_MB.fragments.sort.tsv
tabix -p bed Gbl_MB.fragments.sort.tsv.gz
mv Gbl_MB.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv Gbl_MB.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X313_3/10X313_3_Schwl_1.fragments.tsv 10X347_4/10X347_4_Schwl_1.fragments.tsv 10X406_5/10X406_5_Schwl_1.fragments.tsv 10X420_5/10X420_5_Schwl_1.fragments.tsv 10X369_1/10X369_1_Schwl_1.fragments.tsv 10X280_2/10X280_2_Schwl_1.fragments.tsv 10X369_3/10X369_3_Schwl_1.fragments.tsv 10X315_3/10X315_3_Schwl_1.fragments.tsv 10X406_4/10X406_4_Schwl_1.fragments.tsv 10X315_4/10X315_4_Schwl_1.fragments.tsv 10X242_2/10X242_2_Schwl_1.fragments.tsv 10X340_2/10X340_2_Schwl_1.fragments.tsv 10X372_4/10X372_4_Schwl_1.fragments.tsv 10X321_4/10X321_4_Schwl_1.fragments.tsv 10X371_2/10X371_2_Schwl_1.fragments.tsv 10X346_3/10X346_3_Schwl_1.fragments.tsv 10X364_4/10X364_4_Schwl_1.fragments.tsv 10X316_3/10X316_3_Schwl_1.fragments.tsv 10X372_3/10X372_3_Schwl_1.fragments.tsv 10X365_4/10X365_4_Schwl_1.fragments.tsv 10X370_3/10X370_3_Schwl_1.fragments.tsv 10X242_1/10X242_1_Schwl_1.fragments.tsv 10X313_4/10X313_4_Schwl_1.fragments.tsv 10X347_3/10X347_3_Schwl_1.fragments.tsv 10X317_3/10X317_3_Schwl_1.fragments.tsv 10X406_2/10X406_2_Schwl_1.fragments.tsv 10X313_1/10X313_1_Schwl_1.fragments.tsv > Schwl_1.fragments.tsv
sort -k1,1 -k2,2n Schwl_1.fragments.tsv > Schwl_1.fragments.sort.tsv
macs2 callpeak -t Schwl_1.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Schwl_1
mv Schwl_1_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip Schwl_1.fragments.sort.tsv
tabix -p bed Schwl_1.fragments.sort.tsv.gz
mv Schwl_1.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv Schwl_1.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X313_3/10X313_3_Schwl_3.fragments.tsv 10X406_5/10X406_5_Schwl_3.fragments.tsv 10X406_4/10X406_4_Schwl_3.fragments.tsv 10X315_4/10X315_4_Schwl_3.fragments.tsv 10X232_3/10X232_3_Schwl_3.fragments.tsv 10X291_3/10X291_3_Schwl_3.fragments.tsv 10X321_4/10X321_4_Schwl_3.fragments.tsv 10X346_3/10X346_3_Schwl_3.fragments.tsv 10X364_4/10X364_4_Schwl_3.fragments.tsv 10X365_4/10X365_4_Schwl_3.fragments.tsv 10X347_3/10X347_3_Schwl_3.fragments.tsv > Schwl_3.fragments.tsv
sort -k1,1 -k2,2n Schwl_3.fragments.tsv > Schwl_3.fragments.sort.tsv
macs2 callpeak -t Schwl_3.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Schwl_3
mv Schwl_3_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip Schwl_3.fragments.sort.tsv
tabix -p bed Schwl_3.fragments.sort.tsv.gz
mv Schwl_3.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv Schwl_3.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X372_1/10X372_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X340_3/10X340_3_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X316_6/10X316_6_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X232_2/10X232_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X325_6/10X325_6_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X290_2/10X290_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X291_2/10X291_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X406_5/10X406_5_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X279_1/10X279_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X315_5/10X315_5_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X321_5/10X321_5_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X369_1/10X369_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X280_2/10X280_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X286_2/10X286_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X315_3/10X315_3_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X232_1/10X232_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X406_1/10X406_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X340_1/10X340_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X250_1/10X250_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X346_2/10X346_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X279_3/10X279_3_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X315_4/10X315_4_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X365_2/10X365_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X313_2/10X313_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X250_3/10X250_3_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X280_1/10X280_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X286_1/10X286_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X280_3/10X280_3_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X279_2/10X279_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X340_2/10X340_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X402_1/10X402_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X372_4/10X372_4_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X366_1/10X366_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X291_3/10X291_3_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X315_8/10X315_8_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X347_2/10X347_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X366_2/10X366_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X340_4/10X340_4_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X372_3/10X372_3_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X407_2/10X407_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X370_1/10X370_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X242_3/10X242_3_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X250_4/10X250_4_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X242_1/10X242_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X420_1/10X420_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X312_3/10X312_3_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X290_1/10X290_1_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X406_7/10X406_7_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X317_6/10X317_6_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X321_6/10X321_6_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X366_4/10X366_4_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X242_4/10X242_4_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X250_2/10X250_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X312_4/10X312_4_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X406_2/10X406_2_Neur_Tel_Glut_SATB2_2.fragments.tsv 10X313_1/10X313_1_Neur_Tel_Glut_SATB2_2.fragments.tsv > Neur_Tel_Glut_SATB2_2.fragments.tsv
sort -k1,1 -k2,2n Neur_Tel_Glut_SATB2_2.fragments.tsv > Neur_Tel_Glut_SATB2_2.fragments.sort.tsv
macs2 callpeak -t Neur_Tel_Glut_SATB2_2.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Neur_Tel_Glut_SATB2_2
mv Neur_Tel_Glut_SATB2_2_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip Neur_Tel_Glut_SATB2_2.fragments.sort.tsv
tabix -p bed Neur_Tel_Glut_SATB2_2.fragments.sort.tsv.gz
mv Neur_Tel_Glut_SATB2_2.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv Neur_Tel_Glut_SATB2_2.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X315_2/10X315_2_Neur_MB_GABA_IPC.fragments.tsv 10X280_2/10X280_2_Neur_MB_GABA_IPC.fragments.tsv 10X279_3/10X279_3_Neur_MB_GABA_IPC.fragments.tsv 10X406_3/10X406_3_Neur_MB_GABA_IPC.fragments.tsv 10X280_3/10X280_3_Neur_MB_GABA_IPC.fragments.tsv 10X279_2/10X279_2_Neur_MB_GABA_IPC.fragments.tsv 10X232_3/10X232_3_Neur_MB_GABA_IPC.fragments.tsv 10X321_1/10X321_1_Neur_MB_GABA_IPC.fragments.tsv 10X346_1/10X346_1_Neur_MB_GABA_IPC.fragments.tsv 10X286_7/10X286_7_Neur_MB_GABA_IPC.fragments.tsv 10X242_3/10X242_3_Neur_MB_GABA_IPC.fragments.tsv 10X312_3/10X312_3_Neur_MB_GABA_IPC.fragments.tsv 10X242_4/10X242_4_Neur_MB_GABA_IPC.fragments.tsv > Neur_MB_GABA_IPC.fragments.tsv
sort -k1,1 -k2,2n Neur_MB_GABA_IPC.fragments.tsv > Neur_MB_GABA_IPC.fragments.sort.tsv
macs2 callpeak -t Neur_MB_GABA_IPC.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Neur_MB_GABA_IPC
mv Neur_MB_GABA_IPC_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip Neur_MB_GABA_IPC.fragments.sort.tsv
tabix -p bed Neur_MB_GABA_IPC.fragments.sort.tsv.gz
mv Neur_MB_GABA_IPC.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv Neur_MB_GABA_IPC.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X347_4/10X347_4_Neur_Tel_Glut_PCNA.fragments.tsv 10X346_2/10X346_2_Neur_Tel_Glut_PCNA.fragments.tsv 10X402_1/10X402_1_Neur_Tel_Glut_PCNA.fragments.tsv 10X346_3/10X346_3_Neur_Tel_Glut_PCNA.fragments.tsv 10X347_2/10X347_2_Neur_Tel_Glut_PCNA.fragments.tsv 10X346_1/10X346_1_Neur_Tel_Glut_PCNA.fragments.tsv 10X370_1/10X370_1_Neur_Tel_Glut_PCNA.fragments.tsv 10X366_4/10X366_4_Neur_Tel_Glut_PCNA.fragments.tsv > Neur_Tel_Glut_PCNA.fragments.tsv
sort -k1,1 -k2,2n Neur_Tel_Glut_PCNA.fragments.tsv > Neur_Tel_Glut_PCNA.fragments.sort.tsv
macs2 callpeak -t Neur_Tel_Glut_PCNA.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n Neur_Tel_Glut_PCNA
mv Neur_Tel_Glut_PCNA_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip Neur_Tel_Glut_PCNA.fragments.sort.tsv
tabix -p bed Neur_Tel_Glut_PCNA.fragments.sort.tsv.gz
mv Neur_Tel_Glut_PCNA.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv Neur_Tel_Glut_PCNA.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X406_5/10X406_5_VLMC_MGP_1.fragments.tsv 10X369_1/10X369_1_VLMC_MGP_1.fragments.tsv 10X315_4/10X315_4_VLMC_MGP_1.fragments.tsv 10X364_4/10X364_4_VLMC_MGP_1.fragments.tsv 10X420_3/10X420_3_VLMC_MGP_1.fragments.tsv 10X365_4/10X365_4_VLMC_MGP_1.fragments.tsv 10X370_1/10X370_1_VLMC_MGP_1.fragments.tsv > VLMC_MGP_1.fragments.tsv
sort -k1,1 -k2,2n VLMC_MGP_1.fragments.tsv > VLMC_MGP_1.fragments.sort.tsv
macs2 callpeak -t VLMC_MGP_1.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n VLMC_MGP_1
mv VLMC_MGP_1_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip VLMC_MGP_1.fragments.sort.tsv
tabix -p bed VLMC_MGP_1.fragments.sort.tsv.gz
mv VLMC_MGP_1.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv VLMC_MGP_1.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X315_4/10X315_4_VLMC_MGP_2.fragments.tsv 10X340_2/10X340_2_VLMC_MGP_2.fragments.tsv 10X364_4/10X364_4_VLMC_MGP_2.fragments.tsv 10X365_4/10X365_4_VLMC_MGP_2.fragments.tsv 10X242_4/10X242_4_VLMC_MGP_2.fragments.tsv > VLMC_MGP_2.fragments.tsv
sort -k1,1 -k2,2n VLMC_MGP_2.fragments.tsv > VLMC_MGP_2.fragments.sort.tsv
macs2 callpeak -t VLMC_MGP_2.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n VLMC_MGP_2
mv VLMC_MGP_2_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip VLMC_MGP_2.fragments.sort.tsv
tabix -p bed VLMC_MGP_2.fragments.sort.tsv.gz
mv VLMC_MGP_2.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv VLMC_MGP_2.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

cat 10X364_2/10X364_2_VLMC_SLC6A13_3.fragments.tsv 10X372_4/10X372_4_VLMC_SLC6A13_3.fragments.tsv 10X365_4/10X365_4_VLMC_SLC6A13_3.fragments.tsv > VLMC_SLC6A13_3.fragments.tsv
sort -k1,1 -k2,2n VLMC_SLC6A13_3.fragments.tsv > VLMC_SLC6A13_3.fragments.sort.tsv
macs2 callpeak -t VLMC_SLC6A13_3.fragments.sort.tsv -f BEDPE -g hs --nomodel --shift 100 --ext 200 -p 0.01 --keep-dup all -n VLMC_SLC6A13_3
mv VLMC_SLC6A13_3_peaks.narrowPeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/peaks
bgzip VLMC_SLC6A13_3.fragments.sort.tsv
tabix -p bed VLMC_SLC6A13_3.fragments.sort.tsv.gz
mv VLMC_SLC6A13_3.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads
mv VLMC_SLC6A13_3.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Fetal_Brain/inputs/reads

