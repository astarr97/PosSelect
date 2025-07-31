#Generate the files to input to VEP
python vcf_to_vep.py

#Following this, I uploaded each file to the hg38 VEP web portal, ran VEP v109 with default parameters, and downloaded all the files
#I used default parameters

#Process the VEP output
python filter_vep.py

python process_ensembl_human_poly.py

#This works because we use the variant information in the identity of the variant!
python consolidate.py All_Summarized_HumPoly.txt

sort -k1,1 All_Summarized_HumPolyConsol.txt > All_Summarized_HumPolyConsol_Sorted.txt

python add_var.py HumanPoly_MAF0.001_AF_Cons_Filt.txt All_Summarized_HumPolyConsol_Sorted.txt
sort -k1,1 HumanPoly_MAF0.001_AF_Cons_Filt_Var.txt > HumanPoly_MAF0.001_AF_Cons_Filt_Var_Sorted.txt
sort -k1,1 All_Summarized_HumPolyConsol_Sorted_Var.txt > All_Summarized_HumPolyConsol_Sorted_Var_Sorted.txt
join HumanPoly_MAF0.001_AF_Cons_Filt_Var_Sorted.txt All_Summarized_HumPolyConsol_Sorted_Var_Sorted.txt > HumanPoly_MAF0.001_AF_Cons_VEP.txt
