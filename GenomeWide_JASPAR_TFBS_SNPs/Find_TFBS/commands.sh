#First, we downloaded the TFBS in meme format from JASPAR from this link: https://jaspar.genereg.net/downloads/ using the 2022 versions.
#We also installed pwmscan, although only used two scripts from it https://pubmed.ncbi.nlm.nih.gov/29514181/

#First, we need to convert from the lpm to ilo format so that the meme formatted things can be used by pwmscan
for file in *.meme;
do
    python convert_lpm_to_ilo.py $file
done

#Next, following the pwmscan documentation, we need to compute the matrix probabilities
#We used the background frequencies of the actual human genome
for file in *.mat;
do
    ./matrix_prob --bg "0.29,0.21,0.21,0.29" $file > $file.scoretab.out
done

#Then we made all the scripts.  An example of this is compute_tfbs_human0.sh
python make_scripts.py

#These scripts use pwmscan to identify all the instances of motifs with p <= 0.01 and then convert to a bed format.