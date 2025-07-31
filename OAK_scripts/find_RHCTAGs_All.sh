#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB
#SBATCH -c 1

#python find_RHCTAGs.py FetalArterialECs 1 0 0
#python find_RHCTAGs.py FetalArterialECs 1 0 1
#python find_RHCTAGs.py AdultHeartSmoothMuscle 2 0 0
#python find_RHCTAGs.py AdultHeartSmoothMuscle 2 0 1
#python find_RHCTAGs.py AdultHeartVentricularCardiomyocyte 1 0 0
#python find_RHCTAGs.py AdultHeartVentricularCardiomyocyte 1 0 1
#python find_RHCTAGs.py AdultLoopOfHenle 2 0 0
#python find_RHCTAGs.py AdultLoopOfHenle 2 0 1
#python find_RHCTAGs.py AdultProximalTubule 1 0 0
#python find_RHCTAGs.py AdultProximalTubule 1 0 1
#python find_RHCTAGs.py ASCT 1 0 0
#python find_RHCTAGs.py ASCT 1 0 1
#python find_RHCTAGs.py FetalBrainCOP 2 0 0
#python find_RHCTAGs.py FetalBrainCOP 2 0 1
python find_RHCTAGs.py FetalChondrocytes 1 0 0
python find_RHCTAGs.py FetalChondrocytes 1 0 1
#python find_RHCTAGs.py FetalHeartPericytes 2 0 0
#python find_RHCTAGs.py FetalHeartPericytes 2 0 1
#python find_RHCTAGs.py LiangSteinNeuron 1 0 0
#python find_RHCTAGs.py LiangSteinNeuron 1 0 1
#python find_RHCTAGs.py preGC_IIaFemale 2 0 0
#python find_RHCTAGs.py preGC_IIaFemale 2 0 1
#python find_RHCTAGs.py SertoliMale 1 0 0
#python find_RHCTAGs.py SertoliMale 1 0 1
python find_RHCTAGs.py ITL23 2 0 0
python find_RHCTAGs.py ITL23 2 0 1
python find_RHCTAGs.py KosoyRoussosControlMicroglia 1 0 0
python find_RHCTAGs.py KosoyRoussosControlMicroglia 1 0 1
python find_RHCTAGs.py FetalGonadImmuneFemale 2 0 0
python find_RHCTAGs.py FetalGonadImmuneFemale 2 0 1
python find_RHCTAGs.py FetalHeartCardiacFibroblasts 2 0 0
python find_RHCTAGs.py FetalHeartCardiacFibroblasts 2 0 1
