cat ../chr1/chr1.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr10/chr10.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr11/chr11.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr12/chr12.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr13/chr13.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr14/chr14.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr15/chr15.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr16/chr16.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr17/chr17.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr18/chr18.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr19/chr19.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr2/chr2.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr20/chr20.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr21/chr21.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr22/chr22.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr3/chr3.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr4/chr4.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr5/chr5.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr6/chr6.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr7/chr7.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr8/chr8.MskHum.PhyloP.PhastCons.SpecSup.bed ../chr9/chr9.MskHum.PhyloP.PhastCons.SpecSup.bed ../chrX/chrX.MskHum.PhyloP.PhastCons.SpecSup.bed ../chrY/chrY.MskHum.PhyloP.PhastCons.SpecSup.bed > All.MskHum.PhyloP.PhastCons.SpecSup.bed

bedtools intersect -sorted -wao -a ../MskHum/Old/Variants/HumChp_Mis_Final.bed -b All.MskHum.PhyloP.PhastCons.SpecSup.bed > HumChp_Mis_Final_NewPhyloP447.bed
bedtools intersect -sorted -wao -a ../MskHum/Old/Variants/HumPoly_Mis_Final.bed -b All.MskHum.PhyloP.PhastCons.SpecSup.bed > HumPoly_Mis_Final_NewPhyloP447.bed
bedtools intersect -sorted -wao -a ../MskHum/Old/Variants/HumChp_Syn_Final.bed -b All.MskHum.PhyloP.PhastCons.SpecSup.bed > HumChp_Syn_Final_NewPhyloP447.bed
bedtools intersect -sorted -wao -a ../MskHum/Old/Variants/HumPoly_Syn_Final.bed -b All.MskHum.PhyloP.PhastCons.SpecSup.bed > HumPoly_Syn_Final_NewPhyloP447.bed
bedtools intersect -sorted -wao -a ../MskHum/Old/Variants/HumChp_UTR_Final.bed -b All.MskHum.PhyloP.PhastCons.SpecSup.bed > HumChp_UTR_Final_NewPhyloP447.bed
bedtools intersect -sorted -wao -a ../MskHum/Old/Variants/HumPoly_UTR_Final.bed -b All.MskHum.PhyloP.PhastCons.SpecSup.bed > HumPoly_UTR_Final_NewPhyloP447.bed
bedtools intersect -sorted -wao -a ../MskHum/Old/Variants/HumChp_NC_Final_Rmdup_CREs_NoHLA.bed -b All.MskHum.PhyloP.PhastCons.SpecSup.bed > HumChp_NC_Final_Rmdup_CREs_NoHLA_NewPhyloP447.bed
bedtools intersect -sorted -wao -a ../MskHum/Old/Variants/HumPoly_NC_Final_CREs_NoHLA.bed -b All.MskHum.PhyloP.PhastCons.SpecSup.bed > HumPoly_NC_Final_CREs_NoHLA_NewPhyloP447.bed

python reformat_447.py HumChp_Mis_Final_NewPhyloP447.bed
python reformat_447.py HumPoly_Mis_Final_NewPhyloP447.bed
python reformat_447.py HumChp_UTR_Final_NewPhyloP447.bed
python reformat_447.py HumPoly_UTR_Final_NewPhyloP447.bed
python reformat_447.py HumChp_Syn_Final_NewPhyloP447.bed
python reformat_447.py HumPoly_Syn_Final_NewPhyloP447.bed
python reformat_447.py HumChp_NC_Final_Rmdup_CREs_NoHLA_NewPhyloP447.bed
python reformat_447.py HumPoly_NC_Final_CREs_NoHLA_NewPhyloP447.bed