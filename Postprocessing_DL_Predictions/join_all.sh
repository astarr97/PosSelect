#!/bin/bash
#SBATCH --time=47:00:00
#SBATCH -p hbfraser
#SBATCH --mem=64GB
#SBATCH -c 1

#Sort files for all cell types
mkdir /scratch/users/astarr97/TempSortedDL

sort -k1,1 KosoyRoussosControlMicroglia_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/KosoyRoussosControlMicroglia_HumanDerived.sort.txt
sort -k1,1 LiangSteinNeuron_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/LiangSteinNeuron_HumanDerived.sort.txt
sort -k1,1 AdultHeartVentricularCardiomyocyte_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/AdultHeartVentricularCardiomyocyte_HumanDerived.sort.txt
sort -k1,1 AdultProximalTubule_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/AdultProximalTubule_HumanDerived.sort.txt
sort -k1,1 FetalArterialECs_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalArterialECs_HumanDerived.sort.txt
sort -k1,1 FetalChondrocytes_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalChondrocytes_HumanDerived.sort.txt
sort -k1,1 SertoliMale_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/SertoliMale_HumanDerived.sort.txt
sort -k1,1 ASCT_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/ASCT_HumanDerived.sort.txt

sort -k1,1 FetalGonadImmuneFemale_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalGonadImmuneFemale_HumanDerived.sort.txt
sort -k1,1 ITL23_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/ITL23_HumanDerived.sort.txt
sort -k1,1 AdultHeartSmoothMuscle_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/AdultHeartSmoothMuscle_HumanDerived.sort.txt
sort -k1,1 AdultLoopOfHenle_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/AdultLoopOfHenle_HumanDerived.sort.txt
sort -k1,1 FetalHeartPericytes_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalHeartPericytes_HumanDerived.sort.txt
sort -k1,1 FetalHeartCardiacFibroblasts_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalHeartCardiacFibroblasts_HumanDerived.sort.txt
sort -k1,1 preGC_IIaFemale_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/preGC_IIaFemale_HumanDerived.sort.txt
sort -k1,1 FetalBrainCOP_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalBrainCOP_HumanDerived.sort.txt

path="/scratch/users/astarr97/TempSortedDL"

sort -k1,1 KosoyRoussosControlMicroglia_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/KosoyRoussosControlMicroglia_Polymorphic.sort.txt
sort -k1,1 LiangSteinNeuron_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/LiangSteinNeuron_Polymorphic.sort.txt
sort -k1,1 AdultHeartVentricularCardiomyocyte_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/AdultHeartVentricularCardiomyocyte_Polymorphic.sort.txt
sort -k1,1 AdultProximalTubule_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/AdultProximalTubule_Polymorphic.sort.txt
sort -k1,1 FetalArterialECs_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/FetalArterialECs_Polymorphic.sort.txt
sort -k1,1 FetalChondrocytes_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/FetalChondrocytes_Polymorphic.sort.txt
sort -k1,1 SertoliMale_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/SertoliMale_Polymorphic.sort.txt
sort -k1,1 ASCT_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/ASCT_Polymorphic.sort.txt

sort -k1,1 FetalGonadImmuneFemale_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/FetalGonadImmuneFemale_Polymorphic.sort.txt
sort -k1,1 ITL23_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/ITL23_Polymorphic.sort.txt
sort -k1,1 AdultHeartSmoothMuscle_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/AdultHeartSmoothMuscle_Polymorphic.sort.txt
sort -k1,1 AdultLoopOfHenle_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/AdultLoopOfHenle_Polymorphic.sort.txt
sort -k1,1 FetalHeartPericytes_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/FetalHeartPericytes_Polymorphic.sort.txt
sort -k1,1 FetalHeartCardiacFibroblasts_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/FetalHeartCardiacFibroblasts_Polymorphic.sort.txt
sort -k1,1 preGC_IIaFemale_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/preGC_IIaFemale_Polymorphic.sort.txt
sort -k1,1 FetalBrainCOP_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/FetalBrainCOP_Polymorphic.sort.txt

path="/scratch/users/astarr97/TempSortedDL"

