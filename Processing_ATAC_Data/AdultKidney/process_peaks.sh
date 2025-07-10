#Downloaded peaks from here https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE262931
#Peaks were clustered into ubiquitous and cell type-specific by the initial authors
#We merged ubiquitous peaks with everything

for file in *.bed
do
    cat $file Ubiquitous_cluster.bed > ${file::-11}all.bed
    sort -k1,1 -k2,2n ${file::-11}all.bed > ${file::-11}all.sort.bed
    bedtools merge -i ${file::-11}all.sort.bed > ${file::-11}all.merged.bed
done
