#!/bin/bash
#SBATCH --time=48:00:00
#SBATCH -p normal,owners,hbfraser
#SBATCH --mem=16GB

#Can download raw .tar file from here https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE181346, will need to download locally then upload
#Metadata downloaded from here https://cells.ucsc.edu/?ds=cardiogenesis-atac+in-vivo

#Processed data downloaded and peaks obtained with the following commands
#wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE181nnn/GSE181346/suppl/GSE181346%5Fprocessed%5Fdata.tar.gz
#tar -xvf GSE181346_processed_data.tar.gz
#cd GSE181346_processed_data
#chmod 777 csv_to_np.sh
#./csv_to_np.sh

#gunzip GSM5495104_F19_v2_fragments.tsv.gz
#python sort_cells_by_celltype.py GSM5495104_F19_v2_fragments.tsv F19_v2

#gunzip GSM5495102_F6_v2_fragments.tsv.gz
#python sort_cells_by_celltype.py GSM5495102_F6_v2_fragments.tsv F6_v2

#gunzip GSM5495103_F8_v2_fragments.tsv.gz
#python sort_cells_by_celltype.py GSM5495103_F8_v2_fragments.tsv F8_v2

#cat F19_v2/*Arterial_endothelial_cells*.tsv F8_v2/*Arterial_endothelial_cells*.tsv F6_v2/*Arterial_endothelial_cells*.tsv > Arterial_endothelial_cells.tsv
#sort -k1,1 -k2,2n Arterial_endothelial_cells.tsv > Arterial_endothelial_cells.sort.tsv
#bgzip Arterial_endothelial_cells.sort.tsv
#tabix -p bed Arterial_endothelial_cells.sort.tsv.gz
#cp Arterial_endothelial_cells.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
#cp Arterial_endothelial_cells.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

#cat F19_v2/*Epicardium_cells*.tsv F8_v2/*Epicardium_cells*.tsv F6_v2/*Epicardium_cells*.tsv > Epicardium_cells.tsv
#sort -k1,1 -k2,2n Epicardium_cells.tsv > Epicardium_cells.sort.tsv
#bgzip Epicardium_cells.sort.tsv
#tabix -p bed Epicardium_cells.sort.tsv.gz
#cp Epicardium_cells.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
#cp Epicardium_cells.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