sort -k1,1 KosoyRoussosControlMicroglia_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/KosoyRoussosControlMicroglia_ChimpDerived.sort.txt
sort -k1,1 LiangSteinNeuron_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/LiangSteinNeuron_ChimpDerived.sort.txt
sort -k1,1 AdultHeartVentricularCardiomyocyte_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/AdultHeartVentricularCardiomyocyte_ChimpDerived.sort.txt
sort -k1,1 AdultProximalTubule_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/AdultProximalTubule_ChimpDerived.sort.txt
sort -k1,1 FetalArterialECs_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalArterialECs_ChimpDerived.sort.txt
sort -k1,1 FetalChondrocytes_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalChondrocytes_ChimpDerived.sort.txt
sort -k1,1 SertoliMale_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/SertoliMale_ChimpDerived.sort.txt
sort -k1,1 ASCT_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/ASCT_ChimpDerived.sort.txt

sort -k1,1 FetalGonadImmuneFemale_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalGonadImmuneFemale_ChimpDerived.sort.txt
sort -k1,1 ITL23_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/ITL23_ChimpDerived.sort.txt
sort -k1,1 AdultHeartSmoothMuscle_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/AdultHeartSmoothMuscle_ChimpDerived.sort.txt
sort -k1,1 AdultLoopOfHenle_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/AdultLoopOfHenle_ChimpDerived.sort.txt
sort -k1,1 FetalHeartPericytes_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalHeartPericytes_ChimpDerived.sort.txt
sort -k1,1 FetalHeartCardiacFibroblasts_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalHeartCardiacFibroblasts_ChimpDerived.sort.txt
sort -k1,1 preGC_IIaFemale_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/preGC_IIaFemale_ChimpDerived.sort.txt
sort -k1,1 FetalBrainCOP_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalBrainCOP_ChimpDerived.sort.txt

path="/scratch/users/astarr97/TempSortedDL"

#Normalize the files
python normalize.py

paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt LiangSteinNeuron_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt ITL23_HumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt LiangSteinNeuron_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Polymorphic_Normed_Temp1.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt ITL23_Polymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Polymorphic_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt LiangSteinNeuron_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt ITL23_ChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Normed_Temp2.txt

cd $path

grep chr All_DL_ChimpDerived_Normed_Temp1.txt > All_DL_ChimpDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_ChimpDerived_Normed_Temp1.fix.txt > All_DL_ChimpDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1.txt All_DL_ChimpDerived_Normed_Temp1.fixed.txt > All_DL_ChimpDerived_Normed_Temp1.ready.txt

grep chr All_DL_HumanDerived_Normed_Temp1.txt > All_DL_HumanDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_HumanDerived_Normed_Temp1.fix.txt > All_DL_HumanDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1.txt All_DL_HumanDerived_Normed_Temp1.fixed.txt > All_DL_HumanDerived_Normed_Temp1.ready.txt

grep chr All_DL_Polymorphic_Normed_Temp1.txt > All_DL_Polymorphic_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Polymorphic_Normed_Temp1.fix.txt > All_DL_Polymorphic_Normed_Temp1.fixed.txt
cat columns_normed_Temp1.txt All_DL_Polymorphic_Normed_Temp1.fixed.txt > All_DL_Polymorphic_Normed_Temp1.ready.txt

grep chr All_DL_ChimpDerived_Normed_Temp2.txt > All_DL_ChimpDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_ChimpDerived_Normed_Temp2.fix.txt > All_DL_ChimpDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2.txt All_DL_ChimpDerived_Normed_Temp2.fixed.txt > All_DL_ChimpDerived_Normed_Temp2.ready.txt

grep chr All_DL_HumanDerived_Normed_Temp2.txt > All_DL_HumanDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_HumanDerived_Normed_Temp2.fix.txt > All_DL_HumanDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2.txt All_DL_HumanDerived_Normed_Temp2.fixed.txt > All_DL_HumanDerived_Normed_Temp2.ready.txt

grep chr All_DL_Polymorphic_Normed_Temp2.txt > All_DL_Polymorphic_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Polymorphic_Normed_Temp2.fix.txt > All_DL_Polymorphic_Normed_Temp2.fixed.txt
cat columns_normed_Temp2.txt All_DL_Polymorphic_Normed_Temp2.fixed.txt > All_DL_Polymorphic_Normed_Temp2.ready.txt

#For swapping adult cortical neurons and fetal cortical neurons
paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt ITL23_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Normed_Temp1_SwapNeur.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt LiangSteinNeuron_HumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Normed_Temp2_SwapNeur.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt ITL23_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Polymorphic_Normed_Temp1_SwapNeur.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt LiangSteinNeuron_Polymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Polymorphic_Normed_Temp2_SwapNeur.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt ITL23_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Normed_Temp1_SwapNeur.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt LiangSteinNeuron_ChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Normed_Temp2_SwapNeur.txt

