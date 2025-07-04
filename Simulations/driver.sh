for file in run_sims*.sh;
do
    echo $file
    sbatch -p hns,hbfraser $file
done
