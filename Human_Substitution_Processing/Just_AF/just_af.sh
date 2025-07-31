#Pull out the ensembl information and reformat
#NOTE: As this was annotated with VEP 101 and I'm using VEP 109, I reannotated everything with the VEP web portal
#NOTE: I used a slightly older version of this pipeline to generate things, results should be almost entirely the same though
#This is the slightly older code that was used initially but gives equivalent results.
python process_ensembl.py

#Pull out just the af information
python just_af.py

#Proceed with just the 0.001 file, can get other AFs later
#Convert to a bed file
python to_bed.py

#Sort the bed file
sort -k1,1 -k2,2n All_Just_AF_0.001.bed > All_Just_AF_0.001_Sorted.bed

#Fix the bed file so it can actually intersect
python fix_bed.py