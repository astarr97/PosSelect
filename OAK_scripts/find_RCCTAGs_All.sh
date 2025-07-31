#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH -p hbfraser
#SBATCH --mem=32GB
#SBATCH -c 1

python find_RCCTAGs.py FetalArterialECs 1 0 0
python find_RCCTAGs.py FetalArterialECs 1 0 1
python find_RCCTAGs.py AdultHeartSmoothMuscle 2 0 0
python find_RCCTAGs.py AdultHeartSmoothMuscle 2 0 1
python find_RCCTAGs.py AdultHeartVentricularCardiomyocyte 1 0 0
python find_RCCTAGs.py AdultHeartVentricularCardiomyocyte 1 0 1
python find_RCCTAGs.py AdultLoopOfHenle 2 0 0
python find_RCCTAGs.py AdultLoopOfHenle 2 0 1
python find_RCCTAGs.py AdultProximalTubule 1 0 0
python find_RCCTAGs.py AdultProximalTubule 1 0 1
python find_RCCTAGs.py ASCT 1 0 0
python find_RCCTAGs.py ASCT 1 0 1
python find_RCCTAGs.py FetalBrainCOP 2 0 0
python find_RCCTAGs.py FetalBrainCOP 2 0 1
python find_RCCTAGs.py FetalChondrocytes 1 0 0
python find_RCCTAGs.py FetalChondrocytes 1 0 1
python find_RCCTAGs.py FetalHeartPericytes 2 0 0
python find_RCCTAGs.py FetalHeartPericytes 2 0 1
python find_RCCTAGs.py LiangSteinNeuron 1 0 0
python find_RCCTAGs.py LiangSteinNeuron 1 0 1
python find_RCCTAGs.py preGC_IIaFemale 2 0 0
python find_RCCTAGs.py preGC_IIaFemale 2 0 1
python find_RCCTAGs.py SertoliMale 1 0 0
python find_RCCTAGs.py SertoliMale 1 0 1
python find_RCCTAGs.py ITL23 2 0 0
python find_RCCTAGs.py ITL23 2 0 1
python find_RCCTAGs.py KosoyRoussosControlMicroglia 1 0 0
python find_RCCTAGs.py KosoyRoussosControlMicroglia 1 0 1
python find_RCCTAGs.py FetalGonadImmuneFemale 2 0 0
python find_RCCTAGs.py FetalGonadImmuneFemale 2 0 1
python find_RCCTAGs.py FetalHeartCardiacFibroblasts 2 0 0
python find_RCCTAGs.py FetalHeartCardiacFibroblasts 2 0 1
