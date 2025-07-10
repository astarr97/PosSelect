for file in *.csv
do
    mv $file ${file::-4}.narrowpeak
done

cp *.narrowpeak /oak/stanford/groups/hbfraser/astarr/ForMikeChromBPNet/Kundaje_Heart/Inputs
