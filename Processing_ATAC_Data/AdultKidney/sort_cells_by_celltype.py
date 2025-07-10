import pandas as pd
import sys
import os

file = sys.argv[1]
sample = sys.argv[2]

d = {"Pod":"Podocyte", "CFH":"CFH", "Tcell":"Tcell", "PT":"Proximal_Tubule", "LOH":"Loop_of_Henle", "DT":"Distal_Tubule", "CD":"Collecting_Duct_Intercalated_Cell", "End":"Endothelium", "Str":"Stromal_Cell", "Immune":"Immune_Cell"}

#Note: Based on the publication, we conclude that all necessary data filtering has already taken place. We thus keep all cells.
o = open("CellTypesAdultKidney.txt")
celltype_to_barcode = {}
for line in o:
    l = line.replace("\n", "").split("\t")
    if "#" in l[0]:
        celltype = l[-6]
        barcode = l[0].split("#")[1]
        if l[0].split("#")[0] == sample:
            if celltype not in celltype_to_barcode.keys():
                celltype_to_barcode[celltype] = [barcode]
            else:
                celltype_to_barcode[celltype].append(barcode)
for key in celltype_to_barcode.keys():
    print(key, len(celltype_to_barcode[key]))

o.close()    

os.mkdir(sample)

x = pd.read_csv(file, sep = "\t", header = None)
x.columns = ["Chrom", "Pos1", "Pos2", "barcode", "PCR Dups"]

for key in celltype_to_barcode.keys():
    x2 = x[x["barcode"].isin(celltype_to_barcode[key])]
    x2.to_csv(sample + "/" + sample + "_" + d[key] + ".fragments.tsv", sep = "\t", index = False, header = False)

    