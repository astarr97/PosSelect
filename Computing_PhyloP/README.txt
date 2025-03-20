We recomputed the PhyloP scores from the 447-way alignment due to difficulties with the other one.
To start, we use download2.sh to download the 447-way hal file.
We then make directories for each chromosome and run make_scripts.py to create scripts to pull 10,000,000 base chunks from the hal file and convert to MAF.
The created scripts also mask human (or human, chimp, and bonobo if you change make_scripts.py) and do all the PhyloP, Species Support, and PhastCons computation.
After that, we create files to cat all the different subfiles together in each chromsome directory, convert the Species Support file to a bed format, and then intersect the bed files together.
We then created a new directory ToIntersect, and then created cat_all_intersect.sh to cat everything together and convert to a .txt format.

For two 10 megabase chunks on chrX, we needed to iteratively split them into smaller and smaller chunks until we found the 2 single bases that were causing an underflow error in phast v1.5
I recommend using the newer code which automatically handles this, or using phast v1.7 which should have this underflow bug fixed.
This newer code is available at: https://github.com/astarr97/ConvDist

This newer code is also what was used to compute PhyloP for Mus musculus and Pteropus alecto
