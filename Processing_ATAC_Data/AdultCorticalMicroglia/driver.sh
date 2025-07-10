for file in pipeline*.sh;
do
    sbatch -p hbfraser $file
done