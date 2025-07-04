import os

for file in os.listdir():
    if ".fasta" in file and "plit" in file:
        o = open("run_rmsk_template.sh")
        out = open("run_rmsk_" + file.replace(".fasta", "") + ".sh", 'w')
        for line in o:
            if "Repeat" not in line:
                out.write(line)
            else:
                out.write(line.replace("fasta_file", file))
        o.close()
        out.close()
