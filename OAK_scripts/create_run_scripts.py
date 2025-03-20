import os

o = open("Config_ToRun.txt")

d = {"PerGene":"python run_PerGene_Unfold.py REPLACE\n", }

def write_beg(file, mem="32GB"):
    file.write("#!/bin/bash\n#SBATCH --time=168:00:00\n#SBATCH -p hbfraser,hns\n#SBATCH --mem=MEMORY\n#SBATCH -c 1\n\n".replace("MEMORY", mem))

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
        
        out = open("run_PerChrom_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerChrom_" + entry + ".sh\n")
        write_beg(out)
        out.write("python run_PerChrom.py PhyloP447\n")
        #out.write("python run_PerChrom.py BGS\n")
        out.close()
        
        out = open("run_Windows_" + entry + ".sh", 'w')
        print("BANANA")
        driver.write("sbatch -p hbfraser " + "run_Windows_" + entry + ".sh\n")
        write_beg(out)
        out.write("python compute_windows_fe.py PhyloP447 250 -1 0.25 0 0 50000 50KB_NoBGS_PC-1_SpecSup250_PhyloP447_MAF0.25.txt\n")
        out.write("python compute_windows_fe.py PhyloP447 50 -1 0.25 0 0 50000 50KB_NoBGS_PC-1_SpecSup50_PhyloP447_MAF0.25.txt\n")
        out.write("python compute_windows_fe.py PhyloP447 250 -1 0.25 0 1 50000 50KB_NoBGS_PC-1_SpecSup250_PhyloP447_MAF0.25_Permute.txt\n")
        out.write("python compute_windows_fe.py PhyloP447 50 -1 0.25 0 1 50000 50KB_NoBGS_PC-1_SpecSup50_PhyloP447_MAF0.25_Permute.txt\n")
        out.write("python compute_windows_fe.py PhyloP447 250 -1 0.25 0 0 500000 500KB_NoBGS_PC-1_SpecSup250_PhyloP447_MAF0.25.txt\n")
        out.write("python compute_windows_fe.py PhyloP447 50 -1 0.25 0 0 500000 500KB_NoBGS_PC-1_SpecSup50_PhyloP447_MAF0.25.txt\n")
        out.write("python compute_windows_fe.py PhyloP447 250 -1 0.25 0 1 500000 500KB_NoBGS_PC-1_SpecSup250_PhyloP447_MAF0.25_Permute.txt\n")
        out.write("python compute_windows_fe.py PhyloP447 50 -1 0.25 0 1 500000 500KB_NoBGS_PC-1_SpecSup50_PhyloP447_MAF0.25_Permute.txt\n")
        out.close()
        
        out = open("run_PerGene_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_Windows_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python run_PerGene_Unfold_Permute.py PhyloP447\n")
        out.write("python run_PerGene_Unfold_Permute.py BGS\n")
        out.close()
        
        out = open("run_PerGeneSet_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_Windows_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python run_PerGeneSet_Unfold.py PhyloP447\n")
        out.write("python run_PerGeneSet_Unfold.py BGS\n")
        out.close()
    else:
        #For TFBS, will need to do permutations later.  May also want to filter based on the median effect of mutations on chromatin accessibility!
        out = open("run_TFBS_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_TFBS_" + entry + ".sh\n")
        write_beg(out, mem="64GB")
        out.write("python run_on_TFBS_DL.py 50000000000 -1 0.25 300,400,500 0 REPLACE\n".replace("REPLACE", entry))
        #out.write("python run_on_TFBS_DL.py 50000000000 -1 0.25 300,400,500 1 REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        out = open("run_HAQER_" + entry + ".sh", 'w')
        write_beg(out)
        driver.write("sbatch -p hbfraser " + "run_HAQER_" + entry + ".sh\n")
        out.write("python permute_deep_learning_ConfInt_HAQER_HAR_hCONDEL.py REPLACE HAQER abs_logfc\n".replace("REPLACE", entry))
        out.close()
        
        out = open("run_HAR_" + entry + ".sh", 'w')
        write_beg(out)
        driver.write("sbatch -p hbfraser " + "run_HAR_" + entry + ".sh\n")
        out.write("python permute_deep_learning_ConfInt_HAQER_HAR_hCONDEL.py REPLACE HAR abs_logfc\n".replace("REPLACE", entry))
        out.write("python permute_deep_learning_ConfInt_HAQER_HAR_hCONDEL.py REPLACE HAR PhyloP447\n".replace("REPLACE", entry))
        out.close()
        
        out = open("run_StratLFC_" + entry + ".sh", 'w')
        write_beg(out)
        driver.write("sbatch -p hbfraser " + "run_StratLFC_" + entry + ".sh\n")
        out.write("python permute_deep_learning_ConfInts_stratifyLFC.py REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        out = open("run_StratSpecSup_" + entry + ".sh", 'w')
        write_beg(out)
        driver.write("sbatch -p hbfraser " + "run_StratSpecSup_" + entry + ".sh\n")
        out.write("#python permute_deep_learning_ConfInts_stratifySpecSup.py REPLACE\n".replace("REPLACE", entry))
        out.write("python permute_deep_learning_ConfInt_stratifySpecSup_No19.py REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        if entry not in os.listdir("Windows_Results"):
            os.mkdir("Windows_Results/" + entry)
        out = open("run_Windows_" + entry + ".sh", 'w')
        write_beg(out)
        driver.write("sbatch -p hbfraser " + "run_Windows_" + entry + ".sh\n")
        out.write("python compute_windows_fe.py abs_logfc 0 -1 0.25 0 0 50000 REPLACE 50KB_NoBGS_PC-1_SpecSup0_DlREPLACE_MAF0.25.txt\n".replace("REPLACE", entry))
        out.write("python compute_windows_fe.py abs_logfc 250 -1 0.25 0 0 50000 REPLACE 50KB_NoBGS_PC-1_SpecSup250_DlREPLACE_MAF0.25.txt\n".replace("REPLACE", entry))
        out.write("python compute_windows_fe.py abs_logfc 0 -1 0.25 0 1 50000 REPLACE 50KB_NoBGS_PC-1_SpecSup0_DlREPLACE_MAF0.25_Permute.txt\n".replace("REPLACE", entry))
        out.write("python compute_windows_fe.py abs_logfc 250 -1 0.25 0 1 50000 REPLACE 50KB_NoBGS_PC-1_SpecSup250_DlREPLACE_MAF0.25_Permute.txt\n".replace("REPLACE", entry))
        out.write("python compute_windows_fe.py abs_logfc 0 -1 0.25 0 0 500000 REPLACE 500KB_NoBGS_PC-1_SpecSup0_DlREPLACE_MAF0.25.txt\n".replace("REPLACE", entry))
        out.write("python compute_windows_fe.py abs_logfc 250 -1 0.25 0 0 500000 REPLACE 500KB_NoBGS_PC-1_SpecSup250_DlREPLACE_MAF0.25.txt\n".replace("REPLACE", entry))
        out.write("python compute_windows_fe.py abs_logfc 0 -1 0.25 0 1 500000 REPLACE 500KB_NoBGS_PC-1_SpecSup0_DlREPLACE_MAF0.25_Permute.txt\n".replace("REPLACE", entry))
        out.write("python compute_windows_fe.py abs_logfc 250 -1 0.25 0 1 500000 REPLACE 500KB_NoBGS_PC-1_SpecSup250_DlREPLACE_MAF0.25_Permute.txt\n".replace("REPLACE", entry))

        out.close()
        
        out = open("run_PerChrom_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerChrom_" + entry + ".sh\n")
        write_beg(out)
        out.write("python run_PerChrom.py abs_logfc REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        out = open("run_PerGeneUnfold_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerGeneUnfold_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python run_PerGene_Unfold_Permute.py abs_logfc REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        out = open("run_PerGeneSetUnfold_" + entry + ".sh", 'w')
        driver.write("sbatch -p hbfraser " + "run_PerGeneSetUnfold_" + entry + ".sh\n")
        write_beg(out, mem="32GB")
        out.write("python run_PerGeneSet_Unfold.py abs_logfc REPLACE\n".replace("REPLACE", entry))
        out.close()
        
        group1 = ["KosoyRoussosControlMicroglia", "LiangSteinNeuron", "AdultHeartVentricularCardiomyocyte", "AdultProximalTubule", "FetalArterialECs", "FetalChondrocytes", "SertoliMale", "ASCT"]
        group2 = ["FetalGonadImmuneFemale", "ITL23", "AdultHeartSmoothMuscle", "AdultLoopOfHenle", "FetalHeartPericytes", "FetalHeartCardiacFibroblasts", "preGC_IIaFemale", "FetalBrainCOP"]
        
        if entry in group1:
            out = open("run_StratifyCTS_" + entry + ".sh", 'w')
            write_beg(out, mem="64GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS_" + entry + ".sh\n")
            out.write("python deep_learning_StratifyCTS.py REPLACE 1 1 0\npython deep_learning_StratifyCTS.py REPLACE 1 1 250\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_UseCTS_" + entry + ".sh", 'w')
            write_beg(out, mem="64GB")
            driver.write("sbatch -p hbfraser " + "run_UseCTS_" + entry + ".sh\n")
            out.write("python deep_learning_UseCTS.py REPLACE 1 1 0 abs_logfc\npython deep_learning_UseCTS.py REPLACE 0 1 0 abs_logfc\npython deep_learning_UseCTS.py REPLACE 1 1 250 abs_logfc\npython deep_learning_UseCTS.py REPLACE 0 1 250 abs_logfc\npython deep_learning_UseCTS.py REPLACE 1 1 250 PhyloP447\npython deep_learning_UseCTS.py REPLACE 0 1 250 PhyloP447\n".replace("REPLACE", entry))
            out.close()
        elif entry in group2:
            out = open("run_StratifyCTS_" + entry + ".sh", 'w')
            write_beg(out, mem="64GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS_" + entry + ".sh\n")
            out.write("python deep_learning_StratifyCTS.py REPLACE 1 2 0\npython deep_learning_StratifyCTS.py REPLACE 1 2 250\n".replace("REPLACE", entry))
            out.close()
            
            out = open("run_UseCTS_" + entry + ".sh", 'w')
            write_beg(out, mem="64GB")
            driver.write("sbatch -p hbfraser " + "run_StratifyCTS_" + entry + ".sh\n")
            out.write("python deep_learning_UseCTS.py REPLACE 1 1 0 abs_logfc\npython deep_learning_UseCTS.py REPLACE 0 1 0 abs_logfc\npython deep_learning_UseCTS.py REPLACE 1 1 250 abs_logfc\npython deep_learning_UseCTS.py REPLACE 0 1 250 abs_logfc\npython deep_learning_UseCTS.py REPLACE 1 1 250 PhyloP447\npython deep_learning_UseCTS.py REPLACE 0 1 250 PhyloP447\n".replace("REPLACE", entry))
            out.close()
            

        