cd $path

grep chr All_DL_ChimpDerived_Normed_Temp1_SwapNeur.txt > All_DL_ChimpDerived_Normed_Temp1_SwapNeur.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_ChimpDerived_Normed_Temp1_SwapNeur.fix.txt > All_DL_ChimpDerived_Normed_Temp1_SwapNeur.fixed.txt
cat columns_normed_Temp1_SwapNeur.txt All_DL_ChimpDerived_Normed_Temp1_SwapNeur.fixed.txt > All_DL_ChimpDerived_Normed_Temp1_SwapNeur.ready.txt

grep chr All_DL_HumanDerived_Normed_Temp1_SwapNeur.txt > All_DL_HumanDerived_Normed_Temp1_SwapNeur.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_HumanDerived_Normed_Temp1_SwapNeur.fix.txt > All_DL_HumanDerived_Normed_Temp1_SwapNeur.fixed.txt
cat columns_normed_Temp1_SwapNeur.txt All_DL_HumanDerived_Normed_Temp1_SwapNeur.fixed.txt > All_DL_HumanDerived_Normed_Temp1_SwapNeur.ready.txt

grep chr All_DL_Polymorphic_Normed_Temp1_SwapNeur.txt > All_DL_Polymorphic_Normed_Temp1_SwapNeur.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Polymorphic_Normed_Temp1_SwapNeur.fix.txt > All_DL_Polymorphic_Normed_Temp1_SwapNeur.fixed.txt
cat columns_normed_Temp1_SwapNeur.txt All_DL_Polymorphic_Normed_Temp1_SwapNeur.fixed.txt > All_DL_Polymorphic_Normed_Temp1_SwapNeur.ready.txt

grep chr All_DL_ChimpDerived_Normed_Temp2_SwapNeur.txt > All_DL_ChimpDerived_Normed_Temp2_SwapNeur.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_ChimpDerived_Normed_Temp2_SwapNeur.fix.txt > All_DL_ChimpDerived_Normed_Temp2_SwapNeur.fixed.txt
cat columns_normed_Temp2_SwapNeur.txt All_DL_ChimpDerived_Normed_Temp2_SwapNeur.fixed.txt > All_DL_ChimpDerived_Normed_Temp2_SwapNeur.ready.txt

grep chr All_DL_HumanDerived_Normed_Temp2_SwapNeur.txt > All_DL_HumanDerived_Normed_Temp2_SwapNeur.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_HumanDerived_Normed_Temp2_SwapNeur.fix.txt > All_DL_HumanDerived_Normed_Temp2_SwapNeur.fixed.txt
cat columns_normed_Temp2_SwapNeur.txt All_DL_HumanDerived_Normed_Temp2_SwapNeur.fixed.txt > All_DL_HumanDerived_Normed_Temp2_SwapNeur.ready.txt

grep chr All_DL_Polymorphic_Normed_Temp2_SwapNeur.txt > All_DL_Polymorphic_Normed_Temp2_SwapNeur.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Polymorphic_Normed_Temp2_SwapNeur.fix.txt > All_DL_Polymorphic_Normed_Temp2_SwapNeur.fixed.txt
cat columns_normed_Temp2_SwapNeur.txt All_DL_Polymorphic_Normed_Temp2_SwapNeur.fixed.txt > All_DL_Polymorphic_Normed_Temp2_SwapNeur.ready.txt

#For adding additional neuron types to test

path="/scratch/users/astarr97/TempSortedDL"

sort -k1,1 FetalBrainNeurPurkinje_6_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalBrainNeurPurkinje_6_HumanDerived.sort.txt
sort -k1,1 FetalBrainNeurPurkinje_6_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/FetalBrainNeurPurkinje_6_Polymorphic.sort.txt
sort -k1,1 FetalBrainNeurPurkinje_6_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalBrainNeurPurkinje_6_ChimpDerived.sort.txt

sort -k1,1 FetalBrainNeurDAergic_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalBrainNeurDAergic_HumanDerived.sort.txt
sort -k1,1 FetalBrainNeurDAergic_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/FetalBrainNeurDAergic_Polymorphic.sort.txt
sort -k1,1 FetalBrainNeurDAergic_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/FetalBrainNeurDAergic_ChimpDerived.sort.txt

