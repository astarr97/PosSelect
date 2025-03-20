#Example command to intersect with every TF's predictions
sort -k1,1 -k2,2n human_referenced_chp_hum_snps_sorted.PanPan3.whitelist.bed > human_referenced_chp_hum_snps_sorted.PanPan3.whitelist.sort.bed

for file in *_ms.bed;
do
    bedtools intersect -wa -wb -sorted -a $file -b human_referenced_chp_hum_snps_sorted.PanPan3.whitelist.sort.bed > $file.snps.bed
done

#Example command to prepare the whitelist for the joining process.  This was done once for each species
python process_lifted_snps.py human_referenced_chp_hum_snps_sorted.PanPan3.whitelist.bed
sort -k1,1 human_referenced_chp_hum_snps_sorted.PanPan3.whitelist.proc.bed > human_referenced_chp_hum_snps_sorted.PanPan3.whitelist.procsort.bed

#Example command to process bonobo to the point it is ready to join the human-chimpanzee list
#This was done for each species for each TF
#MA0822.1_HES7_cut-2597
sort -k10,10 MA0822.1_HES7_cut-2597_bonobo_ms.bed.snps.bed > MA0822.1_HES7_cut-2597_bonobo_ms.bed.snps.sort.bed
python process_tfbs.py MA0822.1_HES7_cut-2597_bonobo_ms.bed.snps.sort.bed
sort -k1,1 MA0822.1_HES7_cut-2597_bonobo_ms.snps.proc.bed > MA0822.1_HES7_cut-2597_bonobo_ms.snps.procsort.bed
join human_referenced_chp_hum_snps_sorted.PanPan3.whitelist.procsort.bed MA0822.1_HES7_cut-2597_bonobo_ms.snps.procsort.bed > MA0822.1_HES7_cut-2597_bonobo_ms.snps.join.bed
python hc_to_bed.py MA0822.1_HES7_cut-2597_bonobo_ms.snps.join.bed

#Here is an example of what was done to the chimpanzee SNPs
#This is more involved as it has the initial joining with human
#MA0722.1_VAX1_cut384
sort -k10,10 MA0722.1_VAX1_cut384_chimp_ms.bed.snps.bed > MA0722.1_VAX1_cut384_chimp_ms.bed.snps.sort.bed
python process_tfbs.py MA0722.1_VAX1_cut384_chimp_ms.bed.snps.sort.bed
sort -k1,1 MA0722.1_VAX1_cut384_chimp_ms.snps.proc.bed > MA0722.1_VAX1_cut384_chimp_ms.snps.procsort.bed
join human_referenced_chp_hum_snps_sorted.PanTro6.whitelist.procsort.bed MA0722.1_VAX1_cut384_chimp_ms.snps.procsort.bed > MA0722.1_VAX1_cut384_chimp_ms.snps.join.bed
python hc_to_bed.py MA0722.1_VAX1_cut384_chimp_ms.snps.join.bed
python rearrange.py MA0722.1_VAX1_cut384_human_ms.bed.snps.bed
sort -k1,1 -k2,2n MA0722.1_VAX1_cut384_human_ms.rear.bed.snps.rear.bed > MA0722.1_VAX1_cut384_human_ms.bed.snps.sort.bed
python process_tfbs_hum.py MA0722.1_VAX1_cut384_human_ms.bed.snps.sort.bed
sort -k1,1 MA0722.1_VAX1_cut384_human_ms.snps.proc.bed > MA0722.1_VAX1_cut384_human_ms.snps.proc.sort.bed
join MA0722.1_VAX1_cut384_human_ms.snps.proc.sort.bed MA0722.1_VAX1_cut384_chimp_ms.snps.join.actual.bed -a1 -a2 > MA0722.1_VAX1_cut384_hum_chp.snps.almost.txt
python process_after_intersect.py MA0722.1_VAX1_cut384_hum_chp.snps.almost.txt
mv MA0722.1_VAX1_cut384_hum_chp.snps.txt processed

#Example command to complete the process by joining all the human, chimp, bonobo, gorilla, orangutan, and rhesus predictions
#We used "commands_pre.sh" as a template
#MA1985.1_ZNF669_cut-581
sort -k1,1 ../human_chimp/processed/MA1985.1_ZNF669_cut-581_hum_chp.snps.txt > MA1985.1_ZNF669_cut-581_hum_chp.snps.sort.txt
join MA1985.1_ZNF669_cut-581_hum_chp.snps.sort.txt ../process_bon/processed/MA1985.1_ZNF669_cut-581_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1985.1_ZNF669_cut-581_hum_chp_bon.pre.snps.txt
python reformat.py MA1985.1_ZNF669_cut-581_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1985.1_ZNF669_cut-581_hum_chp_bon.snps.txt > MA1985.1_ZNF669_cut-581_hum_chp_bon.snps.sort.txt
join MA1985.1_ZNF669_cut-581_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1985.1_ZNF669_cut-581_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1985.1_ZNF669_cut-581_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1985.1_ZNF669_cut-581_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1985.1_ZNF669_cut-581_hum_chp_bon_gor.snps.txt > MA1985.1_ZNF669_cut-581_hum_chp_bon_gor.snps.sort.txt
join MA1985.1_ZNF669_cut-581_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1985.1_ZNF669_cut-581_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org.snps.txt > MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org.snps.sort.txt
join MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1985.1_ZNF669_cut-581_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org_rhe.snps.txt > MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1985.1_ZNF669_cut-581_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
