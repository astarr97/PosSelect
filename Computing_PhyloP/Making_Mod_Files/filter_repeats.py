import sys

file = sys.argv[1]

assert(".out" in file)
o = open(file)
out = open(file.replace(".out", ".filt.out"), 'w')
bleh = []
c = 0
for line in o:
    try:
        kind = line.split()[10]
        if "RNA" not in kind and "atellite" not in kind and "position" != kind and "begin" != kind and kind != "Low_complexity" and kind != "Unknown" and kind != "PLE":
            out.write(line)
            bleh.append(kind)
        c += 1
        if c % 1000 == 0:
            bleh = list(set(bleh))
    except:
        pass
    
o.close()
out.close()
bleh = list(set(bleh))
print(bleh)