sort -k1,1 PVALB_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/PVALB_HumanDerived.sort.txt
sort -k1,1 PVALB_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/PVALB_Polymorphic.sort.txt
sort -k1,1 PVALB_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/PVALB_ChimpDerived.sort.txt

sort -k1,1 D1Pu_HumanDerived.txt > /scratch/users/astarr97/TempSortedDL/D1Pu_HumanDerived.sort.txt
sort -k1,1 D1Pu_Polymorphic.txt > /scratch/users/astarr97/TempSortedDL/D1Pu_Polymorphic.sort.txt
sort -k1,1 D1Pu_ChimpDerived.txt > /scratch/users/astarr97/TempSortedDL/D1Pu_ChimpDerived.sort.txt

#For Purkinje
paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt FetalBrainNeurPurkinje_6_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_HumanDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt FetalBrainNeurPurkinje_6HumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_HumanDerived_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt FetalBrainNeurPurkinje_6_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_Polymorphic_Normed_Temp1.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt FetalBrainNeurPurkinje_6Polymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_Polymorphic_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt FetalBrainNeurPurkinje_6_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_ChimpDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainNeurPurkinje_6ChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_ChimpDerived_Normed_Temp2.txt

#For Dopaminergic
paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt FetalBrainNeurDAergic_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_HumanDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt FetalBrainNeurDAergicHumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_HumanDerived_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt FetalBrainNeurDAergic_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_Polymorphic_Normed_Temp1.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt FetalBrainNeurDAergicPolymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_Polymorphic_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt FetalBrainNeurDAergic_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_ChimpDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainNeurDAergicChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_ChimpDerived_Normed_Temp2.txt

#For PVALB
paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt PVALB_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_HumanDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt PVALBHumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_HumanDerived_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt PVALB_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_Polymorphic_Normed_Temp1.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt PVALBPolymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_Polymorphic_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt PVALB_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_ChimpDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt PVALBChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_ChimpDerived_Normed_Temp2.txt

#For D1Pu
paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt D1Pu_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_HumanDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt D1PuHumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_HumanDerived_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt D1Pu_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_Polymorphic_Normed_Temp1.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt D1PuPolymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_Polymorphic_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt D1Pu_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_ChimpDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt D1PuChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_ChimpDerived_Normed_Temp2.txt

cd $path

grep chr All_DL_Purkinje_ChimpDerived_Normed_Temp1.txt > All_DL_Purkinje_ChimpDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Purkinje_ChimpDerived_Normed_Temp1.fix.txt > All_DL_Purkinje_ChimpDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_FetalBrainNeurPurkinje_6.txt All_DL_Purkinje_ChimpDerived_Normed_Temp1.fixed.txt > All_DL_Purkinje_ChimpDerived_Normed_Temp1.ready.txt

grep chr All_DL_Purkinje_HumanDerived_Normed_Temp1.txt > All_DL_Purkinje_HumanDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Purkinje_HumanDerived_Normed_Temp1.fix.txt > All_DL_Purkinje_HumanDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_FetalBrainNeurPurkinje_6.txt All_DL_Purkinje_HumanDerived_Normed_Temp1.fixed.txt > All_DL_Purkinje_HumanDerived_Normed_Temp1.ready.txt

grep chr All_DL_Purkinje_Polymorphic_Normed_Temp1.txt > All_DL_Purkinje_Polymorphic_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Purkinje_Polymorphic_Normed_Temp1.fix.txt > All_DL_Purkinje_Polymorphic_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_FetalBrainNeurPurkinje_6.txt All_DL_Purkinje_Polymorphic_Normed_Temp1.fixed.txt > All_DL_Purkinje_Polymorphic_Normed_Temp1.ready.txt

grep chr All_DL_Purkinje_ChimpDerived_Normed_Temp2.txt > All_DL_Purkinje_ChimpDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Purkinje_ChimpDerived_Normed_Temp2.fix.txt > All_DL_Purkinje_ChimpDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_FetalBrainNeurPurkinje_6.txt All_DL_Purkinje_ChimpDerived_Normed_Temp2.fixed.txt > All_DL_Purkinje_ChimpDerived_Normed_Temp2.ready.txt

