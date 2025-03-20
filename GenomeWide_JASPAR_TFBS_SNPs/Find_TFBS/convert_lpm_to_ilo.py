import sys
import numpy as np

file = sys.argv[1]
try:
    back_freqs = [float(x) for x in sys.argv[2].split(",")]
except:
    back_freqs = [0.29, 0.21, 0.21, 0.29]
assert(".meme" in file)

def ilo(y, b):
    if y:
        return np.round(np.log(y/b)/np.log(2)*100)
    else:
        return -10000

o = open(file)
TF = ''
for line in o:
    if "MOTIF" in line:
        TF = line.replace("\n", "").split(" ")[2]
o.close()
out = open(file.replace(".meme", "") + "_" + TF + ".mat", 'w')
o = open(file)
start_write = 0
for line in o:
    if start_write:
        if "URL" in line:
            break
        x = []
        l = [float(j) for j in line.strip().replace("\n", "").split("  ")]
        c = 0
        for i in range(len(l)):
            new_ilo = str(int(ilo(l[i], back_freqs[i])))
            if c:
                spaces = "".join(np.repeat(" ", 8 - len(new_ilo)))
                x.append(spaces + new_ilo)
            else:
                c += 1
                spaces = "".join(np.repeat(" ", 6 - len(new_ilo)))
                x.append(spaces + new_ilo)
                    
        out.write("".join(x) + "\n")
    else:
        if "letter-probability" in line:
            start_write = 1
o.close()
out.close()
