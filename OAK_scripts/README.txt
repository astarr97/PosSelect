This folder contains the scripts used to run various analyses using the positive selection method.
Almost all the scripts rely on functions defined in PosSelect_Functions.py.

To run everything, I just run python create_run_scripts.py which creates a bunch of individual shell scripts that can then be submitted with driver.sh (which the create_run_scripts.py creates)

The scripts contain a lot of repetitive code, generally aimed at a few different things:
1. Reading in the data from the deep learning predictions or cell type-specificity and adding it
2. When bootstrapping across different cutoffs, finding the minimum number of sites in each category (poly or fixed) across cutoffs so that we can downsample effectively

The purpose of each script is as follows:
deep_learning_Alus.py does the testing for positive selection on Alu elements relative to all non-Alu sites and repetitive elements with species support <= 240
deep_learning_IncreaseCTS.py tests whether fixed variants disproprotionately increase the specficity of cCREs in each cell type
deep_learning_StratifyCTS.py and similarly named scripts stratify by cell type-specificity of effect on CA and run the positive selection test
deep_learning_UseCTS.py uses dTau or dEE as input to the test
find_RCCTAGs.py and find_RHCTAGs.py are used to find the cRAGs/cRALs and hRAGs/hRALs
run_on_TFBS.py and run_on_TFBS_DL.py are used to test for positive selection on TF binding sites
run_PerChrom.py splits sites by chromosome and tests for positive selection
run_PerGene_Unfold_Permute.py and run_PerGeneSet_Unfold.py are used to test for positive selection on individual genes or sets of genes
test_bgs_windows.py is used to test for effects of BGS on our test

Scripts that are not automatically run with this method are:
    
get_site_TFBS_info.py, which is used to pull information across all TFBS for a specific site, e.g.
python get_site_TFBS_info chr1:109918419

get_stuff.py, which is used to pull information from a specific cell type for download, e.g.
python get_stuff.py abs_logfc 0 0.25 FetalBrainNeurGlioblast_CB_VZ where the second argument is the species support cutoff, the third is the symmetric minor allele frequency cutoff, and the thrid is the deep learning cell type name

get_tf_data.py, which is used to pull information from a specific cell type for a set of TFBS to download e.g.
python get_tf_data.py abs_logfc 0 0.25 MA0052.4,MA0512.2,MA1643.1,MA0785.1,MA0507.2,MA1574.1,MA1575.1,MA1576.1,MA0745.2 400 AdultProximalTubule
where the second argument is the species support cutoff, the third is the symmetric minor allele frequency cutoff, the fourth is a list of JASPAR TFBS IDs, the fifth is the cutoff for the TBFS "score", and the last is the deep learning cell type cutoff

pull_background_cts.py, which was used to pull all sites that meet the criteria to be included in the search for RAGs and RALs

All other files are old and were not used
