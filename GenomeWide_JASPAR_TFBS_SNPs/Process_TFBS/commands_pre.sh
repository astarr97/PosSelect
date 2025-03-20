
sort -k1,1 ../human_chimp/processed/PREFIX_hum_chp.snps.txt > PREFIX_hum_chp.snps.sort.txt
join PREFIX_hum_chp.snps.sort.txt ../process_bon/processed/PREFIX_bonobo_ms.snps.join.actual.bed -a1 -a2 >  PREFIX_hum_chp_bon.pre.snps.txt
python reformat.py PREFIX_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 PREFIX_hum_chp_bon.snps.txt > PREFIX_hum_chp_bon.snps.sort.txt
join PREFIX_hum_chp_bon.snps.sort.txt ../process_gor/processed/PREFIX_gorilla_ms.snps.join.actual.bed -a1 -a2 >  PREFIX_hum_chp_bon_gor.pre.snps.txt
python reformat.py PREFIX_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 PREFIX_hum_chp_bon_gor.snps.txt > PREFIX_hum_chp_bon_gor.snps.sort.txt
join PREFIX_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/PREFIX_orangutan_ms.snps.join.actual.bed -a1 -a2 >  PREFIX_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py PREFIX_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 PREFIX_hum_chp_bon_gor_org.snps.txt > PREFIX_hum_chp_bon_gor_org.snps.sort.txt
join PREFIX_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/PREFIX_rhesus_ms.snps.join.actual.bed -a1 -a2 >  PREFIX_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py PREFIX_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 PREFIX_hum_chp_bon_gor_org_rhe.snps.txt > PREFIX_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv PREFIX_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done