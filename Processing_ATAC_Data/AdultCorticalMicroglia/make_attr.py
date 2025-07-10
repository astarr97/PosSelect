o = open("Kosoy_Roussos_2022_Attribute.txt", 'w')
o.write("sample_id\tseqprep\tspecies\tdataOrg\tseq_type\tread1\tread2\n")
import os

for file in os.listdir():
    if ".R1.fastq.gz" in file:
        o.write(file.replace(".R1.fastq.gz", "") + "\t" + "no" + "\t" + "human" + "\t" + "Kosoy_Roussos_2022" + "\t" + "paired-end" + "\t" + "/scratch/users/astarr97/Kosoy_Roussos_2022/" + file + "\t" + "/scratch/users/astarr97/Kosoy_Roussos_2022/" + file.replace(".R1.fastq.gz", ".R2.fastq.gz") + "\n")
o.close()
