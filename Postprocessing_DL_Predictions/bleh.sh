#!/bin/bash
#SBATCH --time=96:00:00
#SBATCH -p hbfraser
#SBATCH --mem=64GB
#SBATCH -c 1


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

python normalize4.py

#For Purkinje
paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt FetalBrainNeurPurkinje_6_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_HumanDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt FetalBrainNeurPurkinje_6_HumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_HumanDerived_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt FetalBrainNeurPurkinje_6_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_Polymorphic_Normed_Temp1.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt FetalBrainNeurPurkinje_6_Polymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_Polymorphic_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt FetalBrainNeurPurkinje_6_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_ChimpDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainNeurPurkinje_6_ChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_Purkinje_ChimpDerived_Normed_Temp2.txt

#For Dopaminergic
paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt FetalBrainNeurDAergic_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_HumanDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt FetalBrainNeurDAergic_HumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_HumanDerived_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt FetalBrainNeurDAergic_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_Polymorphic_Normed_Temp1.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt FetalBrainNeurDAergic_Polymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_Polymorphic_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt FetalBrainNeurDAergic_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_ChimpDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainNeurDAergic_ChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_DAergic_ChimpDerived_Normed_Temp2.txt

#For PVALB
paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt PVALB_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_HumanDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt PVALB_HumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_HumanDerived_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt PVALB_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_Polymorphic_Normed_Temp1.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt PVALB_Polymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_Polymorphic_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt PVALB_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_ChimpDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt PVALB_ChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_PVALB_ChimpDerived_Normed_Temp2.txt

#For D1Pu
paste KosoyRoussosControlMicroglia_HumanDerived.fixed.normed.sort.txt D1Pu_HumanDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived.fixed.normed.sort.txt AdultProximalTubule_HumanDerived.fixed.normed.sort.txt FetalArterialECs_HumanDerived.fixed.normed.sort.txt FetalChondrocytes_HumanDerived.fixed.normed.sort.txt SertoliMale_HumanDerived.fixed.normed.sort.txt ASCT_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_HumanDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived.fixed.normed.sort.txt D1Pu_HumanDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived.fixed.normed.sort.txt FetalBrainCOP_HumanDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_HumanDerived_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_Polymorphic.fixed.normed.sort.txt D1Pu_Polymorphic.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_Polymorphic.fixed.normed.sort.txt AdultProximalTubule_Polymorphic.fixed.normed.sort.txt FetalArterialECs_Polymorphic.fixed.normed.sort.txt FetalChondrocytes_Polymorphic.fixed.normed.sort.txt SertoliMale_Polymorphic.fixed.normed.sort.txt ASCT_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_Polymorphic_Normed_Temp1.txt

paste FetalGonadImmuneFemale_Polymorphic.fixed.normed.sort.txt D1Pu_Polymorphic.fixed.normed.sort.txt AdultHeartSmoothMuscle_Polymorphic.fixed.normed.sort.txt AdultLoopOfHenle_Polymorphic.fixed.normed.sort.txt FetalHeartPericytes_Polymorphic.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_Polymorphic.fixed.normed.sort.txt preGC_IIaFemale_Polymorphic.fixed.normed.sort.txt FetalBrainCOP_Polymorphic.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_Polymorphic_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived.fixed.normed.sort.txt D1Pu_ChimpDerived.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived.fixed.normed.sort.txt FetalArterialECs_ChimpDerived.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived.fixed.normed.sort.txt SertoliMale_ChimpDerived.fixed.normed.sort.txt ASCT_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_ChimpDerived_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived.fixed.normed.sort.txt D1Pu_ChimpDerived.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_D1Pu_ChimpDerived_Normed_Temp2.txt

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
