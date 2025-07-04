for file in run*Anc*.sh;
do
    sbatch -p hbfraser $file
done
