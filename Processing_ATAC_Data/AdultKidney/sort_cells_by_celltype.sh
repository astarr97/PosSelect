#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH -p hbfraser
#SBATCH --mem=128GB
#SBATCH -c 1

#Downloaded the ArchR arrow files from https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE262931
#Read in the Save file with ArchR with below command, then wrote out the table
#proj <- readRDS("/scratch/users/astarr97/Adult_Kidney/GSE262931_ArchR_project/ArchR_project/Save-ArchR-Project.rds")
#write.table(proj@cellColData, file = "/scratch/users/astarr97/Adult_Kidney/CellTypesAdultKidney.txt", sep = "\t", quote = FALSE)

#We determined that:
#200131cortex is Donor 1 cortex
#200317cortex is Donor 2 cortex
#200317medulla is Donor 2 medulla
#200707cortex is Donor 3 cortex
#200707medulla is Donor 3 medulla

python sort_cells_by_celltype.py GSM8181664_Donor1_cortex_fragments.tsv 200131cortex
python sort_cells_by_celltype.py GSM8181665_Donor2_cortex_fragments.tsv 200317cortex
python sort_cells_by_celltype.py GSM8181666_Donor2_medulla_fragments.tsv 200317medulla
python sort_cells_by_celltype.py GSM8181667_Donor3_cortex_fragments.tsv 200707cortex
python sort_cells_by_celltype.py GSM8181668_Donor3_medulla_fragments.tsv 200707medulla

cat 200131cortex/200131cortex_Proximal_Tubule.fragments.tsv 200317cortex/200317cortex_Proximal_Tubule.fragments.tsv 200317medulla/200317medulla_Proximal_Tubule.fragments.tsv 200707cortex/200707cortex_Proximal_Tubule.fragments.tsv 200707medulla/200707medulla_Proximal_Tubule.fragments.tsv > Proximal_Tubule.fragments.tsv
sort -k1,1 -k2,2n Proximal_Tubule.fragments.tsv > Proximal_Tubule.fragments.sort.tsv
bgzip Proximal_Tubule.fragments.sort.tsv
tabix -p bed Proximal_Tubule.fragments.sort.tsv.gz
mv Proximal_Tubule.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads
mv Proximal_Tubule.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads

cat 200131cortex/200131cortex_CFH.fragments.tsv 200317cortex/200317cortex_CFH.fragments.tsv 200317medulla/200317medulla_CFH.fragments.tsv 200707cortex/200707cortex_CFH.fragments.tsv 200707medulla/200707medulla_CFH.fragments.tsv > CFH.fragments.tsv
sort -k1,1 -k2,2n CFH.fragments.tsv > CFH.fragments.sort.tsv
bgzip CFH.fragments.sort.tsv
tabix -p bed CFH.fragments.sort.tsv.gz
mv CFH.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads
mv CFH.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads

cat 200131cortex/200131cortex_Tcell.fragments.tsv 200317cortex/200317cortex_Tcell.fragments.tsv 200317medulla/200317medulla_Tcell.fragments.tsv 200707cortex/200707cortex_Tcell.fragments.tsv 200707medulla/200707medulla_Tcell.fragments.tsv > Tcell.fragments.tsv
sort -k1,1 -k2,2n Tcell.fragments.tsv > Tcell.fragments.sort.tsv
bgzip Tcell.fragments.sort.tsv
tabix -p bed Tcell.fragments.sort.tsv.gz
mv Tcell.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads
mv Tcell.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads

cat 200131cortex/200131cortex_Loop_of_Henle.fragments.tsv 200317cortex/200317cortex_Loop_of_Henle.fragments.tsv 200317medulla/200317medulla_Loop_of_Henle.fragments.tsv 200707cortex/200707cortex_Loop_of_Henle.fragments.tsv 200707medulla/200707medulla_Loop_of_Henle.fragments.tsv > Loop_of_Henle.fragments.tsv
sort -k1,1 -k2,2n Loop_of_Henle.fragments.tsv > Loop_of_Henle.fragments.sort.tsv
bgzip Loop_of_Henle.fragments.sort.tsv
tabix -p bed Loop_of_Henle.fragments.sort.tsv.gz
mv Loop_of_Henle.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads
mv Loop_of_Henle.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads

cat 200131cortex/200131cortex_Distal_Tubule.fragments.tsv 200317cortex/200317cortex_Distal_Tubule.fragments.tsv 200317medulla/200317medulla_Distal_Tubule.fragments.tsv 200707cortex/200707cortex_Distal_Tubule.fragments.tsv 200707medulla/200707medulla_Distal_Tubule.fragments.tsv > Distal_Tubule.fragments.tsv
sort -k1,1 -k2,2n Distal_Tubule.fragments.tsv > Distal_Tubule.fragments.sort.tsv
bgzip Distal_Tubule.fragments.sort.tsv
tabix -p bed Distal_Tubule.fragments.sort.tsv.gz
mv Distal_Tubule.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads
mv Distal_Tubule.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads

cat 200131cortex/200131cortex_Collecting_Duct_Intercalated_Cell.fragments.tsv 200317cortex/200317cortex_Collecting_Duct_Intercalated_Cell.fragments.tsv 200317medulla/200317medulla_Collecting_Duct_Intercalated_Cell.fragments.tsv 200707cortex/200707cortex_Collecting_Duct_Intercalated_Cell.fragments.tsv 200707medulla/200707medulla_Collecting_Duct_Intercalated_Cell.fragments.tsv > Collecting_Duct_Intercalated_Cell.fragments.tsv
sort -k1,1 -k2,2n Collecting_Duct_Intercalated_Cell.fragments.tsv > Collecting_Duct_Intercalated_Cell.fragments.sort.tsv
bgzip Collecting_Duct_Intercalated_Cell.fragments.sort.tsv
tabix -p bed Collecting_Duct_Intercalated_Cell.fragments.sort.tsv.gz
mv Collecting_Duct_Intercalated_Cell.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads
mv Collecting_Duct_Intercalated_Cell.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads

cat 200131cortex/200131cortex_Endothelium.fragments.tsv 200317cortex/200317cortex_Endothelium.fragments.tsv 200317medulla/200317medulla_Endothelium.fragments.tsv 200707cortex/200707cortex_Endothelium.fragments.tsv 200707medulla/200707medulla_Endothelium.fragments.tsv > Endothelium.fragments.tsv
sort -k1,1 -k2,2n Endothelium.fragments.tsv > Endothelium.fragments.sort.tsv
bgzip Endothelium.fragments.sort.tsv
tabix -p bed Endothelium.fragments.sort.tsv.gz
mv Endothelium.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads
mv Endothelium.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads

cat 200131cortex/200131cortex_Stromal_Cell.fragments.tsv 200317cortex/200317cortex_Stromal_Cell.fragments.tsv 200317medulla/200317medulla_Stromal_Cell.fragments.tsv 200707cortex/200707cortex_Stromal_Cell.fragments.tsv 200707medulla/200707medulla_Stromal_Cell.fragments.tsv > Stromal_Cell.fragments.tsv
sort -k1,1 -k2,2n Stromal_Cell.fragments.tsv > Stromal_Cell.fragments.sort.tsv
bgzip Stromal_Cell.fragments.sort.tsv
tabix -p bed Stromal_Cell.fragments.sort.tsv.gz
mv Stromal_Cell.fragments.sort.tsv.gz /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads
mv Stromal_Cell.fragments.sort.tsv.gz.tbi /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Adult_Kidney/inputs/reads

