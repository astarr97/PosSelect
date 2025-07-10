import pandas as pd
import sys
import os

file = sys.argv[1]
samples = sys.argv[2].split(",")

#Note: Based on the publication, we conclude that all necessary data filtering has already taken place. We thus keep all cells.
o = open("atac_metadata_with_multiome.csv")


plain_cell_type = ["Endothelial", "Epithelial", "Erythrocyte", "Immune", "Mesenchymal_GATA2", "Neural", "PV", "SMCs"]
somatic_cell_type = ["CoelEpi", "FetalLeydig", "Mesenchymal_LHX9", "preGranulosa", "Sertoli", "Supporting"]
germ_cell_type = ["GermCells"]
celltype_to_barcode = {}
for line in o:
    l = line.replace("\n", "").split(",")
    if l[0]:
        celltype = l[5]
        barcode = "-".join(l[0].split("-")[1:])
        if l[1] in samples:
            if celltype in plain_cell_type:
                pass
            elif celltype in somatic_cell_type:
                celltype = l[6]
            elif celltype in germ_cell_type:
                celltype = l[7]
            if celltype not in celltype_to_barcode.keys():
                celltype_to_barcode[celltype] = [barcode]
            else:
                celltype_to_barcode[celltype].append(barcode)
for key in celltype_to_barcode.keys():
    print(key, len(celltype_to_barcode[key]))

o.close()    

os.mkdir("_".join(samples))

x = pd.read_csv(file, sep = "\t", header = None)
x.columns = ["Chrom", "Pos1", "Pos2", "barcode", "PCR Dups"]

for key in celltype_to_barcode.keys():
    x2 = x[x["barcode"].isin(celltype_to_barcode[key])]
    x2.to_csv("_".join(samples) + "/" + "_".join(samples) + "_" + key + ".fragments.tsv", sep = "\t", index = False, header = False)

    