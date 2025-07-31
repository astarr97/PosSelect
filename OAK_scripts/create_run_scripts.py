import os

o = open("Config_ToRun.txt")

d = {"PerGene":"python run_PerGene_Unfold.py REPLACE\n", }

#Function to write out the header
def write_beg(file, mem="32GB", time="168"):
    file.write("#!/bin/bash\n#SBATCH --time=" + time + ":00:00\n#SBATCH -p hbfraser,hns\n#SBATCH --mem=MEMORY\n#SBATCH -c 1\n\n".replace("MEMORY", mem))

#File to submit all our jobs
driver = open("driver.sh", 'w')

for line in o:
    entry = line.replace("\n", "")
    print(entry)
    if entry == "PhyloP":
        #For TFBS, want to do with polymorphisms in the reference and without
        out = open("run_TFBS_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_TFBS_" + entry + ".sh\n")
        write_beg(out, mem="64GB")
        out.write("python run_on_TFBS.py PhyloP447 50000000000 250 -1 0.25 300,400,500 0 0 0 TFBS_SpecSup250_PS_PhastCons-1_Unpaired_MAFCut0.25_PhyloP447.pdf TFBS_SpecSup250_PS_PhastCons-1_Unpaired_MAFCut0.25_PhyloP447.txt\n")
        out.write("python run_on_TFBS.py PhyloP447 50000000000 250 -1 0.25 300,400,500 0 0 1 TFBS_SpecSup250_PS_PhastCons-1_Unpaired_MAFCut0.25_PhyloP447_HrefDneCrefOnly.pdf TFBS_SpecSup250_PS_PhastCons-1_Unpaired_MAFCut0.25_PhyloP447_HrefDneCrefOnly.txt\n")
        out.close()
        
        #Run per chromosome
        out = open("run_PerChrom_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerChrom_" + entry + ".sh\n")
        write_beg(out)
        out.write("python run_PerChrom.py PhyloP447\n")
        #out.write("python run_PerChrom.py BGS\n")
        out.close()
        
        #Run per gene for non-coding
        out = open("run_PerGene_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerGene_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python run_PerGene_Unfold_Permute.py PhyloP447\n")
        out.write("python run_PerGene_Unfold_Permute.py BGS\n")
        out.close()
        
        #Run per gene set for non-coding
        out = open("run_PerGeneSet_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerGeneSet_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python run_PerGeneSet_Unfold.py PhyloP447\n")
        out.write("python run_PerGeneSet_Unfold.py BGS\n")
        out.close()
        
        #Run script to test for effects of BGS
        out = open("run_PerGeneWindTestBGS_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerGeneWindTestBGS_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python test_bgs_windows.py " + str(50000) + " PhyloP447\n")
        out.write("python test_bgs_windows.py " + str(25000) + " PhyloP447\n")
        out.close()
    else:
        #Run for TFBS using the deep learning strategy!
        out = open("run_TFBS_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_TFBS_" + entry + ".sh\n")
        write_beg(out, mem="64GB")
        out.write("python run_on_TFBS_DL.py 50000000000 -1 0.25 300,400,500 0 REPLACE\n".replace("REPLACE", entry))
        out.write("python run_on_TFBS_DL.py 50000000000 -1 0.25 300,400,500 1 REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        #Run bootstrapping to estimate CI for HAQERs
        out = open("run_HAQER_" + entry + ".sh", 'w')
        write_beg(out)
        driver.write("sbatch -p hbfraser " + "run_HAQER_" + entry + ".sh\n")
        out.write("python permute_deep_learning_ConfInt_HAQER_HAR_hCONDEL.py REPLACE HAQER abs_logfc\n".replace("REPLACE", entry))
        out.close()
        
        #Same as for HAQERs but for HARs
        out = open("run_HAR_" + entry + ".sh", 'w')
        write_beg(out)
        driver.write("sbatch -p hbfraser " + "run_HAR_" + entry + ".sh\n")
        out.write("python permute_deep_learning_ConfInt_HAQER_HAR_hCONDEL.py REPLACE HAR abs_logfc\n".replace("REPLACE", entry))
        out.write("python permute_deep_learning_ConfInt_HAQER_HAR_hCONDEL.py REPLACE HAR PhyloP447\n".replace("REPLACE", entry))
        out.close()
        
        #Run per chromosome using the deep learning predictions
        out = open("run_PerChrom_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerChrom_" + entry + ".sh\n")
        write_beg(out)
        out.write("python run_PerChrom.py abs_logfc REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        #Run per gene using the deep learning predictions
        out = open("run_PerGeneUnfold_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerGeneUnfold_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python run_PerGene_Unfold_Permute.py abs_logfc REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        #Test for effects of BGS
        out = open("run_PerGeneWindTestBGS_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerGeneWindTestBGS_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python test_bgs_windows.py " + str(50000) + " abs_logfc REPLACE\n".replace("REPLACE", entry))
        out.write("python test_bgs_windows.py " + str(25000) + " abs_logfc REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        #Run for each gene set for deep learning, not used
        out = open("run_PerGeneSetUnfold_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerGeneSetUnfold_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python run_PerGeneSet_Unfold.py abs_logfc REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        #Run testing on Alu element selection
        out = open("run_Alu_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_Alu_" + entry + ".sh\n")
        write_beg(out, mem="32GB", time="24")
        out.write("#python deep_learning_Alus.py REPLACE\n".replace("REPLACE", entry))
        #out.write("python deep_learning_Alu_GO.py REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        #Define our two groups of cell types
        group1 = ["KosoyRoussosControlMicroglia", "LiangSteinNeuron", "AdultHeartVentricularCardiomyocyte", "AdultProximalTubule", "FetalArterialECs", "FetalChondrocytes", "SertoliMale", "ASCT"]
        group2 = ["FetalGonadImmuneFemale", "ITL23", "AdultHeartSmoothMuscle", "AdultLoopOfHenle", "FetalHeartPericytes", "FetalHeartCardiacFibroblasts", "preGC_IIaFemale", "FetalBrainCOP"]
        
        if entry in group1:
            
            #Stratify by dTau and estimate alpha_CA in each bin, the only difference between the scripts is which cell types are included when computing CTS
            out = open("run_StratifyCTS_New_" + entry + ".sh", 'w')
            write_beg(out, mem="32GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS_New_" + entry + ".sh\n")
            out.write("python deep_learning_StratifyCTS.py REPLACE 1 1 0\n#python deep_learning_StratifyCTS.py REPLACE 1 1 250\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_StratifyCTS2_New_" + entry + ".sh", 'w')
            write_beg(out, mem="32GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS2_New_" + entry + ".sh\n")
            out.write("python deep_learning_StratifyCTS2.py REPLACE 1 1 0\n#python deep_learning_StratifyCTS2.py REPLACE 1 1 250\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_StratifyCTS3_New_" + entry + ".sh", 'w')
            write_beg(out, mem="32GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS2_New_" + entry + ".sh\n")
            out.write("python deep_learning_StratifyCTS3.py REPLACE 1 1 0\n#python deep_learning_StratifyCTS3.py REPLACE 1 1 250\n".replace("REPLACE", entry))
            out.close()
            
            #Run test using dTau/dEE and compare to using abs logfc
            out = open("run_UseCTS_" + entry + ".sh", 'w')
            write_beg(out, mem="64GB")
            driver.write("sbatch -p hbfraser " + "run_UseCTS_" + entry + ".sh\n")
            out.write("#python deep_learning_UseCTS.py REPLACE 1 1 0 abs_logfc\n#python deep_learning_UseCTS.py REPLACE 0 1 0 abs_logfc\npython deep_learning_UseCTS.py REPLACE 1 1 250 abs_logfc\npython deep_learning_UseCTS.py REPLACE 0 1 250 abs_logfc\n".replace("REPLACE", entry))
            out.write("python deep_learning_UseCTS.py REPLACE 1 1 250 PhyloP447\npython deep_learning_UseCTS.py REPLACE 0 1 250 PhyloP447\n".replace("REPLACE", entry))
            out.close()
            
            #Test which cell types have an excess of fixed sites that increase cell type-specificity of CA
            out = open("run_IncreaseCTS_" + entry + ".sh", 'w')
            write_beg(out, mem="32GB", time="48")
            driver.write("sbatch -p hbfraser " + "run_IncreaseCTS_" + entry + ".sh\n")
            out.write("python deep_learning_IncreaseCTS.py " + entry + " 1 0\n")
            out.write("python deep_learning_IncreaseCTS.py " + entry + " 1 1\n")
            out.close()
            
            out = open("run_FindRHCTAGs_" + entry + ".sh", 'w')
            driver.write("sbatch -p hbfraser " + "run_FindRHCTAGs_" + entry + ".sh\n")
            write_beg(out, mem="32GB", time="24")
            out.write("python find_RHCTAGs.py REPLACE 1 0 0 0\n".replace("REPLACE", entry))
            out.write("python find_RHCTAGs.py REPLACE 1 0 1 0\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_FindRCCTAGs_" + entry + ".sh", 'w')
            driver.write("sbatch -p hbfraser " + "run_FindRCCTAGs_" + entry + ".sh\n")
            write_beg(out, mem="32GB", time="24")
            out.write("python find_RCCTAGs.py REPLACE 1 0 0 0\n".replace("REPLACE", entry))
            out.write("python find_RCCTAGs.py REPLACE 1 0 1 0\n".replace("REPLACE", entry))
            out.close()
            
        #Repeat of the above for group 2
        elif entry in group2:
            out = open("run_StratifyCTS_New_" + entry + ".sh", 'w')
            write_beg(out, mem="32GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS_New_" + entry + ".sh\n")
            out.write("python deep_learning_StratifyCTS.py REPLACE 1 2 0\n#python deep_learning_StratifyCTS.py REPLACE 1 2 250\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_StratifyCTS2_New_" + entry + ".sh", 'w')
            write_beg(out, mem="32GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS2_New_" + entry + ".sh\n")
            out.write("python deep_learning_StratifyCTS2.py REPLACE 1 2 0\n#python deep_learning_StratifyCTS2.py REPLACE 1 2 250\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_StratifyCTS3_New_" + entry + ".sh", 'w')
            write_beg(out, mem="32GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS2_New_" + entry + ".sh\n")
            out.write("python deep_learning_StratifyCTS3.py REPLACE 1 2 0\n#python deep_learning_StratifyCTS3.py REPLACE 1 2 250\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_UseCTS_" + entry + ".sh", 'w')
            write_beg(out, mem="64GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS_" + entry + ".sh\n")
            out.write("#python deep_learning_UseCTS.py REPLACE 1 1 0 abs_logfc\n#python deep_learning_UseCTS.py REPLACE 0 1 0 abs_logfc\npython deep_learning_UseCTS.py REPLACE 1 1 250 abs_logfc\npython deep_learning_UseCTS.py REPLACE 0 1 250 abs_logfc\n".replace("REPLACE", entry))
            #out.write("python deep_learning_UseCTS.py REPLACE 1 1 250 PhyloP447\npython deep_learning_UseCTS.py REPLACE 0 1 250 PhyloP447\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_IncreaseCTS_" + entry + ".sh", 'w')
            write_beg(out, mem="32GB", time="48")
            driver.write("sbatch -p hbfraser " + "run_IncreaseCTS_" + entry + ".sh\n")
            out.write("python deep_learning_IncreaseCTS.py " + entry + " 2 0\n")
            out.write("python deep_learning_IncreaseCTS.py " + entry + " 2 1\n")
            out.close()
            
            out = open("run_FindRHCTAGs_" + entry + ".sh", 'w')
            driver.write("sbatch -p hbfraser " + "run_FindRHCTAGs_" + entry + ".sh\n")
            write_beg(out, mem="32GB", time="24")
            out.write("python find_RHCTAGs.py REPLACE 2 0 0 0\n".replace("REPLACE", entry))
            out.write("python find_RHCTAGs.py REPLACE 2 0 1 0\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_FindRCCTAGs_" + entry + ".sh", 'w')
            driver.write("sbatch -p hbfraser " + "run_FindRCCTAGs_" + entry + ".sh\n")
            write_beg(out, mem="32GB", time="24")
            out.write("python find_RCCTAGs.py REPLACE 2 0 0 0\n".replace("REPLACE", entry))
            out.write("python find_RCCTAGs.py REPLACE 2 0 1 0\n".replace("REPLACE", entry))
            out.close()
        