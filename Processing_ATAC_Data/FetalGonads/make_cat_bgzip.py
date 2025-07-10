cell_types_male = ['pre_spermatogonia', 'Ti', 'Sertoli', 'sPAX8', 'FetalLeydig']
cell_types_all = ['PGC', 'GC', 'CoelEpi_LHX9', 'CoelEpi_GATA2', 'Gi', 'early_supporting', 'Endothelial', 'Epithelial', 'Erythrocyte', 'Immune', 'Mesenchymal_GATA2', 'Neural', 'PV']
cell_types_female = ['oogonia_STRA8', 'oogonia_meiotic', 'pre_oocyte', 'oocyte', 'preGC_I', 'preGC_IIa', 'Oi', 'preGC_IIb', 'OSE', 'granulosa', 'SMCs']

out = open("cat_bgzip_male.sh", 'w')
out.write("#!/bin/bash\n#SBATCH --time=120:00:00\n#SBATCH -p hbfraser\n#SBATCH --mem=32GB\n#SBATCH -c 1\n\n\n")
for cell_type in cell_types_male:
    o = open("template_male.sh")
    for line in o:
        out.write(line.replace("Epithelial", cell_type))
    out.write("\n\n")
    o.close()

out = open("cat_bgzip_all.sh", 'w')
out.write("#!/bin/bash\n#SBATCH --time=120:00:00\n#SBATCH -p hbfraser\n#SBATCH --mem=32GB\n#SBATCH -c 1\n\n\n")
for cell_type in cell_types_all:
    o = open("template_all.sh")
    for line in o:
        out.write(line.replace("Epithelial", cell_type))
    out.write("\n\n")
    o.close()

out = open("cat_bgzip_female.sh", 'w')
out.write("#!/bin/bash\n#SBATCH --time=120:00:00\n#SBATCH -p hbfraser\n#SBATCH --mem=32GB\n#SBATCH -c 1\n\n\n")
for cell_type in cell_types_female:
    o = open("template_female.sh")
    for line in o:
        out.write(line.replace("Epithelial", cell_type))
    out.write("\n\n")
    o.close()