grep chr All_DL_Purkinje_HumanDerived_Normed_Temp2.txt > All_DL_Purkinje_HumanDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Purkinje_HumanDerived_Normed_Temp2.fix.txt > All_DL_Purkinje_HumanDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_FetalBrainNeurPurkinje_6.txt All_DL_Purkinje_HumanDerived_Normed_Temp2.fixed.txt > All_DL_Purkinje_HumanDerived_Normed_Temp2.ready.txt

grep chr All_DL_Purkinje_Polymorphic_Normed_Temp2.txt > All_DL_Purkinje_Polymorphic_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_Purkinje_Polymorphic_Normed_Temp2.fix.txt > All_DL_Purkinje_Polymorphic_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_FetalBrainNeurPurkinje_6.txt All_DL_Purkinje_Polymorphic_Normed_Temp2.fixed.txt > All_DL_Purkinje_Polymorphic_Normed_Temp2.ready.txt

grep chr All_DL_DAergic_ChimpDerived_Normed_Temp1.txt > All_DL_DAergic_ChimpDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_DAergic_ChimpDerived_Normed_Temp1.fix.txt > All_DL_DAergic_ChimpDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_FetalBrainNeurDAergic.txt All_DL_DAergic_ChimpDerived_Normed_Temp1.fixed.txt > All_DL_DAergic_ChimpDerived_Normed_Temp1.ready.txt

grep chr All_DL_DAergic_HumanDerived_Normed_Temp1.txt > All_DL_DAergic_HumanDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_DAergic_HumanDerived_Normed_Temp1.fix.txt > All_DL_DAergic_HumanDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_FetalBrainNeurDAergic.txt All_DL_DAergic_HumanDerived_Normed_Temp1.fixed.txt > All_DL_DAergic_HumanDerived_Normed_Temp1.ready.txt

grep chr All_DL_DAergic_Polymorphic_Normed_Temp1.txt > All_DL_DAergic_Polymorphic_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_DAergic_Polymorphic_Normed_Temp1.fix.txt > All_DL_DAergic_Polymorphic_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_FetalBrainNeurDAergic.txt All_DL_DAergic_Polymorphic_Normed_Temp1.fixed.txt > All_DL_DAergic_Polymorphic_Normed_Temp1.ready.txt

grep chr All_DL_DAergic_ChimpDerived_Normed_Temp2.txt > All_DL_DAergic_ChimpDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_DAergic_ChimpDerived_Normed_Temp2.fix.txt > All_DL_DAergic_ChimpDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_FetalBrainNeurDAergic.txt All_DL_DAergic_ChimpDerived_Normed_Temp2.fixed.txt > All_DL_DAergic_ChimpDerived_Normed_Temp2.ready.txt

grep chr All_DL_DAergic_HumanDerived_Normed_Temp2.txt > All_DL_DAergic_HumanDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_DAergic_HumanDerived_Normed_Temp2.fix.txt > All_DL_DAergic_HumanDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_FetalBrainNeurDAergic.txt All_DL_DAergic_HumanDerived_Normed_Temp2.fixed.txt > All_DL_DAergic_HumanDerived_Normed_Temp2.ready.txt

grep chr All_DL_DAergic_Polymorphic_Normed_Temp2.txt > All_DL_DAergic_Polymorphic_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_DAergic_Polymorphic_Normed_Temp2.fix.txt > All_DL_DAergic_Polymorphic_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_FetalBrainNeurDAergic.txt All_DL_DAergic_Polymorphic_Normed_Temp2.fixed.txt > All_DL_DAergic_Polymorphic_Normed_Temp2.ready.txt

grep chr All_DL_PVALB_ChimpDerived_Normed_Temp1.txt > All_DL_PVALB_ChimpDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_PVALB_ChimpDerived_Normed_Temp1.fix.txt > All_DL_PVALB_ChimpDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_PVALB.txt All_DL_PVALB_ChimpDerived_Normed_Temp1.fixed.txt > All_DL_PVALB_ChimpDerived_Normed_Temp1.ready.txt

grep chr All_DL_PVALB_HumanDerived_Normed_Temp1.txt > All_DL_PVALB_HumanDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_PVALB_HumanDerived_Normed_Temp1.fix.txt > All_DL_PVALB_HumanDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_PVALB.txt All_DL_PVALB_HumanDerived_Normed_Temp1.fixed.txt > All_DL_PVALB_HumanDerived_Normed_Temp1.ready.txt