#cat F19_v2/*Lymphatic_endothelial_cells*.tsv F8_v2/*Lymphatic_endothelial_cells*.tsv F6_v2/*Lymphatic_endothelial_cells*.tsv > Lymphatic_endothelial_cells.tsv
#sort -k1,1 -k2,2n Lymphatic_endothelial_cells.tsv > Lymphatic_endothelial_cells.sort.tsv
#bgzip Lymphatic_endothelial_cells.sort.tsv
#tabix -p bed Lymphatic_endothelial_cells.sort.tsv.gz
#cp Lymphatic_endothelial_cells.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
#cp Lymphatic_endothelial_cells.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Atrial_cardiomyocyes*.tsv F8_v2/*Atrial_cardiomyocyes*.tsv F6_v2/*Atrial_cardiomyocyes*.tsv > Atrial_cardiomyocyes.tsv
sort -k1,1 -k2,2n Atrial_cardiomyocyes.tsv > Atrial_cardiomyocyes.sort.tsv
bgzip Atrial_cardiomyocyes.sort.tsv
tabix -p bed Atrial_cardiomyocyes.sort.tsv.gz
cp Atrial_cardiomyocyes.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Atrial_cardiomyocyes.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Capillary*.tsv F8_v2/*Capillary*.tsv F6_v2/*Capillary*.tsv > Capillary.tsv
sort -k1,1 -k2,2n Capillary.tsv > Capillary.sort.tsv
bgzip Capillary.sort.tsv
tabix -p bed Capillary.sort.tsv.gz
cp Capillary.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Capillary.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Cardiac_fibroblast*.tsv F8_v2/*Cardiac_fibroblast*.tsv F6_v2/*Cardiac_fibroblast*.tsv > Cardiac_fibroblast.tsv
sort -k1,1 -k2,2n Cardiac_fibroblast.tsv > Cardiac_fibroblast.sort.tsv
bgzip Cardiac_fibroblast.sort.tsv
tabix -p bed Cardiac_fibroblast.sort.tsv.gz
cp Cardiac_fibroblast.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Cardiac_fibroblast.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Cardiac_fibroblast_progenitors*.tsv F8_v2/*Cardiac_fibroblast_progenitors*.tsv F6_v2/*Cardiac_fibroblast_progenitors*.tsv > Cardiac_fibroblast_progenitors.tsv
sort -k1,1 -k2,2n Cardiac_fibroblast_progenitors.tsv > Cardiac_fibroblast_progenitors.sort.tsv
bgzip Cardiac_fibroblast_progenitors.sort.tsv
tabix -p bed Cardiac_fibroblast_progenitors.sort.tsv.gz
cp Cardiac_fibroblast_progenitors.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Cardiac_fibroblast_progenitors.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Early_cardiomyocytes*.tsv F8_v2/*Early_cardiomyocytes*.tsv F6_v2/*Early_cardiomyocytes*.tsv > Early_cardiomyocytes.tsv
sort -k1,1 -k2,2n Early_cardiomyocytes.tsv > Early_cardiomyocytes.sort.tsv
bgzip Early_cardiomyocytes.sort.tsv
tabix -p bed Early_cardiomyocytes.sort.tsv.gz
cp Early_cardiomyocytes.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Early_cardiomyocytes.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Endocardium*.tsv F8_v2/*Endocardium*.tsv F6_v2/*Endocardium*.tsv > Endocardium.tsv
sort -k1,1 -k2,2n Endocardium.tsv > Endocardium.sort.tsv
bgzip Endocardium.sort.tsv
tabix -p bed Endocardium.sort.tsv.gz
cp Endocardium.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Endocardium.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Endothelium_like_cells*.tsv F8_v2/*Endothelium_like_cells*.tsv F6_v2/*Endothelium_like_cells*.tsv > Endothelium_like_cells.tsv
sort -k1,1 -k2,2n Endothelium_like_cells.tsv > Endothelium_like_cells.sort.tsv
bgzip Endothelium_like_cells.sort.tsv
tabix -p bed Endothelium_like_cells.sort.tsv.gz
cp Endothelium_like_cells.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Endothelium_like_cells.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Fibroblast_like_cells_1*.tsv F8_v2/*Fibroblast_like_cells_1*.tsv F6_v2/*Fibroblast_like_cells_1*.tsv > Fibroblast_like_cells_1.tsv
sort -k1,1 -k2,2n Fibroblast_like_cells_1.tsv > Fibroblast_like_cells_1.sort.tsv
bgzip Fibroblast_like_cells_1.sort.tsv
tabix -p bed Fibroblast_like_cells_1.sort.tsv.gz
cp Fibroblast_like_cells_1.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Fibroblast_like_cells_1.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Fibroblast_like_cells_2*.tsv F8_v2/*Fibroblast_like_cells_2*.tsv F6_v2/*Fibroblast_like_cells_2*.tsv > Fibroblast_like_cells_2.tsv
sort -k1,1 -k2,2n Fibroblast_like_cells_2.tsv > Fibroblast_like_cells_2.sort.tsv
bgzip Fibroblast_like_cells_2.sort.tsv
tabix -p bed Fibroblast_like_cells_2.sort.tsv.gz
cp Fibroblast_like_cells_2.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Fibroblast_like_cells_2.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Neural_crest*.tsv F8_v2/*Neural_crest*.tsv F6_v2/*Neural_crest*.tsv > Neural_crest.tsv
sort -k1,1 -k2,2n Neural_crest.tsv > Neural_crest.sort.tsv
bgzip Neural_crest.sort.tsv
tabix -p bed Neural_crest.sort.tsv.gz
cp Neural_crest.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Neural_crest.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Outflow_tract_cells*.tsv F8_v2/*Outflow_tract_cells*.tsv F6_v2/*Outflow_tract_cells*.tsv > Outflow_tract_cells.tsv
sort -k1,1 -k2,2n Outflow_tract_cells.tsv > Outflow_tract_cells.sort.tsv
bgzip Outflow_tract_cells.sort.tsv
tabix -p bed Outflow_tract_cells.sort.tsv.gz
cp Outflow_tract_cells.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Outflow_tract_cells.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Pericytes*.tsv F8_v2/*Pericytes*.tsv F6_v2/*Pericytes*.tsv > Pericytes.tsv
sort -k1,1 -k2,2n Pericytes.tsv > Pericytes.sort.tsv
bgzip Pericytes.sort.tsv
tabix -p bed Pericytes.sort.tsv.gz
cp Pericytes.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Pericytes.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Smooth_muscle_cells*.tsv F8_v2/*Smooth_muscle_cells*.tsv F6_v2/*Smooth_muscle_cells*.tsv > Smooth_muscle_cells.tsv
sort -k1,1 -k2,2n Smooth_muscle_cells.tsv > Smooth_muscle_cells.sort.tsv
bgzip Smooth_muscle_cells.sort.tsv
tabix -p bed Smooth_muscle_cells.sort.tsv.gz
cp Smooth_muscle_cells.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Smooth_muscle_cells.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Veins*.tsv F8_v2/*Veins*.tsv F6_v2/*Veins*.tsv > Veins.tsv
sort -k1,1 -k2,2n Veins.tsv > Veins.sort.tsv
bgzip Veins.sort.tsv
tabix -p bed Veins.sort.tsv.gz
cp Veins.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Veins.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*Ventricular_cardiomyocytes*.tsv F8_v2/*Ventricular_cardiomyocytes*.tsv F6_v2/*Ventricular_cardiomyocytes*.tsv > Ventricular_cardiomyocytes.tsv
sort -k1,1 -k2,2n Ventricular_cardiomyocytes.tsv > Ventricular_cardiomyocytes.sort.tsv
bgzip Ventricular_cardiomyocytes.sort.tsv
tabix -p bed Ventricular_cardiomyocytes.sort.tsv.gz
cp Ventricular_cardiomyocytes.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp Ventricular_cardiomyocytes.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*preCardiac_fibroblast*.tsv F8_v2/*preCardiac_fibroblast*.tsv F6_v2/*preCardiac_fibroblast*.tsv > preCardiac_fibroblast.tsv
sort -k1,1 -k2,2n preCardiac_fibroblast.tsv > preCardiac_fibroblast.sort.tsv
bgzip preCardiac_fibroblast.sort.tsv
tabix -p bed preCardiac_fibroblast.sort.tsv.gz
cp preCardiac_fibroblast.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp preCardiac_fibroblast.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs

cat F19_v2/*preSmooth_muscle_cells*.tsv F8_v2/*preSmooth_muscle_cells*.tsv F6_v2/*preSmooth_muscle_cells*.tsv > preSmooth_muscle_cells.tsv
sort -k1,1 -k2,2n preSmooth_muscle_cells.tsv > preSmooth_muscle_cells.sort.tsv
bgzip preSmooth_muscle_cells.sort.tsv
tabix -p bed preSmooth_muscle_cells.sort.tsv.gz
cp preSmooth_muscle_cells.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
cp preSmooth_muscle_cells.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
