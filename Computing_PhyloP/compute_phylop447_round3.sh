#mkdir chr1
#mkdir chr2
#mkdir chr3
#mkdir chr4
#mkdir chr5
#mkdir chr6
#mkdir chr7
#mkdir chr8
#mkdir chr9
#mkdir chr10
#mkdir chr11
#mkdir chr12
#mkdir chr13
#mkdir chr14
#mkdir chr15
#mkdir chr16
#mkdir chr17
#mkdir chr18
#mkdir chr19
#mkdir chr20
#mkdir chr21
#mkdir chr22
#mkdir chrX
#mkdir chrY


python make_scripts.py chr1 248956422
cd chr1
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr2 242193529
cd chr2
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr3 198295559
cd chr3
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr4 190214555
cd chr4
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr5 181538259
cd chr5
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr6 170805979
cd chr6
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr7 159345973
cd chr7
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chrX 156040895
cd chrX
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr8 145138636
cd chr8
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr9 138394717
cd chr9
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr11 135086622
cd chr11
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr10 133797422
cd chr10
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr12 133275309
cd chr12
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr13 114364328
cd chr13
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr14 107043718
cd chr14
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr15 101991189
cd chr15
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr16 90338345
cd chr16
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr17 83257441
cd chr17
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr18 80373285
cd chr18
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr20 64444167
cd chr20
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr19 58617616
cd chr19
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chrY 57227415
cd chrY
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr22 50818468
cd chr22
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

python make_scripts.py chr21 46709983
cd chr21
for file in get*.sh;
do
    sbatch -p hbfraser $file
done
cd ..

cp spec_sup_make_bed.py chr1
cp spec_sup_make_bed.py chr2
cp spec_sup_make_bed.py chr3
cp spec_sup_make_bed.py chr4
cp spec_sup_make_bed.py chr5
cp spec_sup_make_bed.py chr6
cp spec_sup_make_bed.py chr7
cp spec_sup_make_bed.py chr8
cp spec_sup_make_bed.py chr9
cp spec_sup_make_bed.py chr10
cp spec_sup_make_bed.py chr11
cp spec_sup_make_bed.py chr12
cp spec_sup_make_bed.py chr13
cp spec_sup_make_bed.py chr14
cp spec_sup_make_bed.py chr15
cp spec_sup_make_bed.py chr16
cp spec_sup_make_bed.py chr17
cp spec_sup_make_bed.py chr18
cp spec_sup_make_bed.py chr19
cp spec_sup_make_bed.py chr20
cp spec_sup_make_bed.py chr21
cp spec_sup_make_bed.py chr22
cp spec_sup_make_bed.py chrX
cp spec_sup_make_bed.py chrY

cp fix_new_447.py chr1
cp fix_new_447.py chr2
cp fix_new_447.py chr3
cp fix_new_447.py chr4
cp fix_new_447.py chr5
cp fix_new_447.py chr6
cp fix_new_447.py chr7
cp fix_new_447.py chr8
cp fix_new_447.py chr9
cp fix_new_447.py chr10
cp fix_new_447.py chr11
cp fix_new_447.py chr12
cp fix_new_447.py chr13
cp fix_new_447.py chr14
cp fix_new_447.py chr15
cp fix_new_447.py chr16
cp fix_new_447.py chr17
cp fix_new_447.py chr18
cp fix_new_447.py chr19
cp fix_new_447.py chr20
cp fix_new_447.py chr21
cp fix_new_447.py chr22
cp fix_new_447.py chrX
cp fix_new_447.py chrY

cp fix_chrom.py chr1
cp fix_chrom.py chr2
cp fix_chrom.py chr3
cp fix_chrom.py chr4
cp fix_chrom.py chr5
cp fix_chrom.py chr6
cp fix_chrom.py chr7
cp fix_chrom.py chr8
cp fix_chrom.py chr9
cp fix_chrom.py chr10
cp fix_chrom.py chr11
cp fix_chrom.py chr12
cp fix_chrom.py chr13
cp fix_chrom.py chr14
cp fix_chrom.py chr15
cp fix_chrom.py chr16
cp fix_chrom.py chr17
cp fix_chrom.py chr18
cp fix_chrom.py chr19
cp fix_chrom.py chr20
cp fix_chrom.py chr21
cp fix_chrom.py chr22
cp fix_chrom.py chrX
cp fix_chrom.py chrY


python make_cat.py

for file in cat*.sh;
do
    sbatch -p hbfraser $file
done

#python fix_chrom.py chr1
#python fix_chrom.py chr2
#python fix_chrom.py chr3
#python fix_chrom.py chr4
#python fix_chrom.py chr5
#python fix_chrom.py chr6
#python fix_chrom.py chr7
#python fix_chrom.py chr8
#python fix_chrom.py chr9
#python fix_chrom.py chr10
#python fix_chrom.py chr11
#python fix_chrom.py chr12
#python fix_chrom.py chr13
#python fix_chrom.py chr14
#python fix_chrom.py chr15
#python fix_chrom.py chr16
#python fix_chrom.py chr17
#python fix_chrom.py chr18
#python fix_chrom.py chr19
#python fix_chrom.py chr20
#python fix_chrom.py chr21
#python fix_chrom.py chr22
#python fix_chrom.py chrX
#python fix_chrom.py chrY
