#!/bin/bash
#SBATCH --time=47:00:00
#SBATCH -p hbfraser
#SBATCH --mem=64GB
#SBATCH -c 1

path="/scratch/users/astarr97/TempSortedDL/"

for file in *Derived_Chpreffed.txt;
do
    echo ${file::-4}.fix.txt
    grep chr $file > ${file::-4}.fix.txt
    cat header.txt ${file::-4}.fix.txt > ${file::-4}.fixed.txt
done

python normalize_chpreffed.py

paste KosoyRoussosControlMicroglia_HumanDerived_Chpreffed.fixed.normed.sort.txt LiangSteinNeuron_HumanDerived_Chpreffed.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_HumanDerived_Chpreffed.fixed.normed.sort.txt AdultProximalTubule_HumanDerived_Chpreffed.fixed.normed.sort.txt FetalArterialECs_HumanDerived_Chpreffed.fixed.normed.sort.txt FetalChondrocytes_HumanDerived_Chpreffed.fixed.normed.sort.txt SertoliMale_HumanDerived_Chpreffed.fixed.normed.sort.txt ASCT_HumanDerived_Chpreffed.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp1.txt

paste FetalGonadImmuneFemale_HumanDerived_Chpreffed.fixed.normed.sort.txt ITL23_HumanDerived_Chpreffed.fixed.normed.sort.txt AdultHeartSmoothMuscle_HumanDerived_Chpreffed.fixed.normed.sort.txt AdultLoopOfHenle_HumanDerived_Chpreffed.fixed.normed.sort.txt FetalHeartPericytes_HumanDerived_Chpreffed.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_HumanDerived_Chpreffed.fixed.normed.sort.txt preGC_IIaFemale_HumanDerived_Chpreffed.fixed.normed.sort.txt FetalBrainCOP_HumanDerived_Chpreffed.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp2.txt

paste KosoyRoussosControlMicroglia_ChimpDerived_Chpreffed.fixed.normed.sort.txt LiangSteinNeuron_ChimpDerived_Chpreffed.fixed.normed.sort.txt AdultHeartVentricularCardiomyocyte_ChimpDerived_Chpreffed.fixed.normed.sort.txt AdultProximalTubule_ChimpDerived_Chpreffed.fixed.normed.sort.txt FetalArterialECs_ChimpDerived_Chpreffed.fixed.normed.sort.txt FetalChondrocytes_ChimpDerived_Chpreffed.fixed.normed.sort.txt SertoliMale_ChimpDerived_Chpreffed.fixed.normed.sort.txt ASCT_ChimpDerived_Chpreffed.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp1.txt

paste FetalGonadImmuneFemale_ChimpDerived_Chpreffed.fixed.normed.sort.txt ITL23_ChimpDerived_Chpreffed.fixed.normed.sort.txt AdultHeartSmoothMuscle_ChimpDerived_Chpreffed.fixed.normed.sort.txt AdultLoopOfHenle_ChimpDerived_Chpreffed.fixed.normed.sort.txt FetalHeartPericytes_ChimpDerived_Chpreffed.fixed.normed.sort.txt FetalHeartCardiacFibroblasts_ChimpDerived_Chpreffed.fixed.normed.sort.txt preGC_IIaFemale_ChimpDerived_Chpreffed.fixed.normed.sort.txt FetalBrainCOP_ChimpDerived_Chpreffed.fixed.normed.sort.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp2.txt

grep chr /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp1.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp1.fix.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp1.fixed.txt
cat /scratch/users/astarr97/TempSortedDL/columns_normed_Temp1.txt /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp1.fixed.txt > All_DL_ChimpDerived_Chpreffed_Normed_Temp1.ready.txt

grep chr /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp1.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp1.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp1.fix.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp1.fixed.txt
cat /scratch/users/astarr97/TempSortedDL/columns_normed_Temp1.txt /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp1.fixed.txt > All_DL_HumanDerived_Chpreffed_Normed_Temp1.ready.txt

grep chr /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp2.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp2.fix.txt > /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp2.fixed.txt
cat /scratch/users/astarr97/TempSortedDL/columns_normed_Temp2.txt /scratch/users/astarr97/TempSortedDL/All_DL_ChimpDerived_Chpreffed_Normed_Temp2.fixed.txt > All_DL_ChimpDerived_Chpreffed_Normed_Temp2.ready.txt

grep chr /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp2.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp2.fix.txt
awk -F'\t' '{print $1, $2, $3, $4, $5, $6, $8, $9, $10, $11, $12, $14, $15, $16, $17, $18, $20, $21, $22, $23, $24, $26, $27, $28, $29, $30, $32, $33, $34, $35, $36, $38, $39, $40, $41, $42, $44, $45, $46, $47, $48}' OFS='\t' /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp2.fix.txt > /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp2.fixed.txt
cat /scratch/users/astarr97/TempSortedDL/columns_normed_Temp2.txt /scratch/users/astarr97/TempSortedDL/All_DL_HumanDerived_Chpreffed_Normed_Temp2.fixed.txt > All_DL_HumanDerived_Chpreffed_Normed_Temp2.ready.txt

python compute_taus_chpreffed_2.py 1
python compute_taus_chpreffed_2.py 2
python compute_taus_chpreffed_1.py 1
python compute_taus_chpreffed_1.py 2
