command1="./build/slim -d nF=\\'661_TEST_NONCOD_Bene0.01_III\\' -d weakS=5 -d vlowS=50 -d vmedS=125 -d vhighS=500 -d pposBene=0.01 -d noncodLength=200000 tennesen_noncoding.slim\n"
command2="./build/slim -d nF=\\'661_TEST_NONCOD_Bene0.001_III\\' -d weakS=5 -d vlowS=50 -d vmedS=125 -d vhighS=500 -d pposBene=0.001 -d noncodLength=200000 tennesen_noncoding.slim\n"
command3="./build/slim -d nF=\\'661_TEST_NONCOD_Bene0.III\\' -d weakS=5 -d vlowS=50 -d vmedS=125 -d vhighS=500 -d pposBene=0 -d noncodLength=200000 tennesen_noncoding.slim\n"

commandElem1="./build/slim -d nF=\\'661_TEST_NONCOD_Bene0.01_III\\' -d weakS=5 -d vlowS=50 -d vmedS=125 -d vhighS=500 -d pposBene=0.01 -d noncodLength=200000 tennesen_noncoding_elems.slim\n"
commandElem2="./build/slim -d nF=\\'661_TEST_NONCOD_Bene0.001_III\\' -d weakS=5 -d vlowS=50 -d vmedS=125 -d vhighS=500 -d pposBene=0.001 -d noncodLength=200000 tennesen_noncoding_elems.slim\n"
commandElem3="./build/slim -d nF=\\'661_TEST_NONCOD_Bene0.III\\' -d weakS=5 -d vlowS=50 -d vmedS=125 -d vhighS=500 -d pposBene=0 -d noncodLength=200000 tennesen_noncoding_elems.slim\n"

def write_beg(out):
    out.write("#!/bin/bash\n#SBATCH --time=72:00:00\n#SBATCH -p hns,hbfraser\n#SBATCH --mem=16GB\n\n")

out = open("run_sims_0.01_0.sh", 'w')
for i in range(1000):
    if i % 20 == 0:
        out.close()
        out = open("run_sims_0.01_" + str(i//20) + ".sh", 'w')
        write_beg(out)
    out.write(command1.replace("III", str(i)))
out.close()

out = open("run_sims_0.001_0.sh", 'w')
for i in range(1000):
    if i % 20 == 0:
        out.close()
        out = open("run_sims_0.001_" + str(i//20) + ".sh", 'w')
        write_beg(out)
    out.write(command2.replace("III", str(i)))
out.close()

out = open("run_sims_0.00_0.sh", 'w')
for i in range(1000):
    if i % 20 == 0:
        out.close()
        out = open("run_sims_0.00_" + str(i//20) + ".sh", 'w')
        write_beg(out)
    out.write(command3.replace("III", str(i)))
out.close()

out = open("run_simsElem_0.01_0.sh", 'w')
for i in range(1000):
    if i % 20 == 0:
        out.close()
        out = open("run_simsElem_0.01_" + str(i//20) + ".sh", 'w')
        write_beg(out)
    out.write(commandElem1.replace("III", str(i)))
out.close()

out = open("run_simsElem_0.001_0.sh", 'w')
for i in range(1000):
    if i % 20 == 0:
        out.close()
        out = open("run_simsElem_0.001_" + str(i//20) + ".sh", 'w')
        write_beg(out)
    out.write(commandElem2.replace("III", str(i)))
out.close()

out = open("run_simsElem_0.00_0.sh", 'w')
for i in range(1000):
    if i % 20 == 0:
        out.close()
        out = open("run_simsElem_0.00_" + str(i//20) + ".sh", 'w')
        write_beg(out)
    out.write(commandElem3.replace("III", str(i)))
out.close()
