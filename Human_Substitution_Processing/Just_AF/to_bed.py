o = open("All_Just_AF_0.001.txt")
out = open("All_Just_AF_0.001.bed", 'w')
for line in o:
    l = line.split("\t")
    try:
        out.write("\t".join([l[0]] + [str(int(l[1])-1), l[1]] + l[2:]))
    except:
        out.write(line)
    
o.close()
out.close()