grep chr All_DL_PVALB_Polymorphic_Normed_Temp1.txt > All_DL_PVALB_Polymorphic_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_PVALB_Polymorphic_Normed_Temp1.fix.txt > All_DL_PVALB_Polymorphic_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_PVALB.txt All_DL_PVALB_Polymorphic_Normed_Temp1.fixed.txt > All_DL_PVALB_Polymorphic_Normed_Temp1.ready.txt

grep chr All_DL_PVALB_ChimpDerived_Normed_Temp2.txt > All_DL_PVALB_ChimpDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_PVALB_ChimpDerived_Normed_Temp2.fix.txt > All_DL_PVALB_ChimpDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_PVALB.txt All_DL_PVALB_ChimpDerived_Normed_Temp2.fixed.txt > All_DL_PVALB_ChimpDerived_Normed_Temp2.ready.txt

grep chr All_DL_PVALB_HumanDerived_Normed_Temp2.txt > All_DL_PVALB_HumanDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_PVALB_HumanDerived_Normed_Temp2.fix.txt > All_DL_PVALB_HumanDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_PVALB.txt All_DL_PVALB_HumanDerived_Normed_Temp2.fixed.txt > All_DL_PVALB_HumanDerived_Normed_Temp2.ready.txt

grep chr All_DL_PVALB_Polymorphic_Normed_Temp2.txt > All_DL_PVALB_Polymorphic_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_PVALB_Polymorphic_Normed_Temp2.fix.txt > All_DL_PVALB_Polymorphic_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_PVALB.txt All_DL_PVALB_Polymorphic_Normed_Temp2.fixed.txt > All_DL_PVALB_Polymorphic_Normed_Temp2.ready.txt

grep chr All_DL_D1Pu_ChimpDerived_Normed_Temp1.txt > All_DL_D1Pu_ChimpDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_D1Pu_ChimpDerived_Normed_Temp1.fix.txt > All_DL_D1Pu_ChimpDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_D1Pu.txt All_DL_D1Pu_ChimpDerived_Normed_Temp1.fixed.txt > All_DL_D1Pu_ChimpDerived_Normed_Temp1.ready.txt

grep chr All_DL_D1Pu_HumanDerived_Normed_Temp1.txt > All_DL_D1Pu_HumanDerived_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_D1Pu_HumanDerived_Normed_Temp1.fix.txt > All_DL_D1Pu_HumanDerived_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_D1Pu.txt All_DL_D1Pu_HumanDerived_Normed_Temp1.fixed.txt > All_DL_D1Pu_HumanDerived_Normed_Temp1.ready.txt

grep chr All_DL_D1Pu_Polymorphic_Normed_Temp1.txt > All_DL_D1Pu_Polymorphic_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_D1Pu_Polymorphic_Normed_Temp1.fix.txt > All_DL_D1Pu_Polymorphic_Normed_Temp1.fixed.txt
cat columns_normed_Temp1_D1Pu.txt All_DL_D1Pu_Polymorphic_Normed_Temp1.fixed.txt > All_DL_D1Pu_Polymorphic_Normed_Temp1.ready.txt

grep chr All_DL_D1Pu_ChimpDerived_Normed_Temp2.txt > All_DL_D1Pu_ChimpDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_D1Pu_ChimpDerived_Normed_Temp2.fix.txt > All_DL_D1Pu_ChimpDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_D1Pu.txt All_DL_D1Pu_ChimpDerived_Normed_Temp2.fixed.txt > All_DL_D1Pu_ChimpDerived_Normed_Temp2.ready.txt

grep chr All_DL_D1Pu_HumanDerived_Normed_Temp2.txt > All_DL_D1Pu_HumanDerived_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_D1Pu_HumanDerived_Normed_Temp2.fix.txt > All_DL_D1Pu_HumanDerived_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_D1Pu.txt All_DL_D1Pu_HumanDerived_Normed_Temp2.fixed.txt > All_DL_D1Pu_HumanDerived_Normed_Temp2.ready.txt

grep chr All_DL_D1Pu_Polymorphic_Normed_Temp2.txt > All_DL_D1Pu_Polymorphic_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' All_DL_D1Pu_Polymorphic_Normed_Temp2.fix.txt > All_DL_D1Pu_Polymorphic_Normed_Temp2.fixed.txt
cat columns_normed_Temp2_D1Pu.txt All_DL_D1Pu_Polymorphic_Normed_Temp2.fixed.txt > All_DL_D1Pu_Polymorphic_Normed_Temp2.ready.txt
