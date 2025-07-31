import os

c = 0
for i in ["0.01", "0.001", "0.005"]:
    out = open("All_Summarized_" + i + ".txt", 'w')
    out.write("\t".join(["Chrom", "Pos", "ID", "Ref", "Alt", "AF", "AF_amr", "AF_asj", "AF_eas", "AF_fin", "AF_nfe", "AF_oth", "Variant_type", "Gene", "Gene_type", "protein_change", "APPRIS", "SIFT", "PolyPhen"]) + "\n")
    for file in os.listdir():
        if "full_" + i in file:
            o = open(file)
            for line in o:
                c += 1
                l = line.replace("\n", "").split("\t")
                if "," in l[3] or "," in l[4]:
                    print(l[0:6])
                vep_list = []
                vep = l[15].split(",")
                for j in vep:
                    jl = j.split("|")
                    #This try prevents errors due to premature stop codons which annoyingly include comma separated things
                    try:
                        type_var = jl[1]
                        gene = jl[3]
                        gene_type = jl[7]
                        try:
                            change = jl[11].split(".")[2]
                        except:
                            change = ''
                        isoform = jl[26]
                        sift = jl[33]
                        polyphen = jl[34]
                        vep_list = [type_var, gene, gene_type, change, isoform, sift, polyphen]
                        out.write("\t".join([l[0].replace("chrchr", "chr"), l[1], l[2], l[3], l[4]] + l[7:15] + vep_list) + "\n")
                    except:
                        pass
                if c % 100000 == 0:
                    print(c)
            o.close()
