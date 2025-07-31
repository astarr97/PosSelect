import sys
file = sys.argv[1]

v = open(file)
c = 0
out = open("VEP_Input_Bonobo_Derived_" + str(c//600000) + ".txt", 'w')
for line in v:
    row = line.split("\t")
    if c:
        c += 1
        if c % 600000 == 0:
            out.close()
            out = open("VEP_Input_Bonobo_Derived_" + str(c//600000) + ".txt", 'w')
        else:
            out.write("\t".join([row[0].replace("chr", ""), row[2], row[2], row[3].replace("|", "/")[0:3], "+"]) + "\n")
            out.write("\t".join([row[0].replace("chr", ""), row[2], row[2], row[3].replace("|", "/")[0:3], "-"]) + "\n")
    else:
        c += 1
v.close()
