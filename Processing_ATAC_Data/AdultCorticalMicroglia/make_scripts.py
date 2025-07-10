import os

for file in os.listdir():
    if ".R1.fastq.gz" in file:
        o = open("pipeline.sh")
        out = open("pipeline_" + file.replace(".R1.fastq.gz", "") + ".sh", 'w')
        for line in o:
            if "#" in line or len(line) < 3:
                out.write(line)
            else:
                out.write(line.replace("FILE1", file).replace("FILE2", file.replace(".R1.fastq.gz", ".R2.fastq.gz")).replace("FOLDER", file.split("_")[0] + "_" + file.split("_")[1]))
        o.close()
        out.close()
