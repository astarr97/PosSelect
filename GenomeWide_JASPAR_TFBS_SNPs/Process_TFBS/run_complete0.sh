#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --cores 1
#SBATCH --mem-per-cpu 16GB

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
#MA1724.1_Rfx6_cut20
sort -k1,1 ../human_chimp/processed/MA1724.1_Rfx6_cut20_hum_chp.snps.txt > MA1724.1_Rfx6_cut20_hum_chp.snps.sort.txt
join MA1724.1_Rfx6_cut20_hum_chp.snps.sort.txt ../process_bon/processed/MA1724.1_Rfx6_cut20_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1724.1_Rfx6_cut20_hum_chp_bon.pre.snps.txt
python reformat.py MA1724.1_Rfx6_cut20_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1724.1_Rfx6_cut20_hum_chp_bon.snps.txt > MA1724.1_Rfx6_cut20_hum_chp_bon.snps.sort.txt
join MA1724.1_Rfx6_cut20_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1724.1_Rfx6_cut20_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1724.1_Rfx6_cut20_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1724.1_Rfx6_cut20_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1724.1_Rfx6_cut20_hum_chp_bon_gor.snps.txt > MA1724.1_Rfx6_cut20_hum_chp_bon_gor.snps.sort.txt
join MA1724.1_Rfx6_cut20_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1724.1_Rfx6_cut20_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org.snps.txt > MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org.snps.sort.txt
join MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1724.1_Rfx6_cut20_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org_rhe.snps.txt > MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1724.1_Rfx6_cut20_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1606.1_Foxf1_cut146
sort -k1,1 ../human_chimp/processed/MA1606.1_Foxf1_cut146_hum_chp.snps.txt > MA1606.1_Foxf1_cut146_hum_chp.snps.sort.txt
join MA1606.1_Foxf1_cut146_hum_chp.snps.sort.txt ../process_bon/processed/MA1606.1_Foxf1_cut146_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1606.1_Foxf1_cut146_hum_chp_bon.pre.snps.txt
python reformat.py MA1606.1_Foxf1_cut146_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1606.1_Foxf1_cut146_hum_chp_bon.snps.txt > MA1606.1_Foxf1_cut146_hum_chp_bon.snps.sort.txt
join MA1606.1_Foxf1_cut146_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1606.1_Foxf1_cut146_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1606.1_Foxf1_cut146_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1606.1_Foxf1_cut146_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1606.1_Foxf1_cut146_hum_chp_bon_gor.snps.txt > MA1606.1_Foxf1_cut146_hum_chp_bon_gor.snps.sort.txt
join MA1606.1_Foxf1_cut146_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1606.1_Foxf1_cut146_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org.snps.txt > MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org.snps.sort.txt
join MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1606.1_Foxf1_cut146_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org_rhe.snps.txt > MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1606.1_Foxf1_cut146_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1537.1_NR2F1_cut-1392
sort -k1,1 ../human_chimp/processed/MA1537.1_NR2F1_cut-1392_hum_chp.snps.txt > MA1537.1_NR2F1_cut-1392_hum_chp.snps.sort.txt
join MA1537.1_NR2F1_cut-1392_hum_chp.snps.sort.txt ../process_bon/processed/MA1537.1_NR2F1_cut-1392_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1537.1_NR2F1_cut-1392_hum_chp_bon.pre.snps.txt
python reformat.py MA1537.1_NR2F1_cut-1392_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1537.1_NR2F1_cut-1392_hum_chp_bon.snps.txt > MA1537.1_NR2F1_cut-1392_hum_chp_bon.snps.sort.txt
join MA1537.1_NR2F1_cut-1392_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1537.1_NR2F1_cut-1392_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor.snps.txt > MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor.snps.sort.txt
join MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1537.1_NR2F1_cut-1392_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org.snps.txt > MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org.snps.sort.txt
join MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1537.1_NR2F1_cut-1392_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org_rhe.snps.txt > MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1537.1_NR2F1_cut-1392_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1150.1_RORB_cut223
sort -k1,1 ../human_chimp/processed/MA1150.1_RORB_cut223_hum_chp.snps.txt > MA1150.1_RORB_cut223_hum_chp.snps.sort.txt
join MA1150.1_RORB_cut223_hum_chp.snps.sort.txt ../process_bon/processed/MA1150.1_RORB_cut223_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1150.1_RORB_cut223_hum_chp_bon.pre.snps.txt
python reformat.py MA1150.1_RORB_cut223_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1150.1_RORB_cut223_hum_chp_bon.snps.txt > MA1150.1_RORB_cut223_hum_chp_bon.snps.sort.txt
join MA1150.1_RORB_cut223_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1150.1_RORB_cut223_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1150.1_RORB_cut223_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1150.1_RORB_cut223_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1150.1_RORB_cut223_hum_chp_bon_gor.snps.txt > MA1150.1_RORB_cut223_hum_chp_bon_gor.snps.sort.txt
join MA1150.1_RORB_cut223_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1150.1_RORB_cut223_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1150.1_RORB_cut223_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1150.1_RORB_cut223_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1150.1_RORB_cut223_hum_chp_bon_gor_org.snps.txt > MA1150.1_RORB_cut223_hum_chp_bon_gor_org.snps.sort.txt
join MA1150.1_RORB_cut223_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1150.1_RORB_cut223_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1150.1_RORB_cut223_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1150.1_RORB_cut223_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1150.1_RORB_cut223_hum_chp_bon_gor_org_rhe.snps.txt > MA1150.1_RORB_cut223_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1150.1_RORB_cut223_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1575.1_THRB_cut-1560
sort -k1,1 ../human_chimp/processed/MA1575.1_THRB_cut-1560_hum_chp.snps.txt > MA1575.1_THRB_cut-1560_hum_chp.snps.sort.txt
join MA1575.1_THRB_cut-1560_hum_chp.snps.sort.txt ../process_bon/processed/MA1575.1_THRB_cut-1560_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1575.1_THRB_cut-1560_hum_chp_bon.pre.snps.txt
python reformat.py MA1575.1_THRB_cut-1560_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1575.1_THRB_cut-1560_hum_chp_bon.snps.txt > MA1575.1_THRB_cut-1560_hum_chp_bon.snps.sort.txt
join MA1575.1_THRB_cut-1560_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1575.1_THRB_cut-1560_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1575.1_THRB_cut-1560_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1575.1_THRB_cut-1560_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1575.1_THRB_cut-1560_hum_chp_bon_gor.snps.txt > MA1575.1_THRB_cut-1560_hum_chp_bon_gor.snps.sort.txt
join MA1575.1_THRB_cut-1560_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1575.1_THRB_cut-1560_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org.snps.txt > MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org.snps.sort.txt
join MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1575.1_THRB_cut-1560_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org_rhe.snps.txt > MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1575.1_THRB_cut-1560_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1466.1_ATF6_cut-2345
sort -k1,1 ../human_chimp/processed/MA1466.1_ATF6_cut-2345_hum_chp.snps.txt > MA1466.1_ATF6_cut-2345_hum_chp.snps.sort.txt
join MA1466.1_ATF6_cut-2345_hum_chp.snps.sort.txt ../process_bon/processed/MA1466.1_ATF6_cut-2345_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1466.1_ATF6_cut-2345_hum_chp_bon.pre.snps.txt
python reformat.py MA1466.1_ATF6_cut-2345_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1466.1_ATF6_cut-2345_hum_chp_bon.snps.txt > MA1466.1_ATF6_cut-2345_hum_chp_bon.snps.sort.txt
join MA1466.1_ATF6_cut-2345_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1466.1_ATF6_cut-2345_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1466.1_ATF6_cut-2345_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1466.1_ATF6_cut-2345_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1466.1_ATF6_cut-2345_hum_chp_bon_gor.snps.txt > MA1466.1_ATF6_cut-2345_hum_chp_bon_gor.snps.sort.txt
join MA1466.1_ATF6_cut-2345_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1466.1_ATF6_cut-2345_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org.snps.txt > MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org.snps.sort.txt
join MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1466.1_ATF6_cut-2345_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org_rhe.snps.txt > MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1466.1_ATF6_cut-2345_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1649.1_ZBTB12_cut127
sort -k1,1 ../human_chimp/processed/MA1649.1_ZBTB12_cut127_hum_chp.snps.txt > MA1649.1_ZBTB12_cut127_hum_chp.snps.sort.txt
join MA1649.1_ZBTB12_cut127_hum_chp.snps.sort.txt ../process_bon/processed/MA1649.1_ZBTB12_cut127_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1649.1_ZBTB12_cut127_hum_chp_bon.pre.snps.txt
python reformat.py MA1649.1_ZBTB12_cut127_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1649.1_ZBTB12_cut127_hum_chp_bon.snps.txt > MA1649.1_ZBTB12_cut127_hum_chp_bon.snps.sort.txt
join MA1649.1_ZBTB12_cut127_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1649.1_ZBTB12_cut127_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1649.1_ZBTB12_cut127_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1649.1_ZBTB12_cut127_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1649.1_ZBTB12_cut127_hum_chp_bon_gor.snps.txt > MA1649.1_ZBTB12_cut127_hum_chp_bon_gor.snps.sort.txt
join MA1649.1_ZBTB12_cut127_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1649.1_ZBTB12_cut127_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org.snps.txt > MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org.snps.sort.txt
join MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1649.1_ZBTB12_cut127_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org_rhe.snps.txt > MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1649.1_ZBTB12_cut127_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1616.1_Prdm15_cut-92
sort -k1,1 ../human_chimp/processed/MA1616.1_Prdm15_cut-92_hum_chp.snps.txt > MA1616.1_Prdm15_cut-92_hum_chp.snps.sort.txt
join MA1616.1_Prdm15_cut-92_hum_chp.snps.sort.txt ../process_bon/processed/MA1616.1_Prdm15_cut-92_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1616.1_Prdm15_cut-92_hum_chp_bon.pre.snps.txt
python reformat.py MA1616.1_Prdm15_cut-92_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1616.1_Prdm15_cut-92_hum_chp_bon.snps.txt > MA1616.1_Prdm15_cut-92_hum_chp_bon.snps.sort.txt
join MA1616.1_Prdm15_cut-92_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1616.1_Prdm15_cut-92_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1616.1_Prdm15_cut-92_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1616.1_Prdm15_cut-92_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1616.1_Prdm15_cut-92_hum_chp_bon_gor.snps.txt > MA1616.1_Prdm15_cut-92_hum_chp_bon_gor.snps.sort.txt
join MA1616.1_Prdm15_cut-92_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1616.1_Prdm15_cut-92_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org.snps.txt > MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org.snps.sort.txt
join MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1616.1_Prdm15_cut-92_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org_rhe.snps.txt > MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1616.1_Prdm15_cut-92_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0660.1_MEF2B_cut-2125
sort -k1,1 ../human_chimp/processed/MA0660.1_MEF2B_cut-2125_hum_chp.snps.txt > MA0660.1_MEF2B_cut-2125_hum_chp.snps.sort.txt
join MA0660.1_MEF2B_cut-2125_hum_chp.snps.sort.txt ../process_bon/processed/MA0660.1_MEF2B_cut-2125_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0660.1_MEF2B_cut-2125_hum_chp_bon.pre.snps.txt
python reformat.py MA0660.1_MEF2B_cut-2125_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0660.1_MEF2B_cut-2125_hum_chp_bon.snps.txt > MA0660.1_MEF2B_cut-2125_hum_chp_bon.snps.sort.txt
join MA0660.1_MEF2B_cut-2125_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0660.1_MEF2B_cut-2125_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor.snps.txt > MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor.snps.sort.txt
join MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0660.1_MEF2B_cut-2125_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org.snps.txt > MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org.snps.sort.txt
join MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0660.1_MEF2B_cut-2125_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org_rhe.snps.txt > MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0660.1_MEF2B_cut-2125_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1117.1_RELB_cut140
sort -k1,1 ../human_chimp/processed/MA1117.1_RELB_cut140_hum_chp.snps.txt > MA1117.1_RELB_cut140_hum_chp.snps.sort.txt
join MA1117.1_RELB_cut140_hum_chp.snps.sort.txt ../process_bon/processed/MA1117.1_RELB_cut140_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1117.1_RELB_cut140_hum_chp_bon.pre.snps.txt
python reformat.py MA1117.1_RELB_cut140_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1117.1_RELB_cut140_hum_chp_bon.snps.txt > MA1117.1_RELB_cut140_hum_chp_bon.snps.sort.txt
join MA1117.1_RELB_cut140_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1117.1_RELB_cut140_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1117.1_RELB_cut140_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1117.1_RELB_cut140_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1117.1_RELB_cut140_hum_chp_bon_gor.snps.txt > MA1117.1_RELB_cut140_hum_chp_bon_gor.snps.sort.txt
join MA1117.1_RELB_cut140_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1117.1_RELB_cut140_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1117.1_RELB_cut140_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1117.1_RELB_cut140_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1117.1_RELB_cut140_hum_chp_bon_gor_org.snps.txt > MA1117.1_RELB_cut140_hum_chp_bon_gor_org.snps.sort.txt
join MA1117.1_RELB_cut140_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1117.1_RELB_cut140_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1117.1_RELB_cut140_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1117.1_RELB_cut140_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1117.1_RELB_cut140_hum_chp_bon_gor_org_rhe.snps.txt > MA1117.1_RELB_cut140_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1117.1_RELB_cut140_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0663.1_MLX_cut-963
sort -k1,1 ../human_chimp/processed/MA0663.1_MLX_cut-963_hum_chp.snps.txt > MA0663.1_MLX_cut-963_hum_chp.snps.sort.txt
join MA0663.1_MLX_cut-963_hum_chp.snps.sort.txt ../process_bon/processed/MA0663.1_MLX_cut-963_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0663.1_MLX_cut-963_hum_chp_bon.pre.snps.txt
python reformat.py MA0663.1_MLX_cut-963_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0663.1_MLX_cut-963_hum_chp_bon.snps.txt > MA0663.1_MLX_cut-963_hum_chp_bon.snps.sort.txt
join MA0663.1_MLX_cut-963_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0663.1_MLX_cut-963_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0663.1_MLX_cut-963_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0663.1_MLX_cut-963_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0663.1_MLX_cut-963_hum_chp_bon_gor.snps.txt > MA0663.1_MLX_cut-963_hum_chp_bon_gor.snps.sort.txt
join MA0663.1_MLX_cut-963_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0663.1_MLX_cut-963_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0663.1_MLX_cut-963_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0663.1_MLX_cut-963_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0663.1_MLX_cut-963_hum_chp_bon_gor_org.snps.txt > MA0663.1_MLX_cut-963_hum_chp_bon_gor_org.snps.sort.txt
join MA0663.1_MLX_cut-963_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0663.1_MLX_cut-963_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0663.1_MLX_cut-963_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0663.1_MLX_cut-963_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0663.1_MLX_cut-963_hum_chp_bon_gor_org_rhe.snps.txt > MA0663.1_MLX_cut-963_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0663.1_MLX_cut-963_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1476.2_Dlx5_cut86
sort -k1,1 ../human_chimp/processed/MA1476.2_Dlx5_cut86_hum_chp.snps.txt > MA1476.2_Dlx5_cut86_hum_chp.snps.sort.txt
join MA1476.2_Dlx5_cut86_hum_chp.snps.sort.txt ../process_bon/processed/MA1476.2_Dlx5_cut86_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1476.2_Dlx5_cut86_hum_chp_bon.pre.snps.txt
python reformat.py MA1476.2_Dlx5_cut86_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1476.2_Dlx5_cut86_hum_chp_bon.snps.txt > MA1476.2_Dlx5_cut86_hum_chp_bon.snps.sort.txt
join MA1476.2_Dlx5_cut86_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1476.2_Dlx5_cut86_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1476.2_Dlx5_cut86_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1476.2_Dlx5_cut86_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1476.2_Dlx5_cut86_hum_chp_bon_gor.snps.txt > MA1476.2_Dlx5_cut86_hum_chp_bon_gor.snps.sort.txt
join MA1476.2_Dlx5_cut86_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1476.2_Dlx5_cut86_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org.snps.txt > MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org.snps.sort.txt
join MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1476.2_Dlx5_cut86_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org_rhe.snps.txt > MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1476.2_Dlx5_cut86_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0749.1_ZBED1_cut-1803
sort -k1,1 ../human_chimp/processed/MA0749.1_ZBED1_cut-1803_hum_chp.snps.txt > MA0749.1_ZBED1_cut-1803_hum_chp.snps.sort.txt
join MA0749.1_ZBED1_cut-1803_hum_chp.snps.sort.txt ../process_bon/processed/MA0749.1_ZBED1_cut-1803_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0749.1_ZBED1_cut-1803_hum_chp_bon.pre.snps.txt
python reformat.py MA0749.1_ZBED1_cut-1803_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0749.1_ZBED1_cut-1803_hum_chp_bon.snps.txt > MA0749.1_ZBED1_cut-1803_hum_chp_bon.snps.sort.txt
join MA0749.1_ZBED1_cut-1803_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0749.1_ZBED1_cut-1803_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor.snps.txt > MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor.snps.sort.txt
join MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0749.1_ZBED1_cut-1803_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org.snps.txt > MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org.snps.sort.txt
join MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0749.1_ZBED1_cut-1803_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org_rhe.snps.txt > MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0749.1_ZBED1_cut-1803_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1464.1_ARNT2_cut-567
sort -k1,1 ../human_chimp/processed/MA1464.1_ARNT2_cut-567_hum_chp.snps.txt > MA1464.1_ARNT2_cut-567_hum_chp.snps.sort.txt
join MA1464.1_ARNT2_cut-567_hum_chp.snps.sort.txt ../process_bon/processed/MA1464.1_ARNT2_cut-567_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1464.1_ARNT2_cut-567_hum_chp_bon.pre.snps.txt
python reformat.py MA1464.1_ARNT2_cut-567_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1464.1_ARNT2_cut-567_hum_chp_bon.snps.txt > MA1464.1_ARNT2_cut-567_hum_chp_bon.snps.sort.txt
join MA1464.1_ARNT2_cut-567_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1464.1_ARNT2_cut-567_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1464.1_ARNT2_cut-567_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1464.1_ARNT2_cut-567_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1464.1_ARNT2_cut-567_hum_chp_bon_gor.snps.txt > MA1464.1_ARNT2_cut-567_hum_chp_bon_gor.snps.sort.txt
join MA1464.1_ARNT2_cut-567_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1464.1_ARNT2_cut-567_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org.snps.txt > MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org.snps.sort.txt
join MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1464.1_ARNT2_cut-567_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org_rhe.snps.txt > MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1464.1_ARNT2_cut-567_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1467.2_Atoh1_cut-51
sort -k1,1 ../human_chimp/processed/MA1467.2_Atoh1_cut-51_hum_chp.snps.txt > MA1467.2_Atoh1_cut-51_hum_chp.snps.sort.txt
join MA1467.2_Atoh1_cut-51_hum_chp.snps.sort.txt ../process_bon/processed/MA1467.2_Atoh1_cut-51_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1467.2_Atoh1_cut-51_hum_chp_bon.pre.snps.txt
python reformat.py MA1467.2_Atoh1_cut-51_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1467.2_Atoh1_cut-51_hum_chp_bon.snps.txt > MA1467.2_Atoh1_cut-51_hum_chp_bon.snps.sort.txt
join MA1467.2_Atoh1_cut-51_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1467.2_Atoh1_cut-51_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1467.2_Atoh1_cut-51_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1467.2_Atoh1_cut-51_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1467.2_Atoh1_cut-51_hum_chp_bon_gor.snps.txt > MA1467.2_Atoh1_cut-51_hum_chp_bon_gor.snps.sort.txt
join MA1467.2_Atoh1_cut-51_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1467.2_Atoh1_cut-51_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org.snps.txt > MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org.snps.sort.txt
join MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1467.2_Atoh1_cut-51_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org_rhe.snps.txt > MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1467.2_Atoh1_cut-51_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0609.2_CREM_cut62
sort -k1,1 ../human_chimp/processed/MA0609.2_CREM_cut62_hum_chp.snps.txt > MA0609.2_CREM_cut62_hum_chp.snps.sort.txt
join MA0609.2_CREM_cut62_hum_chp.snps.sort.txt ../process_bon/processed/MA0609.2_CREM_cut62_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0609.2_CREM_cut62_hum_chp_bon.pre.snps.txt
python reformat.py MA0609.2_CREM_cut62_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0609.2_CREM_cut62_hum_chp_bon.snps.txt > MA0609.2_CREM_cut62_hum_chp_bon.snps.sort.txt
join MA0609.2_CREM_cut62_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0609.2_CREM_cut62_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0609.2_CREM_cut62_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0609.2_CREM_cut62_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0609.2_CREM_cut62_hum_chp_bon_gor.snps.txt > MA0609.2_CREM_cut62_hum_chp_bon_gor.snps.sort.txt
join MA0609.2_CREM_cut62_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0609.2_CREM_cut62_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0609.2_CREM_cut62_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0609.2_CREM_cut62_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0609.2_CREM_cut62_hum_chp_bon_gor_org.snps.txt > MA0609.2_CREM_cut62_hum_chp_bon_gor_org.snps.sort.txt
join MA0609.2_CREM_cut62_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0609.2_CREM_cut62_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0609.2_CREM_cut62_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0609.2_CREM_cut62_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0609.2_CREM_cut62_hum_chp_bon_gor_org_rhe.snps.txt > MA0609.2_CREM_cut62_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0609.2_CREM_cut62_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0807.1_TBX5_cut247
sort -k1,1 ../human_chimp/processed/MA0807.1_TBX5_cut247_hum_chp.snps.txt > MA0807.1_TBX5_cut247_hum_chp.snps.sort.txt
join MA0807.1_TBX5_cut247_hum_chp.snps.sort.txt ../process_bon/processed/MA0807.1_TBX5_cut247_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0807.1_TBX5_cut247_hum_chp_bon.pre.snps.txt
python reformat.py MA0807.1_TBX5_cut247_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0807.1_TBX5_cut247_hum_chp_bon.snps.txt > MA0807.1_TBX5_cut247_hum_chp_bon.snps.sort.txt
join MA0807.1_TBX5_cut247_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0807.1_TBX5_cut247_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0807.1_TBX5_cut247_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0807.1_TBX5_cut247_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0807.1_TBX5_cut247_hum_chp_bon_gor.snps.txt > MA0807.1_TBX5_cut247_hum_chp_bon_gor.snps.sort.txt
join MA0807.1_TBX5_cut247_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0807.1_TBX5_cut247_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0807.1_TBX5_cut247_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0807.1_TBX5_cut247_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0807.1_TBX5_cut247_hum_chp_bon_gor_org.snps.txt > MA0807.1_TBX5_cut247_hum_chp_bon_gor_org.snps.sort.txt
join MA0807.1_TBX5_cut247_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0807.1_TBX5_cut247_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0807.1_TBX5_cut247_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0807.1_TBX5_cut247_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0807.1_TBX5_cut247_hum_chp_bon_gor_org_rhe.snps.txt > MA0807.1_TBX5_cut247_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0807.1_TBX5_cut247_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0161.2_NFIC_cut89
sort -k1,1 ../human_chimp/processed/MA0161.2_NFIC_cut89_hum_chp.snps.txt > MA0161.2_NFIC_cut89_hum_chp.snps.sort.txt
join MA0161.2_NFIC_cut89_hum_chp.snps.sort.txt ../process_bon/processed/MA0161.2_NFIC_cut89_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0161.2_NFIC_cut89_hum_chp_bon.pre.snps.txt
python reformat.py MA0161.2_NFIC_cut89_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0161.2_NFIC_cut89_hum_chp_bon.snps.txt > MA0161.2_NFIC_cut89_hum_chp_bon.snps.sort.txt
join MA0161.2_NFIC_cut89_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0161.2_NFIC_cut89_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0161.2_NFIC_cut89_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0161.2_NFIC_cut89_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0161.2_NFIC_cut89_hum_chp_bon_gor.snps.txt > MA0161.2_NFIC_cut89_hum_chp_bon_gor.snps.sort.txt
join MA0161.2_NFIC_cut89_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0161.2_NFIC_cut89_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0161.2_NFIC_cut89_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0161.2_NFIC_cut89_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0161.2_NFIC_cut89_hum_chp_bon_gor_org.snps.txt > MA0161.2_NFIC_cut89_hum_chp_bon_gor_org.snps.sort.txt
join MA0161.2_NFIC_cut89_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0161.2_NFIC_cut89_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0161.2_NFIC_cut89_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0161.2_NFIC_cut89_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0161.2_NFIC_cut89_hum_chp_bon_gor_org_rhe.snps.txt > MA0161.2_NFIC_cut89_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0161.2_NFIC_cut89_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1559.1_SNAI3_cut-764
sort -k1,1 ../human_chimp/processed/MA1559.1_SNAI3_cut-764_hum_chp.snps.txt > MA1559.1_SNAI3_cut-764_hum_chp.snps.sort.txt
join MA1559.1_SNAI3_cut-764_hum_chp.snps.sort.txt ../process_bon/processed/MA1559.1_SNAI3_cut-764_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1559.1_SNAI3_cut-764_hum_chp_bon.pre.snps.txt
python reformat.py MA1559.1_SNAI3_cut-764_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1559.1_SNAI3_cut-764_hum_chp_bon.snps.txt > MA1559.1_SNAI3_cut-764_hum_chp_bon.snps.sort.txt
join MA1559.1_SNAI3_cut-764_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1559.1_SNAI3_cut-764_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1559.1_SNAI3_cut-764_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1559.1_SNAI3_cut-764_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1559.1_SNAI3_cut-764_hum_chp_bon_gor.snps.txt > MA1559.1_SNAI3_cut-764_hum_chp_bon_gor.snps.sort.txt
join MA1559.1_SNAI3_cut-764_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1559.1_SNAI3_cut-764_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org.snps.txt > MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org.snps.sort.txt
join MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1559.1_SNAI3_cut-764_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org_rhe.snps.txt > MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1559.1_SNAI3_cut-764_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0505.2_Nr5A2_cut-149
sort -k1,1 ../human_chimp/processed/MA0505.2_Nr5A2_cut-149_hum_chp.snps.txt > MA0505.2_Nr5A2_cut-149_hum_chp.snps.sort.txt
join MA0505.2_Nr5A2_cut-149_hum_chp.snps.sort.txt ../process_bon/processed/MA0505.2_Nr5A2_cut-149_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0505.2_Nr5A2_cut-149_hum_chp_bon.pre.snps.txt
python reformat.py MA0505.2_Nr5A2_cut-149_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0505.2_Nr5A2_cut-149_hum_chp_bon.snps.txt > MA0505.2_Nr5A2_cut-149_hum_chp_bon.snps.sort.txt
join MA0505.2_Nr5A2_cut-149_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0505.2_Nr5A2_cut-149_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor.snps.txt > MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor.snps.sort.txt
join MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0505.2_Nr5A2_cut-149_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org.snps.txt > MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org.snps.sort.txt
join MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0505.2_Nr5A2_cut-149_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org_rhe.snps.txt > MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0505.2_Nr5A2_cut-149_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0119.1_NFIC::TLX1_cut-29441
sort -k1,1 ../human_chimp/processed/MA0119.1_NFIC::TLX1_cut-29441_hum_chp.snps.txt > MA0119.1_NFIC::TLX1_cut-29441_hum_chp.snps.sort.txt
join MA0119.1_NFIC::TLX1_cut-29441_hum_chp.snps.sort.txt ../process_bon/processed/MA0119.1_NFIC::TLX1_cut-29441_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon.pre.snps.txt
python reformat.py MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon.snps.txt > MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon.snps.sort.txt
join MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0119.1_NFIC::TLX1_cut-29441_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor.snps.txt > MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor.snps.sort.txt
join MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0119.1_NFIC::TLX1_cut-29441_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org.snps.txt > MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org.snps.sort.txt
join MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0119.1_NFIC::TLX1_cut-29441_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org_rhe.snps.txt > MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0119.1_NFIC::TLX1_cut-29441_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0014.3_PAX5_cut19
sort -k1,1 ../human_chimp/processed/MA0014.3_PAX5_cut19_hum_chp.snps.txt > MA0014.3_PAX5_cut19_hum_chp.snps.sort.txt
join MA0014.3_PAX5_cut19_hum_chp.snps.sort.txt ../process_bon/processed/MA0014.3_PAX5_cut19_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0014.3_PAX5_cut19_hum_chp_bon.pre.snps.txt
python reformat.py MA0014.3_PAX5_cut19_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0014.3_PAX5_cut19_hum_chp_bon.snps.txt > MA0014.3_PAX5_cut19_hum_chp_bon.snps.sort.txt
join MA0014.3_PAX5_cut19_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0014.3_PAX5_cut19_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0014.3_PAX5_cut19_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0014.3_PAX5_cut19_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0014.3_PAX5_cut19_hum_chp_bon_gor.snps.txt > MA0014.3_PAX5_cut19_hum_chp_bon_gor.snps.sort.txt
join MA0014.3_PAX5_cut19_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0014.3_PAX5_cut19_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0014.3_PAX5_cut19_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0014.3_PAX5_cut19_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0014.3_PAX5_cut19_hum_chp_bon_gor_org.snps.txt > MA0014.3_PAX5_cut19_hum_chp_bon_gor_org.snps.sort.txt
join MA0014.3_PAX5_cut19_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0014.3_PAX5_cut19_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0014.3_PAX5_cut19_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0014.3_PAX5_cut19_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0014.3_PAX5_cut19_hum_chp_bon_gor_org_rhe.snps.txt > MA0014.3_PAX5_cut19_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0014.3_PAX5_cut19_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1564.1_SP9_cut-199
sort -k1,1 ../human_chimp/processed/MA1564.1_SP9_cut-199_hum_chp.snps.txt > MA1564.1_SP9_cut-199_hum_chp.snps.sort.txt
join MA1564.1_SP9_cut-199_hum_chp.snps.sort.txt ../process_bon/processed/MA1564.1_SP9_cut-199_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1564.1_SP9_cut-199_hum_chp_bon.pre.snps.txt
python reformat.py MA1564.1_SP9_cut-199_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1564.1_SP9_cut-199_hum_chp_bon.snps.txt > MA1564.1_SP9_cut-199_hum_chp_bon.snps.sort.txt
join MA1564.1_SP9_cut-199_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1564.1_SP9_cut-199_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1564.1_SP9_cut-199_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1564.1_SP9_cut-199_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1564.1_SP9_cut-199_hum_chp_bon_gor.snps.txt > MA1564.1_SP9_cut-199_hum_chp_bon_gor.snps.sort.txt
join MA1564.1_SP9_cut-199_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1564.1_SP9_cut-199_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1564.1_SP9_cut-199_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1564.1_SP9_cut-199_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1564.1_SP9_cut-199_hum_chp_bon_gor_org.snps.txt > MA1564.1_SP9_cut-199_hum_chp_bon_gor_org.snps.sort.txt
join MA1564.1_SP9_cut-199_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1564.1_SP9_cut-199_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1564.1_SP9_cut-199_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1564.1_SP9_cut-199_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1564.1_SP9_cut-199_hum_chp_bon_gor_org_rhe.snps.txt > MA1564.1_SP9_cut-199_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1564.1_SP9_cut-199_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0765.3_ETV5_cut-977
sort -k1,1 ../human_chimp/processed/MA0765.3_ETV5_cut-977_hum_chp.snps.txt > MA0765.3_ETV5_cut-977_hum_chp.snps.sort.txt
join MA0765.3_ETV5_cut-977_hum_chp.snps.sort.txt ../process_bon/processed/MA0765.3_ETV5_cut-977_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0765.3_ETV5_cut-977_hum_chp_bon.pre.snps.txt
python reformat.py MA0765.3_ETV5_cut-977_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0765.3_ETV5_cut-977_hum_chp_bon.snps.txt > MA0765.3_ETV5_cut-977_hum_chp_bon.snps.sort.txt
join MA0765.3_ETV5_cut-977_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0765.3_ETV5_cut-977_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0765.3_ETV5_cut-977_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0765.3_ETV5_cut-977_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0765.3_ETV5_cut-977_hum_chp_bon_gor.snps.txt > MA0765.3_ETV5_cut-977_hum_chp_bon_gor.snps.sort.txt
join MA0765.3_ETV5_cut-977_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0765.3_ETV5_cut-977_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org.snps.txt > MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org.snps.sort.txt
join MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0765.3_ETV5_cut-977_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org_rhe.snps.txt > MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0765.3_ETV5_cut-977_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0848.1_FOXO4_cut21
sort -k1,1 ../human_chimp/processed/MA0848.1_FOXO4_cut21_hum_chp.snps.txt > MA0848.1_FOXO4_cut21_hum_chp.snps.sort.txt
join MA0848.1_FOXO4_cut21_hum_chp.snps.sort.txt ../process_bon/processed/MA0848.1_FOXO4_cut21_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0848.1_FOXO4_cut21_hum_chp_bon.pre.snps.txt
python reformat.py MA0848.1_FOXO4_cut21_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0848.1_FOXO4_cut21_hum_chp_bon.snps.txt > MA0848.1_FOXO4_cut21_hum_chp_bon.snps.sort.txt
join MA0848.1_FOXO4_cut21_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0848.1_FOXO4_cut21_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0848.1_FOXO4_cut21_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0848.1_FOXO4_cut21_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0848.1_FOXO4_cut21_hum_chp_bon_gor.snps.txt > MA0848.1_FOXO4_cut21_hum_chp_bon_gor.snps.sort.txt
join MA0848.1_FOXO4_cut21_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0848.1_FOXO4_cut21_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org.snps.txt > MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org.snps.sort.txt
join MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0848.1_FOXO4_cut21_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org_rhe.snps.txt > MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0848.1_FOXO4_cut21_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1708.1_ETV7_cut-301
sort -k1,1 ../human_chimp/processed/MA1708.1_ETV7_cut-301_hum_chp.snps.txt > MA1708.1_ETV7_cut-301_hum_chp.snps.sort.txt
join MA1708.1_ETV7_cut-301_hum_chp.snps.sort.txt ../process_bon/processed/MA1708.1_ETV7_cut-301_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1708.1_ETV7_cut-301_hum_chp_bon.pre.snps.txt
python reformat.py MA1708.1_ETV7_cut-301_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1708.1_ETV7_cut-301_hum_chp_bon.snps.txt > MA1708.1_ETV7_cut-301_hum_chp_bon.snps.sort.txt
join MA1708.1_ETV7_cut-301_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1708.1_ETV7_cut-301_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1708.1_ETV7_cut-301_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1708.1_ETV7_cut-301_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1708.1_ETV7_cut-301_hum_chp_bon_gor.snps.txt > MA1708.1_ETV7_cut-301_hum_chp_bon_gor.snps.sort.txt
join MA1708.1_ETV7_cut-301_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1708.1_ETV7_cut-301_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org.snps.txt > MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org.snps.sort.txt
join MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1708.1_ETV7_cut-301_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org_rhe.snps.txt > MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1708.1_ETV7_cut-301_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0508.3_PRDM1_cut19
sort -k1,1 ../human_chimp/processed/MA0508.3_PRDM1_cut19_hum_chp.snps.txt > MA0508.3_PRDM1_cut19_hum_chp.snps.sort.txt
join MA0508.3_PRDM1_cut19_hum_chp.snps.sort.txt ../process_bon/processed/MA0508.3_PRDM1_cut19_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0508.3_PRDM1_cut19_hum_chp_bon.pre.snps.txt
python reformat.py MA0508.3_PRDM1_cut19_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0508.3_PRDM1_cut19_hum_chp_bon.snps.txt > MA0508.3_PRDM1_cut19_hum_chp_bon.snps.sort.txt
join MA0508.3_PRDM1_cut19_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0508.3_PRDM1_cut19_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0508.3_PRDM1_cut19_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0508.3_PRDM1_cut19_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0508.3_PRDM1_cut19_hum_chp_bon_gor.snps.txt > MA0508.3_PRDM1_cut19_hum_chp_bon_gor.snps.sort.txt
join MA0508.3_PRDM1_cut19_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0508.3_PRDM1_cut19_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org.snps.txt > MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org.snps.sort.txt
join MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0508.3_PRDM1_cut19_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org_rhe.snps.txt > MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0508.3_PRDM1_cut19_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0914.1_ISL2_cut332
sort -k1,1 ../human_chimp/processed/MA0914.1_ISL2_cut332_hum_chp.snps.txt > MA0914.1_ISL2_cut332_hum_chp.snps.sort.txt
join MA0914.1_ISL2_cut332_hum_chp.snps.sort.txt ../process_bon/processed/MA0914.1_ISL2_cut332_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0914.1_ISL2_cut332_hum_chp_bon.pre.snps.txt
python reformat.py MA0914.1_ISL2_cut332_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0914.1_ISL2_cut332_hum_chp_bon.snps.txt > MA0914.1_ISL2_cut332_hum_chp_bon.snps.sort.txt
join MA0914.1_ISL2_cut332_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0914.1_ISL2_cut332_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0914.1_ISL2_cut332_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0914.1_ISL2_cut332_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0914.1_ISL2_cut332_hum_chp_bon_gor.snps.txt > MA0914.1_ISL2_cut332_hum_chp_bon_gor.snps.sort.txt
join MA0914.1_ISL2_cut332_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0914.1_ISL2_cut332_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0914.1_ISL2_cut332_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0914.1_ISL2_cut332_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0914.1_ISL2_cut332_hum_chp_bon_gor_org.snps.txt > MA0914.1_ISL2_cut332_hum_chp_bon_gor_org.snps.sort.txt
join MA0914.1_ISL2_cut332_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0914.1_ISL2_cut332_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0914.1_ISL2_cut332_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0914.1_ISL2_cut332_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0914.1_ISL2_cut332_hum_chp_bon_gor_org_rhe.snps.txt > MA0914.1_ISL2_cut332_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0914.1_ISL2_cut332_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1123.2_TWIST1_cut18
sort -k1,1 ../human_chimp/processed/MA1123.2_TWIST1_cut18_hum_chp.snps.txt > MA1123.2_TWIST1_cut18_hum_chp.snps.sort.txt
join MA1123.2_TWIST1_cut18_hum_chp.snps.sort.txt ../process_bon/processed/MA1123.2_TWIST1_cut18_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1123.2_TWIST1_cut18_hum_chp_bon.pre.snps.txt
python reformat.py MA1123.2_TWIST1_cut18_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1123.2_TWIST1_cut18_hum_chp_bon.snps.txt > MA1123.2_TWIST1_cut18_hum_chp_bon.snps.sort.txt
join MA1123.2_TWIST1_cut18_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1123.2_TWIST1_cut18_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1123.2_TWIST1_cut18_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1123.2_TWIST1_cut18_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1123.2_TWIST1_cut18_hum_chp_bon_gor.snps.txt > MA1123.2_TWIST1_cut18_hum_chp_bon_gor.snps.sort.txt
join MA1123.2_TWIST1_cut18_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1123.2_TWIST1_cut18_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org.snps.txt > MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org.snps.sort.txt
join MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1123.2_TWIST1_cut18_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org_rhe.snps.txt > MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1123.2_TWIST1_cut18_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0081.2_SPIB_cut-215
sort -k1,1 ../human_chimp/processed/MA0081.2_SPIB_cut-215_hum_chp.snps.txt > MA0081.2_SPIB_cut-215_hum_chp.snps.sort.txt
join MA0081.2_SPIB_cut-215_hum_chp.snps.sort.txt ../process_bon/processed/MA0081.2_SPIB_cut-215_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0081.2_SPIB_cut-215_hum_chp_bon.pre.snps.txt
python reformat.py MA0081.2_SPIB_cut-215_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0081.2_SPIB_cut-215_hum_chp_bon.snps.txt > MA0081.2_SPIB_cut-215_hum_chp_bon.snps.sort.txt
join MA0081.2_SPIB_cut-215_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0081.2_SPIB_cut-215_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0081.2_SPIB_cut-215_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0081.2_SPIB_cut-215_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0081.2_SPIB_cut-215_hum_chp_bon_gor.snps.txt > MA0081.2_SPIB_cut-215_hum_chp_bon_gor.snps.sort.txt
join MA0081.2_SPIB_cut-215_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0081.2_SPIB_cut-215_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org.snps.txt > MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org.snps.sort.txt
join MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0081.2_SPIB_cut-215_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org_rhe.snps.txt > MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0081.2_SPIB_cut-215_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0838.1_CEBPG_cut-543
sort -k1,1 ../human_chimp/processed/MA0838.1_CEBPG_cut-543_hum_chp.snps.txt > MA0838.1_CEBPG_cut-543_hum_chp.snps.sort.txt
join MA0838.1_CEBPG_cut-543_hum_chp.snps.sort.txt ../process_bon/processed/MA0838.1_CEBPG_cut-543_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0838.1_CEBPG_cut-543_hum_chp_bon.pre.snps.txt
python reformat.py MA0838.1_CEBPG_cut-543_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0838.1_CEBPG_cut-543_hum_chp_bon.snps.txt > MA0838.1_CEBPG_cut-543_hum_chp_bon.snps.sort.txt
join MA0838.1_CEBPG_cut-543_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0838.1_CEBPG_cut-543_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0838.1_CEBPG_cut-543_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0838.1_CEBPG_cut-543_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0838.1_CEBPG_cut-543_hum_chp_bon_gor.snps.txt > MA0838.1_CEBPG_cut-543_hum_chp_bon_gor.snps.sort.txt
join MA0838.1_CEBPG_cut-543_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0838.1_CEBPG_cut-543_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org.snps.txt > MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org.snps.sort.txt
join MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0838.1_CEBPG_cut-543_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org_rhe.snps.txt > MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0838.1_CEBPG_cut-543_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0473.3_ELF1_cut-83
sort -k1,1 ../human_chimp/processed/MA0473.3_ELF1_cut-83_hum_chp.snps.txt > MA0473.3_ELF1_cut-83_hum_chp.snps.sort.txt
join MA0473.3_ELF1_cut-83_hum_chp.snps.sort.txt ../process_bon/processed/MA0473.3_ELF1_cut-83_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0473.3_ELF1_cut-83_hum_chp_bon.pre.snps.txt
python reformat.py MA0473.3_ELF1_cut-83_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0473.3_ELF1_cut-83_hum_chp_bon.snps.txt > MA0473.3_ELF1_cut-83_hum_chp_bon.snps.sort.txt
join MA0473.3_ELF1_cut-83_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0473.3_ELF1_cut-83_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0473.3_ELF1_cut-83_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0473.3_ELF1_cut-83_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0473.3_ELF1_cut-83_hum_chp_bon_gor.snps.txt > MA0473.3_ELF1_cut-83_hum_chp_bon_gor.snps.sort.txt
join MA0473.3_ELF1_cut-83_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0473.3_ELF1_cut-83_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org.snps.txt > MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org.snps.sort.txt
join MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0473.3_ELF1_cut-83_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org_rhe.snps.txt > MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0473.3_ELF1_cut-83_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1977.1_ZNF324_cut-612
sort -k1,1 ../human_chimp/processed/MA1977.1_ZNF324_cut-612_hum_chp.snps.txt > MA1977.1_ZNF324_cut-612_hum_chp.snps.sort.txt
join MA1977.1_ZNF324_cut-612_hum_chp.snps.sort.txt ../process_bon/processed/MA1977.1_ZNF324_cut-612_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1977.1_ZNF324_cut-612_hum_chp_bon.pre.snps.txt
python reformat.py MA1977.1_ZNF324_cut-612_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1977.1_ZNF324_cut-612_hum_chp_bon.snps.txt > MA1977.1_ZNF324_cut-612_hum_chp_bon.snps.sort.txt
join MA1977.1_ZNF324_cut-612_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1977.1_ZNF324_cut-612_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1977.1_ZNF324_cut-612_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1977.1_ZNF324_cut-612_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1977.1_ZNF324_cut-612_hum_chp_bon_gor.snps.txt > MA1977.1_ZNF324_cut-612_hum_chp_bon_gor.snps.sort.txt
join MA1977.1_ZNF324_cut-612_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1977.1_ZNF324_cut-612_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org.snps.txt > MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org.snps.sort.txt
join MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1977.1_ZNF324_cut-612_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org_rhe.snps.txt > MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1977.1_ZNF324_cut-612_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0665.1_MSC_cut-9899
sort -k1,1 ../human_chimp/processed/MA0665.1_MSC_cut-9899_hum_chp.snps.txt > MA0665.1_MSC_cut-9899_hum_chp.snps.sort.txt
join MA0665.1_MSC_cut-9899_hum_chp.snps.sort.txt ../process_bon/processed/MA0665.1_MSC_cut-9899_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0665.1_MSC_cut-9899_hum_chp_bon.pre.snps.txt
python reformat.py MA0665.1_MSC_cut-9899_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0665.1_MSC_cut-9899_hum_chp_bon.snps.txt > MA0665.1_MSC_cut-9899_hum_chp_bon.snps.sort.txt
join MA0665.1_MSC_cut-9899_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0665.1_MSC_cut-9899_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0665.1_MSC_cut-9899_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0665.1_MSC_cut-9899_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0665.1_MSC_cut-9899_hum_chp_bon_gor.snps.txt > MA0665.1_MSC_cut-9899_hum_chp_bon_gor.snps.sort.txt
join MA0665.1_MSC_cut-9899_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0665.1_MSC_cut-9899_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org.snps.txt > MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org.snps.sort.txt
join MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0665.1_MSC_cut-9899_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org_rhe.snps.txt > MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0665.1_MSC_cut-9899_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0515.1_Sox6_cut-10009
sort -k1,1 ../human_chimp/processed/MA0515.1_Sox6_cut-10009_hum_chp.snps.txt > MA0515.1_Sox6_cut-10009_hum_chp.snps.sort.txt
join MA0515.1_Sox6_cut-10009_hum_chp.snps.sort.txt ../process_bon/processed/MA0515.1_Sox6_cut-10009_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0515.1_Sox6_cut-10009_hum_chp_bon.pre.snps.txt
python reformat.py MA0515.1_Sox6_cut-10009_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0515.1_Sox6_cut-10009_hum_chp_bon.snps.txt > MA0515.1_Sox6_cut-10009_hum_chp_bon.snps.sort.txt
join MA0515.1_Sox6_cut-10009_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0515.1_Sox6_cut-10009_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0515.1_Sox6_cut-10009_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0515.1_Sox6_cut-10009_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0515.1_Sox6_cut-10009_hum_chp_bon_gor.snps.txt > MA0515.1_Sox6_cut-10009_hum_chp_bon_gor.snps.sort.txt
join MA0515.1_Sox6_cut-10009_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0515.1_Sox6_cut-10009_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org.snps.txt > MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org.snps.sort.txt
join MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0515.1_Sox6_cut-10009_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org_rhe.snps.txt > MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0515.1_Sox6_cut-10009_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0709.1_Msx3_cut166
sort -k1,1 ../human_chimp/processed/MA0709.1_Msx3_cut166_hum_chp.snps.txt > MA0709.1_Msx3_cut166_hum_chp.snps.sort.txt
join MA0709.1_Msx3_cut166_hum_chp.snps.sort.txt ../process_bon/processed/MA0709.1_Msx3_cut166_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0709.1_Msx3_cut166_hum_chp_bon.pre.snps.txt
python reformat.py MA0709.1_Msx3_cut166_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0709.1_Msx3_cut166_hum_chp_bon.snps.txt > MA0709.1_Msx3_cut166_hum_chp_bon.snps.sort.txt
join MA0709.1_Msx3_cut166_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0709.1_Msx3_cut166_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0709.1_Msx3_cut166_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0709.1_Msx3_cut166_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0709.1_Msx3_cut166_hum_chp_bon_gor.snps.txt > MA0709.1_Msx3_cut166_hum_chp_bon_gor.snps.sort.txt
join MA0709.1_Msx3_cut166_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0709.1_Msx3_cut166_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0709.1_Msx3_cut166_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0709.1_Msx3_cut166_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0709.1_Msx3_cut166_hum_chp_bon_gor_org.snps.txt > MA0709.1_Msx3_cut166_hum_chp_bon_gor_org.snps.sort.txt
join MA0709.1_Msx3_cut166_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0709.1_Msx3_cut166_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0709.1_Msx3_cut166_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0709.1_Msx3_cut166_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0709.1_Msx3_cut166_hum_chp_bon_gor_org_rhe.snps.txt > MA0709.1_Msx3_cut166_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0709.1_Msx3_cut166_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0775.1_MEIS3_cut155
sort -k1,1 ../human_chimp/processed/MA0775.1_MEIS3_cut155_hum_chp.snps.txt > MA0775.1_MEIS3_cut155_hum_chp.snps.sort.txt
join MA0775.1_MEIS3_cut155_hum_chp.snps.sort.txt ../process_bon/processed/MA0775.1_MEIS3_cut155_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0775.1_MEIS3_cut155_hum_chp_bon.pre.snps.txt
python reformat.py MA0775.1_MEIS3_cut155_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0775.1_MEIS3_cut155_hum_chp_bon.snps.txt > MA0775.1_MEIS3_cut155_hum_chp_bon.snps.sort.txt
join MA0775.1_MEIS3_cut155_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0775.1_MEIS3_cut155_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0775.1_MEIS3_cut155_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0775.1_MEIS3_cut155_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0775.1_MEIS3_cut155_hum_chp_bon_gor.snps.txt > MA0775.1_MEIS3_cut155_hum_chp_bon_gor.snps.sort.txt
join MA0775.1_MEIS3_cut155_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0775.1_MEIS3_cut155_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org.snps.txt > MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org.snps.sort.txt
join MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0775.1_MEIS3_cut155_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org_rhe.snps.txt > MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0775.1_MEIS3_cut155_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1954.1_FOXO1::ELK1_cut-347
sort -k1,1 ../human_chimp/processed/MA1954.1_FOXO1::ELK1_cut-347_hum_chp.snps.txt > MA1954.1_FOXO1::ELK1_cut-347_hum_chp.snps.sort.txt
join MA1954.1_FOXO1::ELK1_cut-347_hum_chp.snps.sort.txt ../process_bon/processed/MA1954.1_FOXO1::ELK1_cut-347_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon.pre.snps.txt
python reformat.py MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon.snps.txt > MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon.snps.sort.txt
join MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1954.1_FOXO1::ELK1_cut-347_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor.snps.txt > MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor.snps.sort.txt
join MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1954.1_FOXO1::ELK1_cut-347_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org.snps.txt > MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org.snps.sort.txt
join MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1954.1_FOXO1::ELK1_cut-347_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org_rhe.snps.txt > MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1954.1_FOXO1::ELK1_cut-347_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1709.1_ZIM3_cut-399
sort -k1,1 ../human_chimp/processed/MA1709.1_ZIM3_cut-399_hum_chp.snps.txt > MA1709.1_ZIM3_cut-399_hum_chp.snps.sort.txt
join MA1709.1_ZIM3_cut-399_hum_chp.snps.sort.txt ../process_bon/processed/MA1709.1_ZIM3_cut-399_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1709.1_ZIM3_cut-399_hum_chp_bon.pre.snps.txt
python reformat.py MA1709.1_ZIM3_cut-399_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1709.1_ZIM3_cut-399_hum_chp_bon.snps.txt > MA1709.1_ZIM3_cut-399_hum_chp_bon.snps.sort.txt
join MA1709.1_ZIM3_cut-399_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1709.1_ZIM3_cut-399_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1709.1_ZIM3_cut-399_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1709.1_ZIM3_cut-399_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1709.1_ZIM3_cut-399_hum_chp_bon_gor.snps.txt > MA1709.1_ZIM3_cut-399_hum_chp_bon_gor.snps.sort.txt
join MA1709.1_ZIM3_cut-399_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1709.1_ZIM3_cut-399_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org.snps.txt > MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org.snps.sort.txt
join MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1709.1_ZIM3_cut-399_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org_rhe.snps.txt > MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1709.1_ZIM3_cut-399_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0780.1_PAX3_cut-519
sort -k1,1 ../human_chimp/processed/MA0780.1_PAX3_cut-519_hum_chp.snps.txt > MA0780.1_PAX3_cut-519_hum_chp.snps.sort.txt
join MA0780.1_PAX3_cut-519_hum_chp.snps.sort.txt ../process_bon/processed/MA0780.1_PAX3_cut-519_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0780.1_PAX3_cut-519_hum_chp_bon.pre.snps.txt
python reformat.py MA0780.1_PAX3_cut-519_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0780.1_PAX3_cut-519_hum_chp_bon.snps.txt > MA0780.1_PAX3_cut-519_hum_chp_bon.snps.sort.txt
join MA0780.1_PAX3_cut-519_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0780.1_PAX3_cut-519_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0780.1_PAX3_cut-519_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0780.1_PAX3_cut-519_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0780.1_PAX3_cut-519_hum_chp_bon_gor.snps.txt > MA0780.1_PAX3_cut-519_hum_chp_bon_gor.snps.sort.txt
join MA0780.1_PAX3_cut-519_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0780.1_PAX3_cut-519_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org.snps.txt > MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org.snps.sort.txt
join MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0780.1_PAX3_cut-519_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org_rhe.snps.txt > MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0780.1_PAX3_cut-519_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1936.1_ERF::FOXO1_cut-323
sort -k1,1 ../human_chimp/processed/MA1936.1_ERF::FOXO1_cut-323_hum_chp.snps.txt > MA1936.1_ERF::FOXO1_cut-323_hum_chp.snps.sort.txt
join MA1936.1_ERF::FOXO1_cut-323_hum_chp.snps.sort.txt ../process_bon/processed/MA1936.1_ERF::FOXO1_cut-323_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon.pre.snps.txt
python reformat.py MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon.snps.txt > MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon.snps.sort.txt
join MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1936.1_ERF::FOXO1_cut-323_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor.snps.txt > MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor.snps.sort.txt
join MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1936.1_ERF::FOXO1_cut-323_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org.snps.txt > MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org.snps.sort.txt
join MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1936.1_ERF::FOXO1_cut-323_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org_rhe.snps.txt > MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1936.1_ERF::FOXO1_cut-323_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1988.1_Atf3_cut119
sort -k1,1 ../human_chimp/processed/MA1988.1_Atf3_cut119_hum_chp.snps.txt > MA1988.1_Atf3_cut119_hum_chp.snps.sort.txt
join MA1988.1_Atf3_cut119_hum_chp.snps.sort.txt ../process_bon/processed/MA1988.1_Atf3_cut119_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1988.1_Atf3_cut119_hum_chp_bon.pre.snps.txt
python reformat.py MA1988.1_Atf3_cut119_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1988.1_Atf3_cut119_hum_chp_bon.snps.txt > MA1988.1_Atf3_cut119_hum_chp_bon.snps.sort.txt
join MA1988.1_Atf3_cut119_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1988.1_Atf3_cut119_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1988.1_Atf3_cut119_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1988.1_Atf3_cut119_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1988.1_Atf3_cut119_hum_chp_bon_gor.snps.txt > MA1988.1_Atf3_cut119_hum_chp_bon_gor.snps.sort.txt
join MA1988.1_Atf3_cut119_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1988.1_Atf3_cut119_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1988.1_Atf3_cut119_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1988.1_Atf3_cut119_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1988.1_Atf3_cut119_hum_chp_bon_gor_org.snps.txt > MA1988.1_Atf3_cut119_hum_chp_bon_gor_org.snps.sort.txt
join MA1988.1_Atf3_cut119_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1988.1_Atf3_cut119_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1988.1_Atf3_cut119_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1988.1_Atf3_cut119_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1988.1_Atf3_cut119_hum_chp_bon_gor_org_rhe.snps.txt > MA1988.1_Atf3_cut119_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1988.1_Atf3_cut119_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1498.2_HOXA7_cut397
sort -k1,1 ../human_chimp/processed/MA1498.2_HOXA7_cut397_hum_chp.snps.txt > MA1498.2_HOXA7_cut397_hum_chp.snps.sort.txt
join MA1498.2_HOXA7_cut397_hum_chp.snps.sort.txt ../process_bon/processed/MA1498.2_HOXA7_cut397_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1498.2_HOXA7_cut397_hum_chp_bon.pre.snps.txt
python reformat.py MA1498.2_HOXA7_cut397_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1498.2_HOXA7_cut397_hum_chp_bon.snps.txt > MA1498.2_HOXA7_cut397_hum_chp_bon.snps.sort.txt
join MA1498.2_HOXA7_cut397_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1498.2_HOXA7_cut397_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1498.2_HOXA7_cut397_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1498.2_HOXA7_cut397_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1498.2_HOXA7_cut397_hum_chp_bon_gor.snps.txt > MA1498.2_HOXA7_cut397_hum_chp_bon_gor.snps.sort.txt
join MA1498.2_HOXA7_cut397_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1498.2_HOXA7_cut397_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org.snps.txt > MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org.snps.sort.txt
join MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1498.2_HOXA7_cut397_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org_rhe.snps.txt > MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1498.2_HOXA7_cut397_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1657.1_ZNF652_cut-1
sort -k1,1 ../human_chimp/processed/MA1657.1_ZNF652_cut-1_hum_chp.snps.txt > MA1657.1_ZNF652_cut-1_hum_chp.snps.sort.txt
join MA1657.1_ZNF652_cut-1_hum_chp.snps.sort.txt ../process_bon/processed/MA1657.1_ZNF652_cut-1_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1657.1_ZNF652_cut-1_hum_chp_bon.pre.snps.txt
python reformat.py MA1657.1_ZNF652_cut-1_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1657.1_ZNF652_cut-1_hum_chp_bon.snps.txt > MA1657.1_ZNF652_cut-1_hum_chp_bon.snps.sort.txt
join MA1657.1_ZNF652_cut-1_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1657.1_ZNF652_cut-1_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1657.1_ZNF652_cut-1_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1657.1_ZNF652_cut-1_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1657.1_ZNF652_cut-1_hum_chp_bon_gor.snps.txt > MA1657.1_ZNF652_cut-1_hum_chp_bon_gor.snps.sort.txt
join MA1657.1_ZNF652_cut-1_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1657.1_ZNF652_cut-1_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org.snps.txt > MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org.snps.sort.txt
join MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1657.1_ZNF652_cut-1_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org_rhe.snps.txt > MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1657.1_ZNF652_cut-1_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0702.2_LMX1A_cut-1740
sort -k1,1 ../human_chimp/processed/MA0702.2_LMX1A_cut-1740_hum_chp.snps.txt > MA0702.2_LMX1A_cut-1740_hum_chp.snps.sort.txt
join MA0702.2_LMX1A_cut-1740_hum_chp.snps.sort.txt ../process_bon/processed/MA0702.2_LMX1A_cut-1740_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0702.2_LMX1A_cut-1740_hum_chp_bon.pre.snps.txt
python reformat.py MA0702.2_LMX1A_cut-1740_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0702.2_LMX1A_cut-1740_hum_chp_bon.snps.txt > MA0702.2_LMX1A_cut-1740_hum_chp_bon.snps.sort.txt
join MA0702.2_LMX1A_cut-1740_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0702.2_LMX1A_cut-1740_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor.snps.txt > MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor.snps.sort.txt
join MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0702.2_LMX1A_cut-1740_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org.snps.txt > MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org.snps.sort.txt
join MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0702.2_LMX1A_cut-1740_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org_rhe.snps.txt > MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0702.2_LMX1A_cut-1740_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0075.3_PRRX2_cut-998
sort -k1,1 ../human_chimp/processed/MA0075.3_PRRX2_cut-998_hum_chp.snps.txt > MA0075.3_PRRX2_cut-998_hum_chp.snps.sort.txt
join MA0075.3_PRRX2_cut-998_hum_chp.snps.sort.txt ../process_bon/processed/MA0075.3_PRRX2_cut-998_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0075.3_PRRX2_cut-998_hum_chp_bon.pre.snps.txt
python reformat.py MA0075.3_PRRX2_cut-998_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0075.3_PRRX2_cut-998_hum_chp_bon.snps.txt > MA0075.3_PRRX2_cut-998_hum_chp_bon.snps.sort.txt
join MA0075.3_PRRX2_cut-998_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0075.3_PRRX2_cut-998_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0075.3_PRRX2_cut-998_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0075.3_PRRX2_cut-998_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0075.3_PRRX2_cut-998_hum_chp_bon_gor.snps.txt > MA0075.3_PRRX2_cut-998_hum_chp_bon_gor.snps.sort.txt
join MA0075.3_PRRX2_cut-998_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0075.3_PRRX2_cut-998_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org.snps.txt > MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org.snps.sort.txt
join MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0075.3_PRRX2_cut-998_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org_rhe.snps.txt > MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0075.3_PRRX2_cut-998_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0519.1_Stat5a::Stat5b_cut-9654
sort -k1,1 ../human_chimp/processed/MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp.snps.txt > MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp.snps.sort.txt
join MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp.snps.sort.txt ../process_bon/processed/MA0519.1_Stat5a::Stat5b_cut-9654_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon.pre.snps.txt
python reformat.py MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon.snps.txt > MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon.snps.sort.txt
join MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0519.1_Stat5a::Stat5b_cut-9654_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor.snps.txt > MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor.snps.sort.txt
join MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0519.1_Stat5a::Stat5b_cut-9654_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org.snps.txt > MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org.snps.sort.txt
join MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0519.1_Stat5a::Stat5b_cut-9654_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org_rhe.snps.txt > MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0519.1_Stat5a::Stat5b_cut-9654_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1653.1_ZNF148_cut-320
sort -k1,1 ../human_chimp/processed/MA1653.1_ZNF148_cut-320_hum_chp.snps.txt > MA1653.1_ZNF148_cut-320_hum_chp.snps.sort.txt
join MA1653.1_ZNF148_cut-320_hum_chp.snps.sort.txt ../process_bon/processed/MA1653.1_ZNF148_cut-320_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1653.1_ZNF148_cut-320_hum_chp_bon.pre.snps.txt
python reformat.py MA1653.1_ZNF148_cut-320_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1653.1_ZNF148_cut-320_hum_chp_bon.snps.txt > MA1653.1_ZNF148_cut-320_hum_chp_bon.snps.sort.txt
join MA1653.1_ZNF148_cut-320_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1653.1_ZNF148_cut-320_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1653.1_ZNF148_cut-320_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1653.1_ZNF148_cut-320_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1653.1_ZNF148_cut-320_hum_chp_bon_gor.snps.txt > MA1653.1_ZNF148_cut-320_hum_chp_bon_gor.snps.sort.txt
join MA1653.1_ZNF148_cut-320_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1653.1_ZNF148_cut-320_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org.snps.txt > MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org.snps.sort.txt
join MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1653.1_ZNF148_cut-320_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org_rhe.snps.txt > MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1653.1_ZNF148_cut-320_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0814.2_TFAP2C_cut-80
sort -k1,1 ../human_chimp/processed/MA0814.2_TFAP2C_cut-80_hum_chp.snps.txt > MA0814.2_TFAP2C_cut-80_hum_chp.snps.sort.txt
join MA0814.2_TFAP2C_cut-80_hum_chp.snps.sort.txt ../process_bon/processed/MA0814.2_TFAP2C_cut-80_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0814.2_TFAP2C_cut-80_hum_chp_bon.pre.snps.txt
python reformat.py MA0814.2_TFAP2C_cut-80_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0814.2_TFAP2C_cut-80_hum_chp_bon.snps.txt > MA0814.2_TFAP2C_cut-80_hum_chp_bon.snps.sort.txt
join MA0814.2_TFAP2C_cut-80_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0814.2_TFAP2C_cut-80_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor.snps.txt > MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor.snps.sort.txt
join MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0814.2_TFAP2C_cut-80_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org.snps.txt > MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org.snps.sort.txt
join MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0814.2_TFAP2C_cut-80_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org_rhe.snps.txt > MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0814.2_TFAP2C_cut-80_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1114.1_PBX3_cut-51
sort -k1,1 ../human_chimp/processed/MA1114.1_PBX3_cut-51_hum_chp.snps.txt > MA1114.1_PBX3_cut-51_hum_chp.snps.sort.txt
join MA1114.1_PBX3_cut-51_hum_chp.snps.sort.txt ../process_bon/processed/MA1114.1_PBX3_cut-51_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1114.1_PBX3_cut-51_hum_chp_bon.pre.snps.txt
python reformat.py MA1114.1_PBX3_cut-51_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1114.1_PBX3_cut-51_hum_chp_bon.snps.txt > MA1114.1_PBX3_cut-51_hum_chp_bon.snps.sort.txt
join MA1114.1_PBX3_cut-51_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1114.1_PBX3_cut-51_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1114.1_PBX3_cut-51_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1114.1_PBX3_cut-51_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1114.1_PBX3_cut-51_hum_chp_bon_gor.snps.txt > MA1114.1_PBX3_cut-51_hum_chp_bon_gor.snps.sort.txt
join MA1114.1_PBX3_cut-51_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1114.1_PBX3_cut-51_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org.snps.txt > MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org.snps.sort.txt
join MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1114.1_PBX3_cut-51_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org_rhe.snps.txt > MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1114.1_PBX3_cut-51_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0074.1_RXRA::VDR_cut-29617
sort -k1,1 ../human_chimp/processed/MA0074.1_RXRA::VDR_cut-29617_hum_chp.snps.txt > MA0074.1_RXRA::VDR_cut-29617_hum_chp.snps.sort.txt
join MA0074.1_RXRA::VDR_cut-29617_hum_chp.snps.sort.txt ../process_bon/processed/MA0074.1_RXRA::VDR_cut-29617_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon.pre.snps.txt
python reformat.py MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon.snps.txt > MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon.snps.sort.txt
join MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0074.1_RXRA::VDR_cut-29617_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor.snps.txt > MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor.snps.sort.txt
join MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0074.1_RXRA::VDR_cut-29617_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org.snps.txt > MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org.snps.sort.txt
join MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0074.1_RXRA::VDR_cut-29617_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org_rhe.snps.txt > MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0074.1_RXRA::VDR_cut-29617_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0759.2_ELK3_cut-1104
sort -k1,1 ../human_chimp/processed/MA0759.2_ELK3_cut-1104_hum_chp.snps.txt > MA0759.2_ELK3_cut-1104_hum_chp.snps.sort.txt
join MA0759.2_ELK3_cut-1104_hum_chp.snps.sort.txt ../process_bon/processed/MA0759.2_ELK3_cut-1104_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0759.2_ELK3_cut-1104_hum_chp_bon.pre.snps.txt
python reformat.py MA0759.2_ELK3_cut-1104_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0759.2_ELK3_cut-1104_hum_chp_bon.snps.txt > MA0759.2_ELK3_cut-1104_hum_chp_bon.snps.sort.txt
join MA0759.2_ELK3_cut-1104_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0759.2_ELK3_cut-1104_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0759.2_ELK3_cut-1104_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0759.2_ELK3_cut-1104_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0759.2_ELK3_cut-1104_hum_chp_bon_gor.snps.txt > MA0759.2_ELK3_cut-1104_hum_chp_bon_gor.snps.sort.txt
join MA0759.2_ELK3_cut-1104_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0759.2_ELK3_cut-1104_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org.snps.txt > MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org.snps.sort.txt
join MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0759.2_ELK3_cut-1104_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org_rhe.snps.txt > MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0759.2_ELK3_cut-1104_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1519.1_LHX5_cut-9117
sort -k1,1 ../human_chimp/processed/MA1519.1_LHX5_cut-9117_hum_chp.snps.txt > MA1519.1_LHX5_cut-9117_hum_chp.snps.sort.txt
join MA1519.1_LHX5_cut-9117_hum_chp.snps.sort.txt ../process_bon/processed/MA1519.1_LHX5_cut-9117_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1519.1_LHX5_cut-9117_hum_chp_bon.pre.snps.txt
python reformat.py MA1519.1_LHX5_cut-9117_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1519.1_LHX5_cut-9117_hum_chp_bon.snps.txt > MA1519.1_LHX5_cut-9117_hum_chp_bon.snps.sort.txt
join MA1519.1_LHX5_cut-9117_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1519.1_LHX5_cut-9117_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1519.1_LHX5_cut-9117_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1519.1_LHX5_cut-9117_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1519.1_LHX5_cut-9117_hum_chp_bon_gor.snps.txt > MA1519.1_LHX5_cut-9117_hum_chp_bon_gor.snps.sort.txt
join MA1519.1_LHX5_cut-9117_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1519.1_LHX5_cut-9117_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org.snps.txt > MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org.snps.sort.txt
join MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1519.1_LHX5_cut-9117_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org_rhe.snps.txt > MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1519.1_LHX5_cut-9117_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0595.1_SREBF1_cut-19093
sort -k1,1 ../human_chimp/processed/MA0595.1_SREBF1_cut-19093_hum_chp.snps.txt > MA0595.1_SREBF1_cut-19093_hum_chp.snps.sort.txt
join MA0595.1_SREBF1_cut-19093_hum_chp.snps.sort.txt ../process_bon/processed/MA0595.1_SREBF1_cut-19093_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0595.1_SREBF1_cut-19093_hum_chp_bon.pre.snps.txt
python reformat.py MA0595.1_SREBF1_cut-19093_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0595.1_SREBF1_cut-19093_hum_chp_bon.snps.txt > MA0595.1_SREBF1_cut-19093_hum_chp_bon.snps.sort.txt
join MA0595.1_SREBF1_cut-19093_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0595.1_SREBF1_cut-19093_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor.snps.txt > MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor.snps.sort.txt
join MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0595.1_SREBF1_cut-19093_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org.snps.txt > MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org.snps.sort.txt
join MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0595.1_SREBF1_cut-19093_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org_rhe.snps.txt > MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0595.1_SREBF1_cut-19093_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0472.2_EGR2_cut-671
sort -k1,1 ../human_chimp/processed/MA0472.2_EGR2_cut-671_hum_chp.snps.txt > MA0472.2_EGR2_cut-671_hum_chp.snps.sort.txt
join MA0472.2_EGR2_cut-671_hum_chp.snps.sort.txt ../process_bon/processed/MA0472.2_EGR2_cut-671_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0472.2_EGR2_cut-671_hum_chp_bon.pre.snps.txt
python reformat.py MA0472.2_EGR2_cut-671_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0472.2_EGR2_cut-671_hum_chp_bon.snps.txt > MA0472.2_EGR2_cut-671_hum_chp_bon.snps.sort.txt
join MA0472.2_EGR2_cut-671_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0472.2_EGR2_cut-671_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0472.2_EGR2_cut-671_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0472.2_EGR2_cut-671_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0472.2_EGR2_cut-671_hum_chp_bon_gor.snps.txt > MA0472.2_EGR2_cut-671_hum_chp_bon_gor.snps.sort.txt
join MA0472.2_EGR2_cut-671_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0472.2_EGR2_cut-671_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org.snps.txt > MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org.snps.sort.txt
join MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0472.2_EGR2_cut-671_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org_rhe.snps.txt > MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0472.2_EGR2_cut-671_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1133.1_JUN::JUNB_cut138
sort -k1,1 ../human_chimp/processed/MA1133.1_JUN::JUNB_cut138_hum_chp.snps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp.snps.sort.txt
join MA1133.1_JUN::JUNB_cut138_hum_chp.snps.sort.txt ../process_bon/processed/MA1133.1_JUN::JUNB_cut138_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1133.1_JUN::JUNB_cut138_hum_chp_bon.pre.snps.txt
python reformat.py MA1133.1_JUN::JUNB_cut138_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1133.1_JUN::JUNB_cut138_hum_chp_bon.snps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp_bon.snps.sort.txt
join MA1133.1_JUN::JUNB_cut138_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1133.1_JUN::JUNB_cut138_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor.snps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor.snps.sort.txt
join MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1133.1_JUN::JUNB_cut138_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org.snps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org.snps.sort.txt
join MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1133.1_JUN::JUNB_cut138_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org_rhe.snps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1133.1_JUN::JUNB_cut138_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0896.1_Hmx1_cut-228
sort -k1,1 ../human_chimp/processed/MA0896.1_Hmx1_cut-228_hum_chp.snps.txt > MA0896.1_Hmx1_cut-228_hum_chp.snps.sort.txt
join MA0896.1_Hmx1_cut-228_hum_chp.snps.sort.txt ../process_bon/processed/MA0896.1_Hmx1_cut-228_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0896.1_Hmx1_cut-228_hum_chp_bon.pre.snps.txt
python reformat.py MA0896.1_Hmx1_cut-228_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0896.1_Hmx1_cut-228_hum_chp_bon.snps.txt > MA0896.1_Hmx1_cut-228_hum_chp_bon.snps.sort.txt
join MA0896.1_Hmx1_cut-228_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0896.1_Hmx1_cut-228_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0896.1_Hmx1_cut-228_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0896.1_Hmx1_cut-228_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0896.1_Hmx1_cut-228_hum_chp_bon_gor.snps.txt > MA0896.1_Hmx1_cut-228_hum_chp_bon_gor.snps.sort.txt
join MA0896.1_Hmx1_cut-228_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0896.1_Hmx1_cut-228_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org.snps.txt > MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org.snps.sort.txt
join MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0896.1_Hmx1_cut-228_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org_rhe.snps.txt > MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0896.1_Hmx1_cut-228_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0060.3_NFYA_cut-86
sort -k1,1 ../human_chimp/processed/MA0060.3_NFYA_cut-86_hum_chp.snps.txt > MA0060.3_NFYA_cut-86_hum_chp.snps.sort.txt
join MA0060.3_NFYA_cut-86_hum_chp.snps.sort.txt ../process_bon/processed/MA0060.3_NFYA_cut-86_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0060.3_NFYA_cut-86_hum_chp_bon.pre.snps.txt
python reformat.py MA0060.3_NFYA_cut-86_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0060.3_NFYA_cut-86_hum_chp_bon.snps.txt > MA0060.3_NFYA_cut-86_hum_chp_bon.snps.sort.txt
join MA0060.3_NFYA_cut-86_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0060.3_NFYA_cut-86_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0060.3_NFYA_cut-86_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0060.3_NFYA_cut-86_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0060.3_NFYA_cut-86_hum_chp_bon_gor.snps.txt > MA0060.3_NFYA_cut-86_hum_chp_bon_gor.snps.sort.txt
join MA0060.3_NFYA_cut-86_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0060.3_NFYA_cut-86_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org.snps.txt > MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org.snps.sort.txt
join MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0060.3_NFYA_cut-86_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org_rhe.snps.txt > MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0060.3_NFYA_cut-86_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0615.1_Gmeb1_cut163
sort -k1,1 ../human_chimp/processed/MA0615.1_Gmeb1_cut163_hum_chp.snps.txt > MA0615.1_Gmeb1_cut163_hum_chp.snps.sort.txt
join MA0615.1_Gmeb1_cut163_hum_chp.snps.sort.txt ../process_bon/processed/MA0615.1_Gmeb1_cut163_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0615.1_Gmeb1_cut163_hum_chp_bon.pre.snps.txt
python reformat.py MA0615.1_Gmeb1_cut163_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0615.1_Gmeb1_cut163_hum_chp_bon.snps.txt > MA0615.1_Gmeb1_cut163_hum_chp_bon.snps.sort.txt
join MA0615.1_Gmeb1_cut163_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0615.1_Gmeb1_cut163_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0615.1_Gmeb1_cut163_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0615.1_Gmeb1_cut163_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0615.1_Gmeb1_cut163_hum_chp_bon_gor.snps.txt > MA0615.1_Gmeb1_cut163_hum_chp_bon_gor.snps.sort.txt
join MA0615.1_Gmeb1_cut163_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0615.1_Gmeb1_cut163_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org.snps.txt > MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org.snps.sort.txt
join MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0615.1_Gmeb1_cut163_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org_rhe.snps.txt > MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0615.1_Gmeb1_cut163_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0101.1_REL_cut-52
sort -k1,1 ../human_chimp/processed/MA0101.1_REL_cut-52_hum_chp.snps.txt > MA0101.1_REL_cut-52_hum_chp.snps.sort.txt
join MA0101.1_REL_cut-52_hum_chp.snps.sort.txt ../process_bon/processed/MA0101.1_REL_cut-52_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0101.1_REL_cut-52_hum_chp_bon.pre.snps.txt
python reformat.py MA0101.1_REL_cut-52_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0101.1_REL_cut-52_hum_chp_bon.snps.txt > MA0101.1_REL_cut-52_hum_chp_bon.snps.sort.txt
join MA0101.1_REL_cut-52_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0101.1_REL_cut-52_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0101.1_REL_cut-52_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0101.1_REL_cut-52_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0101.1_REL_cut-52_hum_chp_bon_gor.snps.txt > MA0101.1_REL_cut-52_hum_chp_bon_gor.snps.sort.txt
join MA0101.1_REL_cut-52_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0101.1_REL_cut-52_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0101.1_REL_cut-52_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0101.1_REL_cut-52_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0101.1_REL_cut-52_hum_chp_bon_gor_org.snps.txt > MA0101.1_REL_cut-52_hum_chp_bon_gor_org.snps.sort.txt
join MA0101.1_REL_cut-52_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0101.1_REL_cut-52_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0101.1_REL_cut-52_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0101.1_REL_cut-52_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0101.1_REL_cut-52_hum_chp_bon_gor_org_rhe.snps.txt > MA0101.1_REL_cut-52_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0101.1_REL_cut-52_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0679.2_ONECUT1_cut-151
sort -k1,1 ../human_chimp/processed/MA0679.2_ONECUT1_cut-151_hum_chp.snps.txt > MA0679.2_ONECUT1_cut-151_hum_chp.snps.sort.txt
join MA0679.2_ONECUT1_cut-151_hum_chp.snps.sort.txt ../process_bon/processed/MA0679.2_ONECUT1_cut-151_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0679.2_ONECUT1_cut-151_hum_chp_bon.pre.snps.txt
python reformat.py MA0679.2_ONECUT1_cut-151_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0679.2_ONECUT1_cut-151_hum_chp_bon.snps.txt > MA0679.2_ONECUT1_cut-151_hum_chp_bon.snps.sort.txt
join MA0679.2_ONECUT1_cut-151_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0679.2_ONECUT1_cut-151_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor.snps.txt > MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor.snps.sort.txt
join MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0679.2_ONECUT1_cut-151_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org.snps.txt > MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org.snps.sort.txt
join MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0679.2_ONECUT1_cut-151_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org_rhe.snps.txt > MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0679.2_ONECUT1_cut-151_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0902.2_HOXB2_cut-9205
sort -k1,1 ../human_chimp/processed/MA0902.2_HOXB2_cut-9205_hum_chp.snps.txt > MA0902.2_HOXB2_cut-9205_hum_chp.snps.sort.txt
join MA0902.2_HOXB2_cut-9205_hum_chp.snps.sort.txt ../process_bon/processed/MA0902.2_HOXB2_cut-9205_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0902.2_HOXB2_cut-9205_hum_chp_bon.pre.snps.txt
python reformat.py MA0902.2_HOXB2_cut-9205_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0902.2_HOXB2_cut-9205_hum_chp_bon.snps.txt > MA0902.2_HOXB2_cut-9205_hum_chp_bon.snps.sort.txt
join MA0902.2_HOXB2_cut-9205_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0902.2_HOXB2_cut-9205_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor.snps.txt > MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor.snps.sort.txt
join MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0902.2_HOXB2_cut-9205_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org.snps.txt > MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org.snps.sort.txt
join MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0902.2_HOXB2_cut-9205_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org_rhe.snps.txt > MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0902.2_HOXB2_cut-9205_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0036.3_GATA2_cut75
sort -k1,1 ../human_chimp/processed/MA0036.3_GATA2_cut75_hum_chp.snps.txt > MA0036.3_GATA2_cut75_hum_chp.snps.sort.txt
join MA0036.3_GATA2_cut75_hum_chp.snps.sort.txt ../process_bon/processed/MA0036.3_GATA2_cut75_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0036.3_GATA2_cut75_hum_chp_bon.pre.snps.txt
python reformat.py MA0036.3_GATA2_cut75_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0036.3_GATA2_cut75_hum_chp_bon.snps.txt > MA0036.3_GATA2_cut75_hum_chp_bon.snps.sort.txt
join MA0036.3_GATA2_cut75_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0036.3_GATA2_cut75_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0036.3_GATA2_cut75_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0036.3_GATA2_cut75_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0036.3_GATA2_cut75_hum_chp_bon_gor.snps.txt > MA0036.3_GATA2_cut75_hum_chp_bon_gor.snps.sort.txt
join MA0036.3_GATA2_cut75_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0036.3_GATA2_cut75_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0036.3_GATA2_cut75_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0036.3_GATA2_cut75_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0036.3_GATA2_cut75_hum_chp_bon_gor_org.snps.txt > MA0036.3_GATA2_cut75_hum_chp_bon_gor_org.snps.sort.txt
join MA0036.3_GATA2_cut75_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0036.3_GATA2_cut75_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0036.3_GATA2_cut75_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0036.3_GATA2_cut75_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0036.3_GATA2_cut75_hum_chp_bon_gor_org_rhe.snps.txt > MA0036.3_GATA2_cut75_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0036.3_GATA2_cut75_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0771.1_HSF4_cut-222
sort -k1,1 ../human_chimp/processed/MA0771.1_HSF4_cut-222_hum_chp.snps.txt > MA0771.1_HSF4_cut-222_hum_chp.snps.sort.txt
join MA0771.1_HSF4_cut-222_hum_chp.snps.sort.txt ../process_bon/processed/MA0771.1_HSF4_cut-222_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0771.1_HSF4_cut-222_hum_chp_bon.pre.snps.txt
python reformat.py MA0771.1_HSF4_cut-222_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0771.1_HSF4_cut-222_hum_chp_bon.snps.txt > MA0771.1_HSF4_cut-222_hum_chp_bon.snps.sort.txt
join MA0771.1_HSF4_cut-222_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0771.1_HSF4_cut-222_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0771.1_HSF4_cut-222_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0771.1_HSF4_cut-222_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0771.1_HSF4_cut-222_hum_chp_bon_gor.snps.txt > MA0771.1_HSF4_cut-222_hum_chp_bon_gor.snps.sort.txt
join MA0771.1_HSF4_cut-222_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0771.1_HSF4_cut-222_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org.snps.txt > MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org.snps.sort.txt
join MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0771.1_HSF4_cut-222_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org_rhe.snps.txt > MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0771.1_HSF4_cut-222_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1957.1_HOXB2::ELK1_cut-828
sort -k1,1 ../human_chimp/processed/MA1957.1_HOXB2::ELK1_cut-828_hum_chp.snps.txt > MA1957.1_HOXB2::ELK1_cut-828_hum_chp.snps.sort.txt
join MA1957.1_HOXB2::ELK1_cut-828_hum_chp.snps.sort.txt ../process_bon/processed/MA1957.1_HOXB2::ELK1_cut-828_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon.pre.snps.txt
python reformat.py MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon.snps.txt > MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon.snps.sort.txt
join MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1957.1_HOXB2::ELK1_cut-828_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor.snps.txt > MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor.snps.sort.txt
join MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1957.1_HOXB2::ELK1_cut-828_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org.snps.txt > MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org.snps.sort.txt
join MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1957.1_HOXB2::ELK1_cut-828_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org_rhe.snps.txt > MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1957.1_HOXB2::ELK1_cut-828_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0857.1_Rarb_cut-4932
sort -k1,1 ../human_chimp/processed/MA0857.1_Rarb_cut-4932_hum_chp.snps.txt > MA0857.1_Rarb_cut-4932_hum_chp.snps.sort.txt
join MA0857.1_Rarb_cut-4932_hum_chp.snps.sort.txt ../process_bon/processed/MA0857.1_Rarb_cut-4932_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0857.1_Rarb_cut-4932_hum_chp_bon.pre.snps.txt
python reformat.py MA0857.1_Rarb_cut-4932_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0857.1_Rarb_cut-4932_hum_chp_bon.snps.txt > MA0857.1_Rarb_cut-4932_hum_chp_bon.snps.sort.txt
join MA0857.1_Rarb_cut-4932_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0857.1_Rarb_cut-4932_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0857.1_Rarb_cut-4932_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0857.1_Rarb_cut-4932_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0857.1_Rarb_cut-4932_hum_chp_bon_gor.snps.txt > MA0857.1_Rarb_cut-4932_hum_chp_bon_gor.snps.sort.txt
join MA0857.1_Rarb_cut-4932_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0857.1_Rarb_cut-4932_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org.snps.txt > MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org.snps.sort.txt
join MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0857.1_Rarb_cut-4932_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org_rhe.snps.txt > MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0857.1_Rarb_cut-4932_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0155.1_INSM1_cut-19309
sort -k1,1 ../human_chimp/processed/MA0155.1_INSM1_cut-19309_hum_chp.snps.txt > MA0155.1_INSM1_cut-19309_hum_chp.snps.sort.txt
join MA0155.1_INSM1_cut-19309_hum_chp.snps.sort.txt ../process_bon/processed/MA0155.1_INSM1_cut-19309_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0155.1_INSM1_cut-19309_hum_chp_bon.pre.snps.txt
python reformat.py MA0155.1_INSM1_cut-19309_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0155.1_INSM1_cut-19309_hum_chp_bon.snps.txt > MA0155.1_INSM1_cut-19309_hum_chp_bon.snps.sort.txt
join MA0155.1_INSM1_cut-19309_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0155.1_INSM1_cut-19309_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0155.1_INSM1_cut-19309_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0155.1_INSM1_cut-19309_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0155.1_INSM1_cut-19309_hum_chp_bon_gor.snps.txt > MA0155.1_INSM1_cut-19309_hum_chp_bon_gor.snps.sort.txt
join MA0155.1_INSM1_cut-19309_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0155.1_INSM1_cut-19309_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org.snps.txt > MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org.snps.sort.txt
join MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0155.1_INSM1_cut-19309_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org_rhe.snps.txt > MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0155.1_INSM1_cut-19309_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0132.2_PDX1_cut-9086
sort -k1,1 ../human_chimp/processed/MA0132.2_PDX1_cut-9086_hum_chp.snps.txt > MA0132.2_PDX1_cut-9086_hum_chp.snps.sort.txt
join MA0132.2_PDX1_cut-9086_hum_chp.snps.sort.txt ../process_bon/processed/MA0132.2_PDX1_cut-9086_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0132.2_PDX1_cut-9086_hum_chp_bon.pre.snps.txt
python reformat.py MA0132.2_PDX1_cut-9086_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0132.2_PDX1_cut-9086_hum_chp_bon.snps.txt > MA0132.2_PDX1_cut-9086_hum_chp_bon.snps.sort.txt
join MA0132.2_PDX1_cut-9086_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0132.2_PDX1_cut-9086_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0132.2_PDX1_cut-9086_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0132.2_PDX1_cut-9086_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0132.2_PDX1_cut-9086_hum_chp_bon_gor.snps.txt > MA0132.2_PDX1_cut-9086_hum_chp_bon_gor.snps.sort.txt
join MA0132.2_PDX1_cut-9086_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0132.2_PDX1_cut-9086_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org.snps.txt > MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org.snps.sort.txt
join MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0132.2_PDX1_cut-9086_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org_rhe.snps.txt > MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0132.2_PDX1_cut-9086_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0762.1_ETV2_cut-9860
sort -k1,1 ../human_chimp/processed/MA0762.1_ETV2_cut-9860_hum_chp.snps.txt > MA0762.1_ETV2_cut-9860_hum_chp.snps.sort.txt
join MA0762.1_ETV2_cut-9860_hum_chp.snps.sort.txt ../process_bon/processed/MA0762.1_ETV2_cut-9860_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0762.1_ETV2_cut-9860_hum_chp_bon.pre.snps.txt
python reformat.py MA0762.1_ETV2_cut-9860_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0762.1_ETV2_cut-9860_hum_chp_bon.snps.txt > MA0762.1_ETV2_cut-9860_hum_chp_bon.snps.sort.txt
join MA0762.1_ETV2_cut-9860_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0762.1_ETV2_cut-9860_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0762.1_ETV2_cut-9860_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0762.1_ETV2_cut-9860_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0762.1_ETV2_cut-9860_hum_chp_bon_gor.snps.txt > MA0762.1_ETV2_cut-9860_hum_chp_bon_gor.snps.sort.txt
join MA0762.1_ETV2_cut-9860_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0762.1_ETV2_cut-9860_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org.snps.txt > MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org.snps.sort.txt
join MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0762.1_ETV2_cut-9860_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org_rhe.snps.txt > MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0762.1_ETV2_cut-9860_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0873.1_HOXD12_cut-674
sort -k1,1 ../human_chimp/processed/MA0873.1_HOXD12_cut-674_hum_chp.snps.txt > MA0873.1_HOXD12_cut-674_hum_chp.snps.sort.txt
join MA0873.1_HOXD12_cut-674_hum_chp.snps.sort.txt ../process_bon/processed/MA0873.1_HOXD12_cut-674_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0873.1_HOXD12_cut-674_hum_chp_bon.pre.snps.txt
python reformat.py MA0873.1_HOXD12_cut-674_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0873.1_HOXD12_cut-674_hum_chp_bon.snps.txt > MA0873.1_HOXD12_cut-674_hum_chp_bon.snps.sort.txt
join MA0873.1_HOXD12_cut-674_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0873.1_HOXD12_cut-674_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0873.1_HOXD12_cut-674_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0873.1_HOXD12_cut-674_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0873.1_HOXD12_cut-674_hum_chp_bon_gor.snps.txt > MA0873.1_HOXD12_cut-674_hum_chp_bon_gor.snps.sort.txt
join MA0873.1_HOXD12_cut-674_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0873.1_HOXD12_cut-674_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org.snps.txt > MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org.snps.sort.txt
join MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0873.1_HOXD12_cut-674_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org_rhe.snps.txt > MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0873.1_HOXD12_cut-674_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1503.1_HOXB9_cut-9140
sort -k1,1 ../human_chimp/processed/MA1503.1_HOXB9_cut-9140_hum_chp.snps.txt > MA1503.1_HOXB9_cut-9140_hum_chp.snps.sort.txt
join MA1503.1_HOXB9_cut-9140_hum_chp.snps.sort.txt ../process_bon/processed/MA1503.1_HOXB9_cut-9140_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1503.1_HOXB9_cut-9140_hum_chp_bon.pre.snps.txt
python reformat.py MA1503.1_HOXB9_cut-9140_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1503.1_HOXB9_cut-9140_hum_chp_bon.snps.txt > MA1503.1_HOXB9_cut-9140_hum_chp_bon.snps.sort.txt
join MA1503.1_HOXB9_cut-9140_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1503.1_HOXB9_cut-9140_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor.snps.txt > MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor.snps.sort.txt
join MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1503.1_HOXB9_cut-9140_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org.snps.txt > MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org.snps.sort.txt
join MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1503.1_HOXB9_cut-9140_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org_rhe.snps.txt > MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1503.1_HOXB9_cut-9140_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1648.1_TCF12_cut123
sort -k1,1 ../human_chimp/processed/MA1648.1_TCF12_cut123_hum_chp.snps.txt > MA1648.1_TCF12_cut123_hum_chp.snps.sort.txt
join MA1648.1_TCF12_cut123_hum_chp.snps.sort.txt ../process_bon/processed/MA1648.1_TCF12_cut123_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1648.1_TCF12_cut123_hum_chp_bon.pre.snps.txt
python reformat.py MA1648.1_TCF12_cut123_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1648.1_TCF12_cut123_hum_chp_bon.snps.txt > MA1648.1_TCF12_cut123_hum_chp_bon.snps.sort.txt
join MA1648.1_TCF12_cut123_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1648.1_TCF12_cut123_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1648.1_TCF12_cut123_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1648.1_TCF12_cut123_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1648.1_TCF12_cut123_hum_chp_bon_gor.snps.txt > MA1648.1_TCF12_cut123_hum_chp_bon_gor.snps.sort.txt
join MA1648.1_TCF12_cut123_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1648.1_TCF12_cut123_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1648.1_TCF12_cut123_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1648.1_TCF12_cut123_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1648.1_TCF12_cut123_hum_chp_bon_gor_org.snps.txt > MA1648.1_TCF12_cut123_hum_chp_bon_gor_org.snps.sort.txt
join MA1648.1_TCF12_cut123_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1648.1_TCF12_cut123_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1648.1_TCF12_cut123_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1648.1_TCF12_cut123_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1648.1_TCF12_cut123_hum_chp_bon_gor_org_rhe.snps.txt > MA1648.1_TCF12_cut123_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1648.1_TCF12_cut123_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0605.2_ATF3_cut-19555
sort -k1,1 ../human_chimp/processed/MA0605.2_ATF3_cut-19555_hum_chp.snps.txt > MA0605.2_ATF3_cut-19555_hum_chp.snps.sort.txt
join MA0605.2_ATF3_cut-19555_hum_chp.snps.sort.txt ../process_bon/processed/MA0605.2_ATF3_cut-19555_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0605.2_ATF3_cut-19555_hum_chp_bon.pre.snps.txt
python reformat.py MA0605.2_ATF3_cut-19555_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0605.2_ATF3_cut-19555_hum_chp_bon.snps.txt > MA0605.2_ATF3_cut-19555_hum_chp_bon.snps.sort.txt
join MA0605.2_ATF3_cut-19555_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0605.2_ATF3_cut-19555_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0605.2_ATF3_cut-19555_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0605.2_ATF3_cut-19555_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0605.2_ATF3_cut-19555_hum_chp_bon_gor.snps.txt > MA0605.2_ATF3_cut-19555_hum_chp_bon_gor.snps.sort.txt
join MA0605.2_ATF3_cut-19555_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0605.2_ATF3_cut-19555_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org.snps.txt > MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org.snps.sort.txt
join MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0605.2_ATF3_cut-19555_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org_rhe.snps.txt > MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0605.2_ATF3_cut-19555_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1485.1_FERD3L_cut-2133
sort -k1,1 ../human_chimp/processed/MA1485.1_FERD3L_cut-2133_hum_chp.snps.txt > MA1485.1_FERD3L_cut-2133_hum_chp.snps.sort.txt
join MA1485.1_FERD3L_cut-2133_hum_chp.snps.sort.txt ../process_bon/processed/MA1485.1_FERD3L_cut-2133_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1485.1_FERD3L_cut-2133_hum_chp_bon.pre.snps.txt
python reformat.py MA1485.1_FERD3L_cut-2133_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1485.1_FERD3L_cut-2133_hum_chp_bon.snps.txt > MA1485.1_FERD3L_cut-2133_hum_chp_bon.snps.sort.txt
join MA1485.1_FERD3L_cut-2133_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1485.1_FERD3L_cut-2133_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor.snps.txt > MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor.snps.sort.txt
join MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1485.1_FERD3L_cut-2133_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org.snps.txt > MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org.snps.sort.txt
join MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1485.1_FERD3L_cut-2133_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org_rhe.snps.txt > MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1485.1_FERD3L_cut-2133_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0040.1_Foxq1_cut-18827
sort -k1,1 ../human_chimp/processed/MA0040.1_Foxq1_cut-18827_hum_chp.snps.txt > MA0040.1_Foxq1_cut-18827_hum_chp.snps.sort.txt
join MA0040.1_Foxq1_cut-18827_hum_chp.snps.sort.txt ../process_bon/processed/MA0040.1_Foxq1_cut-18827_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0040.1_Foxq1_cut-18827_hum_chp_bon.pre.snps.txt
python reformat.py MA0040.1_Foxq1_cut-18827_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0040.1_Foxq1_cut-18827_hum_chp_bon.snps.txt > MA0040.1_Foxq1_cut-18827_hum_chp_bon.snps.sort.txt
join MA0040.1_Foxq1_cut-18827_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0040.1_Foxq1_cut-18827_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor.snps.txt > MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor.snps.sort.txt
join MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0040.1_Foxq1_cut-18827_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org.snps.txt > MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org.snps.sort.txt
join MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0040.1_Foxq1_cut-18827_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org_rhe.snps.txt > MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0040.1_Foxq1_cut-18827_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0151.1_Arid3a_cut-9216
sort -k1,1 ../human_chimp/processed/MA0151.1_Arid3a_cut-9216_hum_chp.snps.txt > MA0151.1_Arid3a_cut-9216_hum_chp.snps.sort.txt
join MA0151.1_Arid3a_cut-9216_hum_chp.snps.sort.txt ../process_bon/processed/MA0151.1_Arid3a_cut-9216_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0151.1_Arid3a_cut-9216_hum_chp_bon.pre.snps.txt
python reformat.py MA0151.1_Arid3a_cut-9216_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0151.1_Arid3a_cut-9216_hum_chp_bon.snps.txt > MA0151.1_Arid3a_cut-9216_hum_chp_bon.snps.sort.txt
join MA0151.1_Arid3a_cut-9216_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0151.1_Arid3a_cut-9216_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor.snps.txt > MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor.snps.sort.txt
join MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0151.1_Arid3a_cut-9216_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org.snps.txt > MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org.snps.sort.txt
join MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0151.1_Arid3a_cut-9216_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org_rhe.snps.txt > MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0151.1_Arid3a_cut-9216_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1645.1_NKX2-2_cut95
sort -k1,1 ../human_chimp/processed/MA1645.1_NKX2-2_cut95_hum_chp.snps.txt > MA1645.1_NKX2-2_cut95_hum_chp.snps.sort.txt
join MA1645.1_NKX2-2_cut95_hum_chp.snps.sort.txt ../process_bon/processed/MA1645.1_NKX2-2_cut95_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1645.1_NKX2-2_cut95_hum_chp_bon.pre.snps.txt
python reformat.py MA1645.1_NKX2-2_cut95_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1645.1_NKX2-2_cut95_hum_chp_bon.snps.txt > MA1645.1_NKX2-2_cut95_hum_chp_bon.snps.sort.txt
join MA1645.1_NKX2-2_cut95_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1645.1_NKX2-2_cut95_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1645.1_NKX2-2_cut95_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1645.1_NKX2-2_cut95_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1645.1_NKX2-2_cut95_hum_chp_bon_gor.snps.txt > MA1645.1_NKX2-2_cut95_hum_chp_bon_gor.snps.sort.txt
join MA1645.1_NKX2-2_cut95_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1645.1_NKX2-2_cut95_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org.snps.txt > MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org.snps.sort.txt
join MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1645.1_NKX2-2_cut95_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org_rhe.snps.txt > MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1645.1_NKX2-2_cut95_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0068.2_PAX4_cut213
sort -k1,1 ../human_chimp/processed/MA0068.2_PAX4_cut213_hum_chp.snps.txt > MA0068.2_PAX4_cut213_hum_chp.snps.sort.txt
join MA0068.2_PAX4_cut213_hum_chp.snps.sort.txt ../process_bon/processed/MA0068.2_PAX4_cut213_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0068.2_PAX4_cut213_hum_chp_bon.pre.snps.txt
python reformat.py MA0068.2_PAX4_cut213_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0068.2_PAX4_cut213_hum_chp_bon.snps.txt > MA0068.2_PAX4_cut213_hum_chp_bon.snps.sort.txt
join MA0068.2_PAX4_cut213_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0068.2_PAX4_cut213_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0068.2_PAX4_cut213_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0068.2_PAX4_cut213_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0068.2_PAX4_cut213_hum_chp_bon_gor.snps.txt > MA0068.2_PAX4_cut213_hum_chp_bon_gor.snps.sort.txt
join MA0068.2_PAX4_cut213_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0068.2_PAX4_cut213_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0068.2_PAX4_cut213_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0068.2_PAX4_cut213_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0068.2_PAX4_cut213_hum_chp_bon_gor_org.snps.txt > MA0068.2_PAX4_cut213_hum_chp_bon_gor_org.snps.sort.txt
join MA0068.2_PAX4_cut213_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0068.2_PAX4_cut213_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0068.2_PAX4_cut213_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0068.2_PAX4_cut213_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0068.2_PAX4_cut213_hum_chp_bon_gor_org_rhe.snps.txt > MA0068.2_PAX4_cut213_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0068.2_PAX4_cut213_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0756.2_ONECUT2_cut-9389
sort -k1,1 ../human_chimp/processed/MA0756.2_ONECUT2_cut-9389_hum_chp.snps.txt > MA0756.2_ONECUT2_cut-9389_hum_chp.snps.sort.txt
join MA0756.2_ONECUT2_cut-9389_hum_chp.snps.sort.txt ../process_bon/processed/MA0756.2_ONECUT2_cut-9389_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0756.2_ONECUT2_cut-9389_hum_chp_bon.pre.snps.txt
python reformat.py MA0756.2_ONECUT2_cut-9389_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0756.2_ONECUT2_cut-9389_hum_chp_bon.snps.txt > MA0756.2_ONECUT2_cut-9389_hum_chp_bon.snps.sort.txt
join MA0756.2_ONECUT2_cut-9389_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0756.2_ONECUT2_cut-9389_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor.snps.txt > MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor.snps.sort.txt
join MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0756.2_ONECUT2_cut-9389_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org.snps.txt > MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org.snps.sort.txt
join MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0756.2_ONECUT2_cut-9389_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org_rhe.snps.txt > MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0756.2_ONECUT2_cut-9389_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0088.2_ZNF143_cut-11256
sort -k1,1 ../human_chimp/processed/MA0088.2_ZNF143_cut-11256_hum_chp.snps.txt > MA0088.2_ZNF143_cut-11256_hum_chp.snps.sort.txt
join MA0088.2_ZNF143_cut-11256_hum_chp.snps.sort.txt ../process_bon/processed/MA0088.2_ZNF143_cut-11256_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0088.2_ZNF143_cut-11256_hum_chp_bon.pre.snps.txt
python reformat.py MA0088.2_ZNF143_cut-11256_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0088.2_ZNF143_cut-11256_hum_chp_bon.snps.txt > MA0088.2_ZNF143_cut-11256_hum_chp_bon.snps.sort.txt
join MA0088.2_ZNF143_cut-11256_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0088.2_ZNF143_cut-11256_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor.snps.txt > MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor.snps.sort.txt
join MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0088.2_ZNF143_cut-11256_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org.snps.txt > MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org.snps.sort.txt
join MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0088.2_ZNF143_cut-11256_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org_rhe.snps.txt > MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0088.2_ZNF143_cut-11256_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1566.2_TBX3_cut-451
sort -k1,1 ../human_chimp/processed/MA1566.2_TBX3_cut-451_hum_chp.snps.txt > MA1566.2_TBX3_cut-451_hum_chp.snps.sort.txt
join MA1566.2_TBX3_cut-451_hum_chp.snps.sort.txt ../process_bon/processed/MA1566.2_TBX3_cut-451_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1566.2_TBX3_cut-451_hum_chp_bon.pre.snps.txt
python reformat.py MA1566.2_TBX3_cut-451_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1566.2_TBX3_cut-451_hum_chp_bon.snps.txt > MA1566.2_TBX3_cut-451_hum_chp_bon.snps.sort.txt
join MA1566.2_TBX3_cut-451_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1566.2_TBX3_cut-451_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1566.2_TBX3_cut-451_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1566.2_TBX3_cut-451_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1566.2_TBX3_cut-451_hum_chp_bon_gor.snps.txt > MA1566.2_TBX3_cut-451_hum_chp_bon_gor.snps.sort.txt
join MA1566.2_TBX3_cut-451_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1566.2_TBX3_cut-451_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org.snps.txt > MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org.snps.sort.txt
join MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1566.2_TBX3_cut-451_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org_rhe.snps.txt > MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1566.2_TBX3_cut-451_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1145.1_FOSL2::JUND_cut-104
sort -k1,1 ../human_chimp/processed/MA1145.1_FOSL2::JUND_cut-104_hum_chp.snps.txt > MA1145.1_FOSL2::JUND_cut-104_hum_chp.snps.sort.txt
join MA1145.1_FOSL2::JUND_cut-104_hum_chp.snps.sort.txt ../process_bon/processed/MA1145.1_FOSL2::JUND_cut-104_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon.pre.snps.txt
python reformat.py MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon.snps.txt > MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon.snps.sort.txt
join MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1145.1_FOSL2::JUND_cut-104_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor.snps.txt > MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor.snps.sort.txt
join MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1145.1_FOSL2::JUND_cut-104_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org.snps.txt > MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org.snps.sort.txt
join MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1145.1_FOSL2::JUND_cut-104_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org_rhe.snps.txt > MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1145.1_FOSL2::JUND_cut-104_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1963.1_SATB1_cut-37
sort -k1,1 ../human_chimp/processed/MA1963.1_SATB1_cut-37_hum_chp.snps.txt > MA1963.1_SATB1_cut-37_hum_chp.snps.sort.txt
join MA1963.1_SATB1_cut-37_hum_chp.snps.sort.txt ../process_bon/processed/MA1963.1_SATB1_cut-37_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1963.1_SATB1_cut-37_hum_chp_bon.pre.snps.txt
python reformat.py MA1963.1_SATB1_cut-37_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1963.1_SATB1_cut-37_hum_chp_bon.snps.txt > MA1963.1_SATB1_cut-37_hum_chp_bon.snps.sort.txt
join MA1963.1_SATB1_cut-37_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1963.1_SATB1_cut-37_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1963.1_SATB1_cut-37_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1963.1_SATB1_cut-37_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1963.1_SATB1_cut-37_hum_chp_bon_gor.snps.txt > MA1963.1_SATB1_cut-37_hum_chp_bon_gor.snps.sort.txt
join MA1963.1_SATB1_cut-37_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1963.1_SATB1_cut-37_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org.snps.txt > MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org.snps.sort.txt
join MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1963.1_SATB1_cut-37_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org_rhe.snps.txt > MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1963.1_SATB1_cut-37_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0779.1_PAX1_cut-2174
sort -k1,1 ../human_chimp/processed/MA0779.1_PAX1_cut-2174_hum_chp.snps.txt > MA0779.1_PAX1_cut-2174_hum_chp.snps.sort.txt
join MA0779.1_PAX1_cut-2174_hum_chp.snps.sort.txt ../process_bon/processed/MA0779.1_PAX1_cut-2174_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0779.1_PAX1_cut-2174_hum_chp_bon.pre.snps.txt
python reformat.py MA0779.1_PAX1_cut-2174_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0779.1_PAX1_cut-2174_hum_chp_bon.snps.txt > MA0779.1_PAX1_cut-2174_hum_chp_bon.snps.sort.txt
join MA0779.1_PAX1_cut-2174_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0779.1_PAX1_cut-2174_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0779.1_PAX1_cut-2174_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0779.1_PAX1_cut-2174_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0779.1_PAX1_cut-2174_hum_chp_bon_gor.snps.txt > MA0779.1_PAX1_cut-2174_hum_chp_bon_gor.snps.sort.txt
join MA0779.1_PAX1_cut-2174_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0779.1_PAX1_cut-2174_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org.snps.txt > MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org.snps.sort.txt
join MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0779.1_PAX1_cut-2174_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org_rhe.snps.txt > MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0779.1_PAX1_cut-2174_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0470.2_E2F4_cut-819
sort -k1,1 ../human_chimp/processed/MA0470.2_E2F4_cut-819_hum_chp.snps.txt > MA0470.2_E2F4_cut-819_hum_chp.snps.sort.txt
join MA0470.2_E2F4_cut-819_hum_chp.snps.sort.txt ../process_bon/processed/MA0470.2_E2F4_cut-819_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0470.2_E2F4_cut-819_hum_chp_bon.pre.snps.txt
python reformat.py MA0470.2_E2F4_cut-819_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0470.2_E2F4_cut-819_hum_chp_bon.snps.txt > MA0470.2_E2F4_cut-819_hum_chp_bon.snps.sort.txt
join MA0470.2_E2F4_cut-819_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0470.2_E2F4_cut-819_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0470.2_E2F4_cut-819_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0470.2_E2F4_cut-819_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0470.2_E2F4_cut-819_hum_chp_bon_gor.snps.txt > MA0470.2_E2F4_cut-819_hum_chp_bon_gor.snps.sort.txt
join MA0470.2_E2F4_cut-819_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0470.2_E2F4_cut-819_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org.snps.txt > MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org.snps.sort.txt
join MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0470.2_E2F4_cut-819_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org_rhe.snps.txt > MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0470.2_E2F4_cut-819_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0063.2_NKX2-5_cut150
sort -k1,1 ../human_chimp/processed/MA0063.2_NKX2-5_cut150_hum_chp.snps.txt > MA0063.2_NKX2-5_cut150_hum_chp.snps.sort.txt
join MA0063.2_NKX2-5_cut150_hum_chp.snps.sort.txt ../process_bon/processed/MA0063.2_NKX2-5_cut150_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0063.2_NKX2-5_cut150_hum_chp_bon.pre.snps.txt
python reformat.py MA0063.2_NKX2-5_cut150_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0063.2_NKX2-5_cut150_hum_chp_bon.snps.txt > MA0063.2_NKX2-5_cut150_hum_chp_bon.snps.sort.txt
join MA0063.2_NKX2-5_cut150_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0063.2_NKX2-5_cut150_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0063.2_NKX2-5_cut150_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0063.2_NKX2-5_cut150_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0063.2_NKX2-5_cut150_hum_chp_bon_gor.snps.txt > MA0063.2_NKX2-5_cut150_hum_chp_bon_gor.snps.sort.txt
join MA0063.2_NKX2-5_cut150_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0063.2_NKX2-5_cut150_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org.snps.txt > MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org.snps.sort.txt
join MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0063.2_NKX2-5_cut150_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org_rhe.snps.txt > MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0063.2_NKX2-5_cut150_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0512.2_Rxra_cut-1845
sort -k1,1 ../human_chimp/processed/MA0512.2_Rxra_cut-1845_hum_chp.snps.txt > MA0512.2_Rxra_cut-1845_hum_chp.snps.sort.txt
join MA0512.2_Rxra_cut-1845_hum_chp.snps.sort.txt ../process_bon/processed/MA0512.2_Rxra_cut-1845_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0512.2_Rxra_cut-1845_hum_chp_bon.pre.snps.txt
python reformat.py MA0512.2_Rxra_cut-1845_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0512.2_Rxra_cut-1845_hum_chp_bon.snps.txt > MA0512.2_Rxra_cut-1845_hum_chp_bon.snps.sort.txt
join MA0512.2_Rxra_cut-1845_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0512.2_Rxra_cut-1845_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0512.2_Rxra_cut-1845_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0512.2_Rxra_cut-1845_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0512.2_Rxra_cut-1845_hum_chp_bon_gor.snps.txt > MA0512.2_Rxra_cut-1845_hum_chp_bon_gor.snps.sort.txt
join MA0512.2_Rxra_cut-1845_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0512.2_Rxra_cut-1845_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org.snps.txt > MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org.snps.sort.txt
join MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0512.2_Rxra_cut-1845_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org_rhe.snps.txt > MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0512.2_Rxra_cut-1845_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0627.2_POU2F3_cut-82
sort -k1,1 ../human_chimp/processed/MA0627.2_POU2F3_cut-82_hum_chp.snps.txt > MA0627.2_POU2F3_cut-82_hum_chp.snps.sort.txt
join MA0627.2_POU2F3_cut-82_hum_chp.snps.sort.txt ../process_bon/processed/MA0627.2_POU2F3_cut-82_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0627.2_POU2F3_cut-82_hum_chp_bon.pre.snps.txt
python reformat.py MA0627.2_POU2F3_cut-82_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0627.2_POU2F3_cut-82_hum_chp_bon.snps.txt > MA0627.2_POU2F3_cut-82_hum_chp_bon.snps.sort.txt
join MA0627.2_POU2F3_cut-82_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0627.2_POU2F3_cut-82_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0627.2_POU2F3_cut-82_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0627.2_POU2F3_cut-82_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0627.2_POU2F3_cut-82_hum_chp_bon_gor.snps.txt > MA0627.2_POU2F3_cut-82_hum_chp_bon_gor.snps.sort.txt
join MA0627.2_POU2F3_cut-82_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0627.2_POU2F3_cut-82_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org.snps.txt > MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org.snps.sort.txt
join MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0627.2_POU2F3_cut-82_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org_rhe.snps.txt > MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0627.2_POU2F3_cut-82_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1638.1_HAND2_cut-349
sort -k1,1 ../human_chimp/processed/MA1638.1_HAND2_cut-349_hum_chp.snps.txt > MA1638.1_HAND2_cut-349_hum_chp.snps.sort.txt
join MA1638.1_HAND2_cut-349_hum_chp.snps.sort.txt ../process_bon/processed/MA1638.1_HAND2_cut-349_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1638.1_HAND2_cut-349_hum_chp_bon.pre.snps.txt
python reformat.py MA1638.1_HAND2_cut-349_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1638.1_HAND2_cut-349_hum_chp_bon.snps.txt > MA1638.1_HAND2_cut-349_hum_chp_bon.snps.sort.txt
join MA1638.1_HAND2_cut-349_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1638.1_HAND2_cut-349_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1638.1_HAND2_cut-349_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1638.1_HAND2_cut-349_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1638.1_HAND2_cut-349_hum_chp_bon_gor.snps.txt > MA1638.1_HAND2_cut-349_hum_chp_bon_gor.snps.sort.txt
join MA1638.1_HAND2_cut-349_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1638.1_HAND2_cut-349_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org.snps.txt > MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org.snps.sort.txt
join MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1638.1_HAND2_cut-349_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org_rhe.snps.txt > MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1638.1_HAND2_cut-349_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0754.2_CUX1_cut-81
sort -k1,1 ../human_chimp/processed/MA0754.2_CUX1_cut-81_hum_chp.snps.txt > MA0754.2_CUX1_cut-81_hum_chp.snps.sort.txt
join MA0754.2_CUX1_cut-81_hum_chp.snps.sort.txt ../process_bon/processed/MA0754.2_CUX1_cut-81_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0754.2_CUX1_cut-81_hum_chp_bon.pre.snps.txt
python reformat.py MA0754.2_CUX1_cut-81_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0754.2_CUX1_cut-81_hum_chp_bon.snps.txt > MA0754.2_CUX1_cut-81_hum_chp_bon.snps.sort.txt
join MA0754.2_CUX1_cut-81_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0754.2_CUX1_cut-81_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0754.2_CUX1_cut-81_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0754.2_CUX1_cut-81_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0754.2_CUX1_cut-81_hum_chp_bon_gor.snps.txt > MA0754.2_CUX1_cut-81_hum_chp_bon_gor.snps.sort.txt
join MA0754.2_CUX1_cut-81_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0754.2_CUX1_cut-81_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org.snps.txt > MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org.snps.sort.txt
join MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0754.2_CUX1_cut-81_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org_rhe.snps.txt > MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0754.2_CUX1_cut-81_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0106.3_TP53_cut-1351
sort -k1,1 ../human_chimp/processed/MA0106.3_TP53_cut-1351_hum_chp.snps.txt > MA0106.3_TP53_cut-1351_hum_chp.snps.sort.txt
join MA0106.3_TP53_cut-1351_hum_chp.snps.sort.txt ../process_bon/processed/MA0106.3_TP53_cut-1351_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0106.3_TP53_cut-1351_hum_chp_bon.pre.snps.txt
python reformat.py MA0106.3_TP53_cut-1351_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0106.3_TP53_cut-1351_hum_chp_bon.snps.txt > MA0106.3_TP53_cut-1351_hum_chp_bon.snps.sort.txt
join MA0106.3_TP53_cut-1351_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0106.3_TP53_cut-1351_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0106.3_TP53_cut-1351_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0106.3_TP53_cut-1351_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0106.3_TP53_cut-1351_hum_chp_bon_gor.snps.txt > MA0106.3_TP53_cut-1351_hum_chp_bon_gor.snps.sort.txt
join MA0106.3_TP53_cut-1351_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0106.3_TP53_cut-1351_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org.snps.txt > MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org.snps.sort.txt
join MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0106.3_TP53_cut-1351_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org_rhe.snps.txt > MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0106.3_TP53_cut-1351_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0730.1_RARA_cut-2037
sort -k1,1 ../human_chimp/processed/MA0730.1_RARA_cut-2037_hum_chp.snps.txt > MA0730.1_RARA_cut-2037_hum_chp.snps.sort.txt
join MA0730.1_RARA_cut-2037_hum_chp.snps.sort.txt ../process_bon/processed/MA0730.1_RARA_cut-2037_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0730.1_RARA_cut-2037_hum_chp_bon.pre.snps.txt
python reformat.py MA0730.1_RARA_cut-2037_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0730.1_RARA_cut-2037_hum_chp_bon.snps.txt > MA0730.1_RARA_cut-2037_hum_chp_bon.snps.sort.txt
join MA0730.1_RARA_cut-2037_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0730.1_RARA_cut-2037_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0730.1_RARA_cut-2037_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0730.1_RARA_cut-2037_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0730.1_RARA_cut-2037_hum_chp_bon_gor.snps.txt > MA0730.1_RARA_cut-2037_hum_chp_bon_gor.snps.sort.txt
join MA0730.1_RARA_cut-2037_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0730.1_RARA_cut-2037_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org.snps.txt > MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org.snps.sort.txt
join MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0730.1_RARA_cut-2037_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org_rhe.snps.txt > MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0730.1_RARA_cut-2037_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1711.1_ZNF343_cut-1910
sort -k1,1 ../human_chimp/processed/MA1711.1_ZNF343_cut-1910_hum_chp.snps.txt > MA1711.1_ZNF343_cut-1910_hum_chp.snps.sort.txt
join MA1711.1_ZNF343_cut-1910_hum_chp.snps.sort.txt ../process_bon/processed/MA1711.1_ZNF343_cut-1910_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1711.1_ZNF343_cut-1910_hum_chp_bon.pre.snps.txt
python reformat.py MA1711.1_ZNF343_cut-1910_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1711.1_ZNF343_cut-1910_hum_chp_bon.snps.txt > MA1711.1_ZNF343_cut-1910_hum_chp_bon.snps.sort.txt
join MA1711.1_ZNF343_cut-1910_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1711.1_ZNF343_cut-1910_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor.snps.txt > MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor.snps.sort.txt
join MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1711.1_ZNF343_cut-1910_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org.snps.txt > MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org.snps.sort.txt
join MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1711.1_ZNF343_cut-1910_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org_rhe.snps.txt > MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1711.1_ZNF343_cut-1910_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1623.1_Stat2_cut2
sort -k1,1 ../human_chimp/processed/MA1623.1_Stat2_cut2_hum_chp.snps.txt > MA1623.1_Stat2_cut2_hum_chp.snps.sort.txt
join MA1623.1_Stat2_cut2_hum_chp.snps.sort.txt ../process_bon/processed/MA1623.1_Stat2_cut2_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1623.1_Stat2_cut2_hum_chp_bon.pre.snps.txt
python reformat.py MA1623.1_Stat2_cut2_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1623.1_Stat2_cut2_hum_chp_bon.snps.txt > MA1623.1_Stat2_cut2_hum_chp_bon.snps.sort.txt
join MA1623.1_Stat2_cut2_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1623.1_Stat2_cut2_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1623.1_Stat2_cut2_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1623.1_Stat2_cut2_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1623.1_Stat2_cut2_hum_chp_bon_gor.snps.txt > MA1623.1_Stat2_cut2_hum_chp_bon_gor.snps.sort.txt
join MA1623.1_Stat2_cut2_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1623.1_Stat2_cut2_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1623.1_Stat2_cut2_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1623.1_Stat2_cut2_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1623.1_Stat2_cut2_hum_chp_bon_gor_org.snps.txt > MA1623.1_Stat2_cut2_hum_chp_bon_gor_org.snps.sort.txt
join MA1623.1_Stat2_cut2_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1623.1_Stat2_cut2_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1623.1_Stat2_cut2_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1623.1_Stat2_cut2_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1623.1_Stat2_cut2_hum_chp_bon_gor_org_rhe.snps.txt > MA1623.1_Stat2_cut2_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1623.1_Stat2_cut2_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0482.2_GATA4_cut115
sort -k1,1 ../human_chimp/processed/MA0482.2_GATA4_cut115_hum_chp.snps.txt > MA0482.2_GATA4_cut115_hum_chp.snps.sort.txt
join MA0482.2_GATA4_cut115_hum_chp.snps.sort.txt ../process_bon/processed/MA0482.2_GATA4_cut115_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0482.2_GATA4_cut115_hum_chp_bon.pre.snps.txt
python reformat.py MA0482.2_GATA4_cut115_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0482.2_GATA4_cut115_hum_chp_bon.snps.txt > MA0482.2_GATA4_cut115_hum_chp_bon.snps.sort.txt
join MA0482.2_GATA4_cut115_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0482.2_GATA4_cut115_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0482.2_GATA4_cut115_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0482.2_GATA4_cut115_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0482.2_GATA4_cut115_hum_chp_bon_gor.snps.txt > MA0482.2_GATA4_cut115_hum_chp_bon_gor.snps.sort.txt
join MA0482.2_GATA4_cut115_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0482.2_GATA4_cut115_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0482.2_GATA4_cut115_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0482.2_GATA4_cut115_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0482.2_GATA4_cut115_hum_chp_bon_gor_org.snps.txt > MA0482.2_GATA4_cut115_hum_chp_bon_gor_org.snps.sort.txt
join MA0482.2_GATA4_cut115_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0482.2_GATA4_cut115_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0482.2_GATA4_cut115_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0482.2_GATA4_cut115_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0482.2_GATA4_cut115_hum_chp_bon_gor_org_rhe.snps.txt > MA0482.2_GATA4_cut115_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0482.2_GATA4_cut115_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0714.1_PITX3_cut232
sort -k1,1 ../human_chimp/processed/MA0714.1_PITX3_cut232_hum_chp.snps.txt > MA0714.1_PITX3_cut232_hum_chp.snps.sort.txt
join MA0714.1_PITX3_cut232_hum_chp.snps.sort.txt ../process_bon/processed/MA0714.1_PITX3_cut232_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0714.1_PITX3_cut232_hum_chp_bon.pre.snps.txt
python reformat.py MA0714.1_PITX3_cut232_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0714.1_PITX3_cut232_hum_chp_bon.snps.txt > MA0714.1_PITX3_cut232_hum_chp_bon.snps.sort.txt
join MA0714.1_PITX3_cut232_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0714.1_PITX3_cut232_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0714.1_PITX3_cut232_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0714.1_PITX3_cut232_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0714.1_PITX3_cut232_hum_chp_bon_gor.snps.txt > MA0714.1_PITX3_cut232_hum_chp_bon_gor.snps.sort.txt
join MA0714.1_PITX3_cut232_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0714.1_PITX3_cut232_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0714.1_PITX3_cut232_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0714.1_PITX3_cut232_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0714.1_PITX3_cut232_hum_chp_bon_gor_org.snps.txt > MA0714.1_PITX3_cut232_hum_chp_bon_gor_org.snps.sort.txt
join MA0714.1_PITX3_cut232_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0714.1_PITX3_cut232_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0714.1_PITX3_cut232_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0714.1_PITX3_cut232_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0714.1_PITX3_cut232_hum_chp_bon_gor_org_rhe.snps.txt > MA0714.1_PITX3_cut232_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0714.1_PITX3_cut232_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0477.2_FOSL1_cut-115
sort -k1,1 ../human_chimp/processed/MA0477.2_FOSL1_cut-115_hum_chp.snps.txt > MA0477.2_FOSL1_cut-115_hum_chp.snps.sort.txt
join MA0477.2_FOSL1_cut-115_hum_chp.snps.sort.txt ../process_bon/processed/MA0477.2_FOSL1_cut-115_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0477.2_FOSL1_cut-115_hum_chp_bon.pre.snps.txt
python reformat.py MA0477.2_FOSL1_cut-115_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0477.2_FOSL1_cut-115_hum_chp_bon.snps.txt > MA0477.2_FOSL1_cut-115_hum_chp_bon.snps.sort.txt
join MA0477.2_FOSL1_cut-115_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0477.2_FOSL1_cut-115_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0477.2_FOSL1_cut-115_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0477.2_FOSL1_cut-115_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0477.2_FOSL1_cut-115_hum_chp_bon_gor.snps.txt > MA0477.2_FOSL1_cut-115_hum_chp_bon_gor.snps.sort.txt
join MA0477.2_FOSL1_cut-115_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0477.2_FOSL1_cut-115_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org.snps.txt > MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org.snps.sort.txt
join MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0477.2_FOSL1_cut-115_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org_rhe.snps.txt > MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0477.2_FOSL1_cut-115_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1603.1_Dmrt1_cut-34
sort -k1,1 ../human_chimp/processed/MA1603.1_Dmrt1_cut-34_hum_chp.snps.txt > MA1603.1_Dmrt1_cut-34_hum_chp.snps.sort.txt
join MA1603.1_Dmrt1_cut-34_hum_chp.snps.sort.txt ../process_bon/processed/MA1603.1_Dmrt1_cut-34_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1603.1_Dmrt1_cut-34_hum_chp_bon.pre.snps.txt
python reformat.py MA1603.1_Dmrt1_cut-34_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1603.1_Dmrt1_cut-34_hum_chp_bon.snps.txt > MA1603.1_Dmrt1_cut-34_hum_chp_bon.snps.sort.txt
join MA1603.1_Dmrt1_cut-34_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1603.1_Dmrt1_cut-34_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor.snps.txt > MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor.snps.sort.txt
join MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1603.1_Dmrt1_cut-34_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org.snps.txt > MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org.snps.sort.txt
join MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1603.1_Dmrt1_cut-34_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org_rhe.snps.txt > MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1603.1_Dmrt1_cut-34_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1099.2_HES1_cut-545
sort -k1,1 ../human_chimp/processed/MA1099.2_HES1_cut-545_hum_chp.snps.txt > MA1099.2_HES1_cut-545_hum_chp.snps.sort.txt
join MA1099.2_HES1_cut-545_hum_chp.snps.sort.txt ../process_bon/processed/MA1099.2_HES1_cut-545_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1099.2_HES1_cut-545_hum_chp_bon.pre.snps.txt
python reformat.py MA1099.2_HES1_cut-545_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1099.2_HES1_cut-545_hum_chp_bon.snps.txt > MA1099.2_HES1_cut-545_hum_chp_bon.snps.sort.txt
join MA1099.2_HES1_cut-545_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1099.2_HES1_cut-545_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1099.2_HES1_cut-545_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1099.2_HES1_cut-545_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1099.2_HES1_cut-545_hum_chp_bon_gor.snps.txt > MA1099.2_HES1_cut-545_hum_chp_bon_gor.snps.sort.txt
join MA1099.2_HES1_cut-545_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1099.2_HES1_cut-545_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1099.2_HES1_cut-545_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1099.2_HES1_cut-545_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1099.2_HES1_cut-545_hum_chp_bon_gor_org.snps.txt > MA1099.2_HES1_cut-545_hum_chp_bon_gor_org.snps.sort.txt
join MA1099.2_HES1_cut-545_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1099.2_HES1_cut-545_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1099.2_HES1_cut-545_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1099.2_HES1_cut-545_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1099.2_HES1_cut-545_hum_chp_bon_gor_org_rhe.snps.txt > MA1099.2_HES1_cut-545_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1099.2_HES1_cut-545_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0718.1_RAX_cut227
sort -k1,1 ../human_chimp/processed/MA0718.1_RAX_cut227_hum_chp.snps.txt > MA0718.1_RAX_cut227_hum_chp.snps.sort.txt
join MA0718.1_RAX_cut227_hum_chp.snps.sort.txt ../process_bon/processed/MA0718.1_RAX_cut227_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0718.1_RAX_cut227_hum_chp_bon.pre.snps.txt
python reformat.py MA0718.1_RAX_cut227_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0718.1_RAX_cut227_hum_chp_bon.snps.txt > MA0718.1_RAX_cut227_hum_chp_bon.snps.sort.txt
join MA0718.1_RAX_cut227_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0718.1_RAX_cut227_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0718.1_RAX_cut227_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0718.1_RAX_cut227_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0718.1_RAX_cut227_hum_chp_bon_gor.snps.txt > MA0718.1_RAX_cut227_hum_chp_bon_gor.snps.sort.txt
join MA0718.1_RAX_cut227_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0718.1_RAX_cut227_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0718.1_RAX_cut227_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0718.1_RAX_cut227_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0718.1_RAX_cut227_hum_chp_bon_gor_org.snps.txt > MA0718.1_RAX_cut227_hum_chp_bon_gor_org.snps.sort.txt
join MA0718.1_RAX_cut227_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0718.1_RAX_cut227_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0718.1_RAX_cut227_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0718.1_RAX_cut227_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0718.1_RAX_cut227_hum_chp_bon_gor_org_rhe.snps.txt > MA0718.1_RAX_cut227_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0718.1_RAX_cut227_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1933.1_ELK1::SREBF2_cut-804
sort -k1,1 ../human_chimp/processed/MA1933.1_ELK1::SREBF2_cut-804_hum_chp.snps.txt > MA1933.1_ELK1::SREBF2_cut-804_hum_chp.snps.sort.txt
join MA1933.1_ELK1::SREBF2_cut-804_hum_chp.snps.sort.txt ../process_bon/processed/MA1933.1_ELK1::SREBF2_cut-804_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon.pre.snps.txt
python reformat.py MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon.snps.txt > MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon.snps.sort.txt
join MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1933.1_ELK1::SREBF2_cut-804_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor.snps.txt > MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor.snps.sort.txt
join MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1933.1_ELK1::SREBF2_cut-804_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org.snps.txt > MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org.snps.sort.txt
join MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1933.1_ELK1::SREBF2_cut-804_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org_rhe.snps.txt > MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1933.1_ELK1::SREBF2_cut-804_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1721.1_ZNF93_cut-546
sort -k1,1 ../human_chimp/processed/MA1721.1_ZNF93_cut-546_hum_chp.snps.txt > MA1721.1_ZNF93_cut-546_hum_chp.snps.sort.txt
join MA1721.1_ZNF93_cut-546_hum_chp.snps.sort.txt ../process_bon/processed/MA1721.1_ZNF93_cut-546_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1721.1_ZNF93_cut-546_hum_chp_bon.pre.snps.txt
python reformat.py MA1721.1_ZNF93_cut-546_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1721.1_ZNF93_cut-546_hum_chp_bon.snps.txt > MA1721.1_ZNF93_cut-546_hum_chp_bon.snps.sort.txt
join MA1721.1_ZNF93_cut-546_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1721.1_ZNF93_cut-546_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1721.1_ZNF93_cut-546_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1721.1_ZNF93_cut-546_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1721.1_ZNF93_cut-546_hum_chp_bon_gor.snps.txt > MA1721.1_ZNF93_cut-546_hum_chp_bon_gor.snps.sort.txt
join MA1721.1_ZNF93_cut-546_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1721.1_ZNF93_cut-546_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org.snps.txt > MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org.snps.sort.txt
join MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1721.1_ZNF93_cut-546_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org_rhe.snps.txt > MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1721.1_ZNF93_cut-546_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0052.4_MEF2A_cut113
sort -k1,1 ../human_chimp/processed/MA0052.4_MEF2A_cut113_hum_chp.snps.txt > MA0052.4_MEF2A_cut113_hum_chp.snps.sort.txt
join MA0052.4_MEF2A_cut113_hum_chp.snps.sort.txt ../process_bon/processed/MA0052.4_MEF2A_cut113_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0052.4_MEF2A_cut113_hum_chp_bon.pre.snps.txt
python reformat.py MA0052.4_MEF2A_cut113_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0052.4_MEF2A_cut113_hum_chp_bon.snps.txt > MA0052.4_MEF2A_cut113_hum_chp_bon.snps.sort.txt
join MA0052.4_MEF2A_cut113_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0052.4_MEF2A_cut113_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0052.4_MEF2A_cut113_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0052.4_MEF2A_cut113_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0052.4_MEF2A_cut113_hum_chp_bon_gor.snps.txt > MA0052.4_MEF2A_cut113_hum_chp_bon_gor.snps.sort.txt
join MA0052.4_MEF2A_cut113_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0052.4_MEF2A_cut113_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org.snps.txt > MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org.snps.sort.txt
join MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0052.4_MEF2A_cut113_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org_rhe.snps.txt > MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0052.4_MEF2A_cut113_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0734.3_Gli2_cut-314
sort -k1,1 ../human_chimp/processed/MA0734.3_Gli2_cut-314_hum_chp.snps.txt > MA0734.3_Gli2_cut-314_hum_chp.snps.sort.txt
join MA0734.3_Gli2_cut-314_hum_chp.snps.sort.txt ../process_bon/processed/MA0734.3_Gli2_cut-314_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0734.3_Gli2_cut-314_hum_chp_bon.pre.snps.txt
python reformat.py MA0734.3_Gli2_cut-314_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0734.3_Gli2_cut-314_hum_chp_bon.snps.txt > MA0734.3_Gli2_cut-314_hum_chp_bon.snps.sort.txt
join MA0734.3_Gli2_cut-314_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0734.3_Gli2_cut-314_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0734.3_Gli2_cut-314_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0734.3_Gli2_cut-314_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0734.3_Gli2_cut-314_hum_chp_bon_gor.snps.txt > MA0734.3_Gli2_cut-314_hum_chp_bon_gor.snps.sort.txt
join MA0734.3_Gli2_cut-314_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0734.3_Gli2_cut-314_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org.snps.txt > MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org.snps.sort.txt
join MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0734.3_Gli2_cut-314_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org_rhe.snps.txt > MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0734.3_Gli2_cut-314_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1958.1_HOXD12::ELK1_cut-10637
sort -k1,1 ../human_chimp/processed/MA1958.1_HOXD12::ELK1_cut-10637_hum_chp.snps.txt > MA1958.1_HOXD12::ELK1_cut-10637_hum_chp.snps.sort.txt
join MA1958.1_HOXD12::ELK1_cut-10637_hum_chp.snps.sort.txt ../process_bon/processed/MA1958.1_HOXD12::ELK1_cut-10637_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon.pre.snps.txt
python reformat.py MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon.snps.txt > MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon.snps.sort.txt
join MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1958.1_HOXD12::ELK1_cut-10637_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor.snps.txt > MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor.snps.sort.txt
join MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1958.1_HOXD12::ELK1_cut-10637_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org.snps.txt > MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org.snps.sort.txt
join MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1958.1_HOXD12::ELK1_cut-10637_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org_rhe.snps.txt > MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1958.1_HOXD12::ELK1_cut-10637_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1516.1_KLF3_cut-683
sort -k1,1 ../human_chimp/processed/MA1516.1_KLF3_cut-683_hum_chp.snps.txt > MA1516.1_KLF3_cut-683_hum_chp.snps.sort.txt
join MA1516.1_KLF3_cut-683_hum_chp.snps.sort.txt ../process_bon/processed/MA1516.1_KLF3_cut-683_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1516.1_KLF3_cut-683_hum_chp_bon.pre.snps.txt
python reformat.py MA1516.1_KLF3_cut-683_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1516.1_KLF3_cut-683_hum_chp_bon.snps.txt > MA1516.1_KLF3_cut-683_hum_chp_bon.snps.sort.txt
join MA1516.1_KLF3_cut-683_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1516.1_KLF3_cut-683_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1516.1_KLF3_cut-683_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1516.1_KLF3_cut-683_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1516.1_KLF3_cut-683_hum_chp_bon_gor.snps.txt > MA1516.1_KLF3_cut-683_hum_chp_bon_gor.snps.sort.txt
join MA1516.1_KLF3_cut-683_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1516.1_KLF3_cut-683_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org.snps.txt > MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org.snps.sort.txt
join MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1516.1_KLF3_cut-683_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org_rhe.snps.txt > MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1516.1_KLF3_cut-683_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1640.1_MEIS2_cut108
sort -k1,1 ../human_chimp/processed/MA1640.1_MEIS2_cut108_hum_chp.snps.txt > MA1640.1_MEIS2_cut108_hum_chp.snps.sort.txt
join MA1640.1_MEIS2_cut108_hum_chp.snps.sort.txt ../process_bon/processed/MA1640.1_MEIS2_cut108_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1640.1_MEIS2_cut108_hum_chp_bon.pre.snps.txt
python reformat.py MA1640.1_MEIS2_cut108_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1640.1_MEIS2_cut108_hum_chp_bon.snps.txt > MA1640.1_MEIS2_cut108_hum_chp_bon.snps.sort.txt
join MA1640.1_MEIS2_cut108_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1640.1_MEIS2_cut108_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1640.1_MEIS2_cut108_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1640.1_MEIS2_cut108_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1640.1_MEIS2_cut108_hum_chp_bon_gor.snps.txt > MA1640.1_MEIS2_cut108_hum_chp_bon_gor.snps.sort.txt
join MA1640.1_MEIS2_cut108_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1640.1_MEIS2_cut108_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org.snps.txt > MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org.snps.sort.txt
join MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1640.1_MEIS2_cut108_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org_rhe.snps.txt > MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1640.1_MEIS2_cut108_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0613.1_FOXG1_cut-668
sort -k1,1 ../human_chimp/processed/MA0613.1_FOXG1_cut-668_hum_chp.snps.txt > MA0613.1_FOXG1_cut-668_hum_chp.snps.sort.txt
join MA0613.1_FOXG1_cut-668_hum_chp.snps.sort.txt ../process_bon/processed/MA0613.1_FOXG1_cut-668_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0613.1_FOXG1_cut-668_hum_chp_bon.pre.snps.txt
python reformat.py MA0613.1_FOXG1_cut-668_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0613.1_FOXG1_cut-668_hum_chp_bon.snps.txt > MA0613.1_FOXG1_cut-668_hum_chp_bon.snps.sort.txt
join MA0613.1_FOXG1_cut-668_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0613.1_FOXG1_cut-668_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0613.1_FOXG1_cut-668_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0613.1_FOXG1_cut-668_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0613.1_FOXG1_cut-668_hum_chp_bon_gor.snps.txt > MA0613.1_FOXG1_cut-668_hum_chp_bon_gor.snps.sort.txt
join MA0613.1_FOXG1_cut-668_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0613.1_FOXG1_cut-668_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org.snps.txt > MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org.snps.sort.txt
join MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0613.1_FOXG1_cut-668_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org_rhe.snps.txt > MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0613.1_FOXG1_cut-668_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0070.1_PBX1_cut-9702
sort -k1,1 ../human_chimp/processed/MA0070.1_PBX1_cut-9702_hum_chp.snps.txt > MA0070.1_PBX1_cut-9702_hum_chp.snps.sort.txt
join MA0070.1_PBX1_cut-9702_hum_chp.snps.sort.txt ../process_bon/processed/MA0070.1_PBX1_cut-9702_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0070.1_PBX1_cut-9702_hum_chp_bon.pre.snps.txt
python reformat.py MA0070.1_PBX1_cut-9702_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0070.1_PBX1_cut-9702_hum_chp_bon.snps.txt > MA0070.1_PBX1_cut-9702_hum_chp_bon.snps.sort.txt
join MA0070.1_PBX1_cut-9702_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0070.1_PBX1_cut-9702_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0070.1_PBX1_cut-9702_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0070.1_PBX1_cut-9702_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0070.1_PBX1_cut-9702_hum_chp_bon_gor.snps.txt > MA0070.1_PBX1_cut-9702_hum_chp_bon_gor.snps.sort.txt
join MA0070.1_PBX1_cut-9702_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0070.1_PBX1_cut-9702_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org.snps.txt > MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org.snps.sort.txt
join MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0070.1_PBX1_cut-9702_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org_rhe.snps.txt > MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0070.1_PBX1_cut-9702_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0050.3_Irf1_cut-10
sort -k1,1 ../human_chimp/processed/MA0050.3_Irf1_cut-10_hum_chp.snps.txt > MA0050.3_Irf1_cut-10_hum_chp.snps.sort.txt
join MA0050.3_Irf1_cut-10_hum_chp.snps.sort.txt ../process_bon/processed/MA0050.3_Irf1_cut-10_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0050.3_Irf1_cut-10_hum_chp_bon.pre.snps.txt
python reformat.py MA0050.3_Irf1_cut-10_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0050.3_Irf1_cut-10_hum_chp_bon.snps.txt > MA0050.3_Irf1_cut-10_hum_chp_bon.snps.sort.txt
join MA0050.3_Irf1_cut-10_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0050.3_Irf1_cut-10_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0050.3_Irf1_cut-10_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0050.3_Irf1_cut-10_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0050.3_Irf1_cut-10_hum_chp_bon_gor.snps.txt > MA0050.3_Irf1_cut-10_hum_chp_bon_gor.snps.sort.txt
join MA0050.3_Irf1_cut-10_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0050.3_Irf1_cut-10_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org.snps.txt > MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org.snps.sort.txt
join MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0050.3_Irf1_cut-10_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org_rhe.snps.txt > MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0050.3_Irf1_cut-10_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0467.2_Crx_cut-104
sort -k1,1 ../human_chimp/processed/MA0467.2_Crx_cut-104_hum_chp.snps.txt > MA0467.2_Crx_cut-104_hum_chp.snps.sort.txt
join MA0467.2_Crx_cut-104_hum_chp.snps.sort.txt ../process_bon/processed/MA0467.2_Crx_cut-104_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0467.2_Crx_cut-104_hum_chp_bon.pre.snps.txt
python reformat.py MA0467.2_Crx_cut-104_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0467.2_Crx_cut-104_hum_chp_bon.snps.txt > MA0467.2_Crx_cut-104_hum_chp_bon.snps.sort.txt
join MA0467.2_Crx_cut-104_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0467.2_Crx_cut-104_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0467.2_Crx_cut-104_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0467.2_Crx_cut-104_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0467.2_Crx_cut-104_hum_chp_bon_gor.snps.txt > MA0467.2_Crx_cut-104_hum_chp_bon_gor.snps.sort.txt
join MA0467.2_Crx_cut-104_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0467.2_Crx_cut-104_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0467.2_Crx_cut-104_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0467.2_Crx_cut-104_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0467.2_Crx_cut-104_hum_chp_bon_gor_org.snps.txt > MA0467.2_Crx_cut-104_hum_chp_bon_gor_org.snps.sort.txt
join MA0467.2_Crx_cut-104_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0467.2_Crx_cut-104_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0467.2_Crx_cut-104_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0467.2_Crx_cut-104_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0467.2_Crx_cut-104_hum_chp_bon_gor_org_rhe.snps.txt > MA0467.2_Crx_cut-104_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0467.2_Crx_cut-104_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0491.2_JUND_cut-97
sort -k1,1 ../human_chimp/processed/MA0491.2_JUND_cut-97_hum_chp.snps.txt > MA0491.2_JUND_cut-97_hum_chp.snps.sort.txt
join MA0491.2_JUND_cut-97_hum_chp.snps.sort.txt ../process_bon/processed/MA0491.2_JUND_cut-97_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0491.2_JUND_cut-97_hum_chp_bon.pre.snps.txt
python reformat.py MA0491.2_JUND_cut-97_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0491.2_JUND_cut-97_hum_chp_bon.snps.txt > MA0491.2_JUND_cut-97_hum_chp_bon.snps.sort.txt
join MA0491.2_JUND_cut-97_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0491.2_JUND_cut-97_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0491.2_JUND_cut-97_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0491.2_JUND_cut-97_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0491.2_JUND_cut-97_hum_chp_bon_gor.snps.txt > MA0491.2_JUND_cut-97_hum_chp_bon_gor.snps.sort.txt
join MA0491.2_JUND_cut-97_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0491.2_JUND_cut-97_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0491.2_JUND_cut-97_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0491.2_JUND_cut-97_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0491.2_JUND_cut-97_hum_chp_bon_gor_org.snps.txt > MA0491.2_JUND_cut-97_hum_chp_bon_gor_org.snps.sort.txt
join MA0491.2_JUND_cut-97_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0491.2_JUND_cut-97_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0491.2_JUND_cut-97_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0491.2_JUND_cut-97_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0491.2_JUND_cut-97_hum_chp_bon_gor_org_rhe.snps.txt > MA0491.2_JUND_cut-97_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0491.2_JUND_cut-97_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1597.1_ZNF528_cut-1152
sort -k1,1 ../human_chimp/processed/MA1597.1_ZNF528_cut-1152_hum_chp.snps.txt > MA1597.1_ZNF528_cut-1152_hum_chp.snps.sort.txt
join MA1597.1_ZNF528_cut-1152_hum_chp.snps.sort.txt ../process_bon/processed/MA1597.1_ZNF528_cut-1152_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1597.1_ZNF528_cut-1152_hum_chp_bon.pre.snps.txt
python reformat.py MA1597.1_ZNF528_cut-1152_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1597.1_ZNF528_cut-1152_hum_chp_bon.snps.txt > MA1597.1_ZNF528_cut-1152_hum_chp_bon.snps.sort.txt
join MA1597.1_ZNF528_cut-1152_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1597.1_ZNF528_cut-1152_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor.snps.txt > MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor.snps.sort.txt
join MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1597.1_ZNF528_cut-1152_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org.snps.txt > MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org.snps.sort.txt
join MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1597.1_ZNF528_cut-1152_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org_rhe.snps.txt > MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1597.1_ZNF528_cut-1152_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0143.4_SOX2_cut161
sort -k1,1 ../human_chimp/processed/MA0143.4_SOX2_cut161_hum_chp.snps.txt > MA0143.4_SOX2_cut161_hum_chp.snps.sort.txt
join MA0143.4_SOX2_cut161_hum_chp.snps.sort.txt ../process_bon/processed/MA0143.4_SOX2_cut161_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0143.4_SOX2_cut161_hum_chp_bon.pre.snps.txt
python reformat.py MA0143.4_SOX2_cut161_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0143.4_SOX2_cut161_hum_chp_bon.snps.txt > MA0143.4_SOX2_cut161_hum_chp_bon.snps.sort.txt
join MA0143.4_SOX2_cut161_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0143.4_SOX2_cut161_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0143.4_SOX2_cut161_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0143.4_SOX2_cut161_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0143.4_SOX2_cut161_hum_chp_bon_gor.snps.txt > MA0143.4_SOX2_cut161_hum_chp_bon_gor.snps.sort.txt
join MA0143.4_SOX2_cut161_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0143.4_SOX2_cut161_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0143.4_SOX2_cut161_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0143.4_SOX2_cut161_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0143.4_SOX2_cut161_hum_chp_bon_gor_org.snps.txt > MA0143.4_SOX2_cut161_hum_chp_bon_gor_org.snps.sort.txt
join MA0143.4_SOX2_cut161_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0143.4_SOX2_cut161_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0143.4_SOX2_cut161_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0143.4_SOX2_cut161_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0143.4_SOX2_cut161_hum_chp_bon_gor_org_rhe.snps.txt > MA0143.4_SOX2_cut161_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0143.4_SOX2_cut161_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0479.1_FOXH1_cut-9945
sort -k1,1 ../human_chimp/processed/MA0479.1_FOXH1_cut-9945_hum_chp.snps.txt > MA0479.1_FOXH1_cut-9945_hum_chp.snps.sort.txt
join MA0479.1_FOXH1_cut-9945_hum_chp.snps.sort.txt ../process_bon/processed/MA0479.1_FOXH1_cut-9945_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0479.1_FOXH1_cut-9945_hum_chp_bon.pre.snps.txt
python reformat.py MA0479.1_FOXH1_cut-9945_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0479.1_FOXH1_cut-9945_hum_chp_bon.snps.txt > MA0479.1_FOXH1_cut-9945_hum_chp_bon.snps.sort.txt
join MA0479.1_FOXH1_cut-9945_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0479.1_FOXH1_cut-9945_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor.snps.txt > MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor.snps.sort.txt
join MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0479.1_FOXH1_cut-9945_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org.snps.txt > MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org.snps.sort.txt
join MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0479.1_FOXH1_cut-9945_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org_rhe.snps.txt > MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0479.1_FOXH1_cut-9945_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0105.4_NFKB1_cut-2510
sort -k1,1 ../human_chimp/processed/MA0105.4_NFKB1_cut-2510_hum_chp.snps.txt > MA0105.4_NFKB1_cut-2510_hum_chp.snps.sort.txt
join MA0105.4_NFKB1_cut-2510_hum_chp.snps.sort.txt ../process_bon/processed/MA0105.4_NFKB1_cut-2510_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0105.4_NFKB1_cut-2510_hum_chp_bon.pre.snps.txt
python reformat.py MA0105.4_NFKB1_cut-2510_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0105.4_NFKB1_cut-2510_hum_chp_bon.snps.txt > MA0105.4_NFKB1_cut-2510_hum_chp_bon.snps.sort.txt
join MA0105.4_NFKB1_cut-2510_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0105.4_NFKB1_cut-2510_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor.snps.txt > MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor.snps.sort.txt
join MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0105.4_NFKB1_cut-2510_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org.snps.txt > MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org.snps.sort.txt
join MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0105.4_NFKB1_cut-2510_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org_rhe.snps.txt > MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0105.4_NFKB1_cut-2510_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0769.2_TCF7_cut39
sort -k1,1 ../human_chimp/processed/MA0769.2_TCF7_cut39_hum_chp.snps.txt > MA0769.2_TCF7_cut39_hum_chp.snps.sort.txt
join MA0769.2_TCF7_cut39_hum_chp.snps.sort.txt ../process_bon/processed/MA0769.2_TCF7_cut39_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0769.2_TCF7_cut39_hum_chp_bon.pre.snps.txt
python reformat.py MA0769.2_TCF7_cut39_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0769.2_TCF7_cut39_hum_chp_bon.snps.txt > MA0769.2_TCF7_cut39_hum_chp_bon.snps.sort.txt
join MA0769.2_TCF7_cut39_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0769.2_TCF7_cut39_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0769.2_TCF7_cut39_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0769.2_TCF7_cut39_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0769.2_TCF7_cut39_hum_chp_bon_gor.snps.txt > MA0769.2_TCF7_cut39_hum_chp_bon_gor.snps.sort.txt
join MA0769.2_TCF7_cut39_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0769.2_TCF7_cut39_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0769.2_TCF7_cut39_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0769.2_TCF7_cut39_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0769.2_TCF7_cut39_hum_chp_bon_gor_org.snps.txt > MA0769.2_TCF7_cut39_hum_chp_bon_gor_org.snps.sort.txt
join MA0769.2_TCF7_cut39_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0769.2_TCF7_cut39_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0769.2_TCF7_cut39_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0769.2_TCF7_cut39_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0769.2_TCF7_cut39_hum_chp_bon_gor_org_rhe.snps.txt > MA0769.2_TCF7_cut39_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0769.2_TCF7_cut39_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1583.1_ZFP57_cut-221
sort -k1,1 ../human_chimp/processed/MA1583.1_ZFP57_cut-221_hum_chp.snps.txt > MA1583.1_ZFP57_cut-221_hum_chp.snps.sort.txt
join MA1583.1_ZFP57_cut-221_hum_chp.snps.sort.txt ../process_bon/processed/MA1583.1_ZFP57_cut-221_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1583.1_ZFP57_cut-221_hum_chp_bon.pre.snps.txt
python reformat.py MA1583.1_ZFP57_cut-221_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1583.1_ZFP57_cut-221_hum_chp_bon.snps.txt > MA1583.1_ZFP57_cut-221_hum_chp_bon.snps.sort.txt
join MA1583.1_ZFP57_cut-221_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1583.1_ZFP57_cut-221_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1583.1_ZFP57_cut-221_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1583.1_ZFP57_cut-221_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1583.1_ZFP57_cut-221_hum_chp_bon_gor.snps.txt > MA1583.1_ZFP57_cut-221_hum_chp_bon_gor.snps.sort.txt
join MA1583.1_ZFP57_cut-221_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1583.1_ZFP57_cut-221_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org.snps.txt > MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org.snps.sort.txt
join MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1583.1_ZFP57_cut-221_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org_rhe.snps.txt > MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1583.1_ZFP57_cut-221_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0157.3_Foxo3_cut206
sort -k1,1 ../human_chimp/processed/MA0157.3_Foxo3_cut206_hum_chp.snps.txt > MA0157.3_Foxo3_cut206_hum_chp.snps.sort.txt
join MA0157.3_Foxo3_cut206_hum_chp.snps.sort.txt ../process_bon/processed/MA0157.3_Foxo3_cut206_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0157.3_Foxo3_cut206_hum_chp_bon.pre.snps.txt
python reformat.py MA0157.3_Foxo3_cut206_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0157.3_Foxo3_cut206_hum_chp_bon.snps.txt > MA0157.3_Foxo3_cut206_hum_chp_bon.snps.sort.txt
join MA0157.3_Foxo3_cut206_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0157.3_Foxo3_cut206_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0157.3_Foxo3_cut206_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0157.3_Foxo3_cut206_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0157.3_Foxo3_cut206_hum_chp_bon_gor.snps.txt > MA0157.3_Foxo3_cut206_hum_chp_bon_gor.snps.sort.txt
join MA0157.3_Foxo3_cut206_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0157.3_Foxo3_cut206_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org.snps.txt > MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org.snps.sort.txt
join MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0157.3_Foxo3_cut206_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org_rhe.snps.txt > MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0157.3_Foxo3_cut206_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1654.1_ZNF16_cut-1705
sort -k1,1 ../human_chimp/processed/MA1654.1_ZNF16_cut-1705_hum_chp.snps.txt > MA1654.1_ZNF16_cut-1705_hum_chp.snps.sort.txt
join MA1654.1_ZNF16_cut-1705_hum_chp.snps.sort.txt ../process_bon/processed/MA1654.1_ZNF16_cut-1705_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1654.1_ZNF16_cut-1705_hum_chp_bon.pre.snps.txt
python reformat.py MA1654.1_ZNF16_cut-1705_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1654.1_ZNF16_cut-1705_hum_chp_bon.snps.txt > MA1654.1_ZNF16_cut-1705_hum_chp_bon.snps.sort.txt
join MA1654.1_ZNF16_cut-1705_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1654.1_ZNF16_cut-1705_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor.snps.txt > MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor.snps.sort.txt
join MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1654.1_ZNF16_cut-1705_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org.snps.txt > MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org.snps.sort.txt
join MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1654.1_ZNF16_cut-1705_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org_rhe.snps.txt > MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1654.1_ZNF16_cut-1705_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0606.2_Nfat5_cut95
sort -k1,1 ../human_chimp/processed/MA0606.2_Nfat5_cut95_hum_chp.snps.txt > MA0606.2_Nfat5_cut95_hum_chp.snps.sort.txt
join MA0606.2_Nfat5_cut95_hum_chp.snps.sort.txt ../process_bon/processed/MA0606.2_Nfat5_cut95_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0606.2_Nfat5_cut95_hum_chp_bon.pre.snps.txt
python reformat.py MA0606.2_Nfat5_cut95_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0606.2_Nfat5_cut95_hum_chp_bon.snps.txt > MA0606.2_Nfat5_cut95_hum_chp_bon.snps.sort.txt
join MA0606.2_Nfat5_cut95_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0606.2_Nfat5_cut95_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0606.2_Nfat5_cut95_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0606.2_Nfat5_cut95_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0606.2_Nfat5_cut95_hum_chp_bon_gor.snps.txt > MA0606.2_Nfat5_cut95_hum_chp_bon_gor.snps.sort.txt
join MA0606.2_Nfat5_cut95_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0606.2_Nfat5_cut95_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org.snps.txt > MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org.snps.sort.txt
join MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0606.2_Nfat5_cut95_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org_rhe.snps.txt > MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0606.2_Nfat5_cut95_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0499.2_MYOD1_cut-83
sort -k1,1 ../human_chimp/processed/MA0499.2_MYOD1_cut-83_hum_chp.snps.txt > MA0499.2_MYOD1_cut-83_hum_chp.snps.sort.txt
join MA0499.2_MYOD1_cut-83_hum_chp.snps.sort.txt ../process_bon/processed/MA0499.2_MYOD1_cut-83_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0499.2_MYOD1_cut-83_hum_chp_bon.pre.snps.txt
python reformat.py MA0499.2_MYOD1_cut-83_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0499.2_MYOD1_cut-83_hum_chp_bon.snps.txt > MA0499.2_MYOD1_cut-83_hum_chp_bon.snps.sort.txt
join MA0499.2_MYOD1_cut-83_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0499.2_MYOD1_cut-83_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0499.2_MYOD1_cut-83_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0499.2_MYOD1_cut-83_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0499.2_MYOD1_cut-83_hum_chp_bon_gor.snps.txt > MA0499.2_MYOD1_cut-83_hum_chp_bon_gor.snps.sort.txt
join MA0499.2_MYOD1_cut-83_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0499.2_MYOD1_cut-83_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org.snps.txt > MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org.snps.sort.txt
join MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0499.2_MYOD1_cut-83_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org_rhe.snps.txt > MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0499.2_MYOD1_cut-83_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0137.3_STAT1_cut-1379
sort -k1,1 ../human_chimp/processed/MA0137.3_STAT1_cut-1379_hum_chp.snps.txt > MA0137.3_STAT1_cut-1379_hum_chp.snps.sort.txt
join MA0137.3_STAT1_cut-1379_hum_chp.snps.sort.txt ../process_bon/processed/MA0137.3_STAT1_cut-1379_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0137.3_STAT1_cut-1379_hum_chp_bon.pre.snps.txt
python reformat.py MA0137.3_STAT1_cut-1379_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0137.3_STAT1_cut-1379_hum_chp_bon.snps.txt > MA0137.3_STAT1_cut-1379_hum_chp_bon.snps.sort.txt
join MA0137.3_STAT1_cut-1379_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0137.3_STAT1_cut-1379_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0137.3_STAT1_cut-1379_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0137.3_STAT1_cut-1379_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0137.3_STAT1_cut-1379_hum_chp_bon_gor.snps.txt > MA0137.3_STAT1_cut-1379_hum_chp_bon_gor.snps.sort.txt
join MA0137.3_STAT1_cut-1379_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0137.3_STAT1_cut-1379_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org.snps.txt > MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org.snps.sort.txt
join MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0137.3_STAT1_cut-1379_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org_rhe.snps.txt > MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0137.3_STAT1_cut-1379_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1472.2_Bhlha15_cut-109
sort -k1,1 ../human_chimp/processed/MA1472.2_Bhlha15_cut-109_hum_chp.snps.txt > MA1472.2_Bhlha15_cut-109_hum_chp.snps.sort.txt
join MA1472.2_Bhlha15_cut-109_hum_chp.snps.sort.txt ../process_bon/processed/MA1472.2_Bhlha15_cut-109_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1472.2_Bhlha15_cut-109_hum_chp_bon.pre.snps.txt
python reformat.py MA1472.2_Bhlha15_cut-109_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1472.2_Bhlha15_cut-109_hum_chp_bon.snps.txt > MA1472.2_Bhlha15_cut-109_hum_chp_bon.snps.sort.txt
join MA1472.2_Bhlha15_cut-109_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1472.2_Bhlha15_cut-109_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor.snps.txt > MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor.snps.sort.txt
join MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1472.2_Bhlha15_cut-109_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org.snps.txt > MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org.snps.sort.txt
join MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1472.2_Bhlha15_cut-109_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org_rhe.snps.txt > MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1472.2_Bhlha15_cut-109_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0062.3_GABPA_cut36
sort -k1,1 ../human_chimp/processed/MA0062.3_GABPA_cut36_hum_chp.snps.txt > MA0062.3_GABPA_cut36_hum_chp.snps.sort.txt
join MA0062.3_GABPA_cut36_hum_chp.snps.sort.txt ../process_bon/processed/MA0062.3_GABPA_cut36_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0062.3_GABPA_cut36_hum_chp_bon.pre.snps.txt
python reformat.py MA0062.3_GABPA_cut36_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0062.3_GABPA_cut36_hum_chp_bon.snps.txt > MA0062.3_GABPA_cut36_hum_chp_bon.snps.sort.txt
join MA0062.3_GABPA_cut36_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0062.3_GABPA_cut36_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0062.3_GABPA_cut36_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0062.3_GABPA_cut36_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0062.3_GABPA_cut36_hum_chp_bon_gor.snps.txt > MA0062.3_GABPA_cut36_hum_chp_bon_gor.snps.sort.txt
join MA0062.3_GABPA_cut36_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0062.3_GABPA_cut36_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0062.3_GABPA_cut36_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0062.3_GABPA_cut36_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0062.3_GABPA_cut36_hum_chp_bon_gor_org.snps.txt > MA0062.3_GABPA_cut36_hum_chp_bon_gor_org.snps.sort.txt
join MA0062.3_GABPA_cut36_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0062.3_GABPA_cut36_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0062.3_GABPA_cut36_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0062.3_GABPA_cut36_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0062.3_GABPA_cut36_hum_chp_bon_gor_org_rhe.snps.txt > MA0062.3_GABPA_cut36_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0062.3_GABPA_cut36_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0142.1_Pou5f1::Sox2_cut-104
sort -k1,1 ../human_chimp/processed/MA0142.1_Pou5f1::Sox2_cut-104_hum_chp.snps.txt > MA0142.1_Pou5f1::Sox2_cut-104_hum_chp.snps.sort.txt
join MA0142.1_Pou5f1::Sox2_cut-104_hum_chp.snps.sort.txt ../process_bon/processed/MA0142.1_Pou5f1::Sox2_cut-104_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon.pre.snps.txt
python reformat.py MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon.snps.txt > MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon.snps.sort.txt
join MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0142.1_Pou5f1::Sox2_cut-104_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor.snps.txt > MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor.snps.sort.txt
join MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0142.1_Pou5f1::Sox2_cut-104_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org.snps.txt > MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org.snps.sort.txt
join MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0142.1_Pou5f1::Sox2_cut-104_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org_rhe.snps.txt > MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0142.1_Pou5f1::Sox2_cut-104_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0821.2_HES5_cut10
sort -k1,1 ../human_chimp/processed/MA0821.2_HES5_cut10_hum_chp.snps.txt > MA0821.2_HES5_cut10_hum_chp.snps.sort.txt
join MA0821.2_HES5_cut10_hum_chp.snps.sort.txt ../process_bon/processed/MA0821.2_HES5_cut10_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0821.2_HES5_cut10_hum_chp_bon.pre.snps.txt
python reformat.py MA0821.2_HES5_cut10_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0821.2_HES5_cut10_hum_chp_bon.snps.txt > MA0821.2_HES5_cut10_hum_chp_bon.snps.sort.txt
join MA0821.2_HES5_cut10_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0821.2_HES5_cut10_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0821.2_HES5_cut10_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0821.2_HES5_cut10_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0821.2_HES5_cut10_hum_chp_bon_gor.snps.txt > MA0821.2_HES5_cut10_hum_chp_bon_gor.snps.sort.txt
join MA0821.2_HES5_cut10_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0821.2_HES5_cut10_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0821.2_HES5_cut10_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0821.2_HES5_cut10_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0821.2_HES5_cut10_hum_chp_bon_gor_org.snps.txt > MA0821.2_HES5_cut10_hum_chp_bon_gor_org.snps.sort.txt
join MA0821.2_HES5_cut10_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0821.2_HES5_cut10_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0821.2_HES5_cut10_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0821.2_HES5_cut10_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0821.2_HES5_cut10_hum_chp_bon_gor_org_rhe.snps.txt > MA0821.2_HES5_cut10_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0821.2_HES5_cut10_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0703.2_LMX1B_cut-10201
sort -k1,1 ../human_chimp/processed/MA0703.2_LMX1B_cut-10201_hum_chp.snps.txt > MA0703.2_LMX1B_cut-10201_hum_chp.snps.sort.txt
join MA0703.2_LMX1B_cut-10201_hum_chp.snps.sort.txt ../process_bon/processed/MA0703.2_LMX1B_cut-10201_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0703.2_LMX1B_cut-10201_hum_chp_bon.pre.snps.txt
python reformat.py MA0703.2_LMX1B_cut-10201_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0703.2_LMX1B_cut-10201_hum_chp_bon.snps.txt > MA0703.2_LMX1B_cut-10201_hum_chp_bon.snps.sort.txt
join MA0703.2_LMX1B_cut-10201_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0703.2_LMX1B_cut-10201_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor.snps.txt > MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor.snps.sort.txt
join MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0703.2_LMX1B_cut-10201_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org.snps.txt > MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org.snps.sort.txt
join MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0703.2_LMX1B_cut-10201_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org_rhe.snps.txt > MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0703.2_LMX1B_cut-10201_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1975.1_ZNF214_cut-176
sort -k1,1 ../human_chimp/processed/MA1975.1_ZNF214_cut-176_hum_chp.snps.txt > MA1975.1_ZNF214_cut-176_hum_chp.snps.sort.txt
join MA1975.1_ZNF214_cut-176_hum_chp.snps.sort.txt ../process_bon/processed/MA1975.1_ZNF214_cut-176_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1975.1_ZNF214_cut-176_hum_chp_bon.pre.snps.txt
python reformat.py MA1975.1_ZNF214_cut-176_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1975.1_ZNF214_cut-176_hum_chp_bon.snps.txt > MA1975.1_ZNF214_cut-176_hum_chp_bon.snps.sort.txt
join MA1975.1_ZNF214_cut-176_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1975.1_ZNF214_cut-176_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1975.1_ZNF214_cut-176_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1975.1_ZNF214_cut-176_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1975.1_ZNF214_cut-176_hum_chp_bon_gor.snps.txt > MA1975.1_ZNF214_cut-176_hum_chp_bon_gor.snps.sort.txt
join MA1975.1_ZNF214_cut-176_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1975.1_ZNF214_cut-176_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org.snps.txt > MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org.snps.sort.txt
join MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1975.1_ZNF214_cut-176_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org_rhe.snps.txt > MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1975.1_ZNF214_cut-176_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1110.2_Nr1H4_cut-127
sort -k1,1 ../human_chimp/processed/MA1110.2_Nr1H4_cut-127_hum_chp.snps.txt > MA1110.2_Nr1H4_cut-127_hum_chp.snps.sort.txt
join MA1110.2_Nr1H4_cut-127_hum_chp.snps.sort.txt ../process_bon/processed/MA1110.2_Nr1H4_cut-127_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1110.2_Nr1H4_cut-127_hum_chp_bon.pre.snps.txt
python reformat.py MA1110.2_Nr1H4_cut-127_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1110.2_Nr1H4_cut-127_hum_chp_bon.snps.txt > MA1110.2_Nr1H4_cut-127_hum_chp_bon.snps.sort.txt
join MA1110.2_Nr1H4_cut-127_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1110.2_Nr1H4_cut-127_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor.snps.txt > MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor.snps.sort.txt
join MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1110.2_Nr1H4_cut-127_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org.snps.txt > MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org.snps.sort.txt
join MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1110.2_Nr1H4_cut-127_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org_rhe.snps.txt > MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1110.2_Nr1H4_cut-127_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0035.4_GATA1_cut187
sort -k1,1 ../human_chimp/processed/MA0035.4_GATA1_cut187_hum_chp.snps.txt > MA0035.4_GATA1_cut187_hum_chp.snps.sort.txt
join MA0035.4_GATA1_cut187_hum_chp.snps.sort.txt ../process_bon/processed/MA0035.4_GATA1_cut187_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0035.4_GATA1_cut187_hum_chp_bon.pre.snps.txt
python reformat.py MA0035.4_GATA1_cut187_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0035.4_GATA1_cut187_hum_chp_bon.snps.txt > MA0035.4_GATA1_cut187_hum_chp_bon.snps.sort.txt
join MA0035.4_GATA1_cut187_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0035.4_GATA1_cut187_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0035.4_GATA1_cut187_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0035.4_GATA1_cut187_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0035.4_GATA1_cut187_hum_chp_bon_gor.snps.txt > MA0035.4_GATA1_cut187_hum_chp_bon_gor.snps.sort.txt
join MA0035.4_GATA1_cut187_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0035.4_GATA1_cut187_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0035.4_GATA1_cut187_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0035.4_GATA1_cut187_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0035.4_GATA1_cut187_hum_chp_bon_gor_org.snps.txt > MA0035.4_GATA1_cut187_hum_chp_bon_gor_org.snps.sort.txt
join MA0035.4_GATA1_cut187_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0035.4_GATA1_cut187_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0035.4_GATA1_cut187_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0035.4_GATA1_cut187_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0035.4_GATA1_cut187_hum_chp_bon_gor_org_rhe.snps.txt > MA0035.4_GATA1_cut187_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0035.4_GATA1_cut187_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0631.1_Six3_cut-524
sort -k1,1 ../human_chimp/processed/MA0631.1_Six3_cut-524_hum_chp.snps.txt > MA0631.1_Six3_cut-524_hum_chp.snps.sort.txt
join MA0631.1_Six3_cut-524_hum_chp.snps.sort.txt ../process_bon/processed/MA0631.1_Six3_cut-524_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0631.1_Six3_cut-524_hum_chp_bon.pre.snps.txt
python reformat.py MA0631.1_Six3_cut-524_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0631.1_Six3_cut-524_hum_chp_bon.snps.txt > MA0631.1_Six3_cut-524_hum_chp_bon.snps.sort.txt
join MA0631.1_Six3_cut-524_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0631.1_Six3_cut-524_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0631.1_Six3_cut-524_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0631.1_Six3_cut-524_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0631.1_Six3_cut-524_hum_chp_bon_gor.snps.txt > MA0631.1_Six3_cut-524_hum_chp_bon_gor.snps.sort.txt
join MA0631.1_Six3_cut-524_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0631.1_Six3_cut-524_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0631.1_Six3_cut-524_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0631.1_Six3_cut-524_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0631.1_Six3_cut-524_hum_chp_bon_gor_org.snps.txt > MA0631.1_Six3_cut-524_hum_chp_bon_gor_org.snps.sort.txt
join MA0631.1_Six3_cut-524_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0631.1_Six3_cut-524_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0631.1_Six3_cut-524_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0631.1_Six3_cut-524_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0631.1_Six3_cut-524_hum_chp_bon_gor_org_rhe.snps.txt > MA0631.1_Six3_cut-524_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0631.1_Six3_cut-524_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1976.1_ZNF320_cut-867
sort -k1,1 ../human_chimp/processed/MA1976.1_ZNF320_cut-867_hum_chp.snps.txt > MA1976.1_ZNF320_cut-867_hum_chp.snps.sort.txt
join MA1976.1_ZNF320_cut-867_hum_chp.snps.sort.txt ../process_bon/processed/MA1976.1_ZNF320_cut-867_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1976.1_ZNF320_cut-867_hum_chp_bon.pre.snps.txt
python reformat.py MA1976.1_ZNF320_cut-867_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1976.1_ZNF320_cut-867_hum_chp_bon.snps.txt > MA1976.1_ZNF320_cut-867_hum_chp_bon.snps.sort.txt
join MA1976.1_ZNF320_cut-867_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1976.1_ZNF320_cut-867_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1976.1_ZNF320_cut-867_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1976.1_ZNF320_cut-867_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1976.1_ZNF320_cut-867_hum_chp_bon_gor.snps.txt > MA1976.1_ZNF320_cut-867_hum_chp_bon_gor.snps.sort.txt
join MA1976.1_ZNF320_cut-867_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1976.1_ZNF320_cut-867_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org.snps.txt > MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org.snps.sort.txt
join MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1976.1_ZNF320_cut-867_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org_rhe.snps.txt > MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1976.1_ZNF320_cut-867_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1561.1_SOX12_cut-342
sort -k1,1 ../human_chimp/processed/MA1561.1_SOX12_cut-342_hum_chp.snps.txt > MA1561.1_SOX12_cut-342_hum_chp.snps.sort.txt
join MA1561.1_SOX12_cut-342_hum_chp.snps.sort.txt ../process_bon/processed/MA1561.1_SOX12_cut-342_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1561.1_SOX12_cut-342_hum_chp_bon.pre.snps.txt
python reformat.py MA1561.1_SOX12_cut-342_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1561.1_SOX12_cut-342_hum_chp_bon.snps.txt > MA1561.1_SOX12_cut-342_hum_chp_bon.snps.sort.txt
join MA1561.1_SOX12_cut-342_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1561.1_SOX12_cut-342_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1561.1_SOX12_cut-342_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1561.1_SOX12_cut-342_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1561.1_SOX12_cut-342_hum_chp_bon_gor.snps.txt > MA1561.1_SOX12_cut-342_hum_chp_bon_gor.snps.sort.txt
join MA1561.1_SOX12_cut-342_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1561.1_SOX12_cut-342_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org.snps.txt > MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org.snps.sort.txt
join MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1561.1_SOX12_cut-342_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org_rhe.snps.txt > MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1561.1_SOX12_cut-342_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1643.1_NFIB_cut-958
sort -k1,1 ../human_chimp/processed/MA1643.1_NFIB_cut-958_hum_chp.snps.txt > MA1643.1_NFIB_cut-958_hum_chp.snps.sort.txt
join MA1643.1_NFIB_cut-958_hum_chp.snps.sort.txt ../process_bon/processed/MA1643.1_NFIB_cut-958_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1643.1_NFIB_cut-958_hum_chp_bon.pre.snps.txt
python reformat.py MA1643.1_NFIB_cut-958_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1643.1_NFIB_cut-958_hum_chp_bon.snps.txt > MA1643.1_NFIB_cut-958_hum_chp_bon.snps.sort.txt
join MA1643.1_NFIB_cut-958_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1643.1_NFIB_cut-958_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1643.1_NFIB_cut-958_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1643.1_NFIB_cut-958_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1643.1_NFIB_cut-958_hum_chp_bon_gor.snps.txt > MA1643.1_NFIB_cut-958_hum_chp_bon_gor.snps.sort.txt
join MA1643.1_NFIB_cut-958_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1643.1_NFIB_cut-958_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org.snps.txt > MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org.snps.sort.txt
join MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1643.1_NFIB_cut-958_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org_rhe.snps.txt > MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1643.1_NFIB_cut-958_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1607.1_Foxl2_cut131
sort -k1,1 ../human_chimp/processed/MA1607.1_Foxl2_cut131_hum_chp.snps.txt > MA1607.1_Foxl2_cut131_hum_chp.snps.sort.txt
join MA1607.1_Foxl2_cut131_hum_chp.snps.sort.txt ../process_bon/processed/MA1607.1_Foxl2_cut131_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1607.1_Foxl2_cut131_hum_chp_bon.pre.snps.txt
python reformat.py MA1607.1_Foxl2_cut131_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1607.1_Foxl2_cut131_hum_chp_bon.snps.txt > MA1607.1_Foxl2_cut131_hum_chp_bon.snps.sort.txt
join MA1607.1_Foxl2_cut131_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1607.1_Foxl2_cut131_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1607.1_Foxl2_cut131_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1607.1_Foxl2_cut131_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1607.1_Foxl2_cut131_hum_chp_bon_gor.snps.txt > MA1607.1_Foxl2_cut131_hum_chp_bon_gor.snps.sort.txt
join MA1607.1_Foxl2_cut131_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1607.1_Foxl2_cut131_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org.snps.txt > MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org.snps.sort.txt
join MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1607.1_Foxl2_cut131_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org_rhe.snps.txt > MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1607.1_Foxl2_cut131_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0149.1_EWSR1-FLI1_cut-40359
sort -k1,1 ../human_chimp/processed/MA0149.1_EWSR1-FLI1_cut-40359_hum_chp.snps.txt > MA0149.1_EWSR1-FLI1_cut-40359_hum_chp.snps.sort.txt
join MA0149.1_EWSR1-FLI1_cut-40359_hum_chp.snps.sort.txt ../process_bon/processed/MA0149.1_EWSR1-FLI1_cut-40359_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon.pre.snps.txt
python reformat.py MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon.snps.txt > MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon.snps.sort.txt
join MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0149.1_EWSR1-FLI1_cut-40359_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor.snps.txt > MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor.snps.sort.txt
join MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0149.1_EWSR1-FLI1_cut-40359_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org.snps.txt > MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org.snps.sort.txt
join MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0149.1_EWSR1-FLI1_cut-40359_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org_rhe.snps.txt > MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0149.1_EWSR1-FLI1_cut-40359_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1480.1_DPRX_cut72
sort -k1,1 ../human_chimp/processed/MA1480.1_DPRX_cut72_hum_chp.snps.txt > MA1480.1_DPRX_cut72_hum_chp.snps.sort.txt
join MA1480.1_DPRX_cut72_hum_chp.snps.sort.txt ../process_bon/processed/MA1480.1_DPRX_cut72_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1480.1_DPRX_cut72_hum_chp_bon.pre.snps.txt
python reformat.py MA1480.1_DPRX_cut72_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1480.1_DPRX_cut72_hum_chp_bon.snps.txt > MA1480.1_DPRX_cut72_hum_chp_bon.snps.sort.txt
join MA1480.1_DPRX_cut72_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1480.1_DPRX_cut72_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1480.1_DPRX_cut72_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1480.1_DPRX_cut72_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1480.1_DPRX_cut72_hum_chp_bon_gor.snps.txt > MA1480.1_DPRX_cut72_hum_chp_bon_gor.snps.sort.txt
join MA1480.1_DPRX_cut72_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1480.1_DPRX_cut72_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1480.1_DPRX_cut72_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1480.1_DPRX_cut72_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1480.1_DPRX_cut72_hum_chp_bon_gor_org.snps.txt > MA1480.1_DPRX_cut72_hum_chp_bon_gor_org.snps.sort.txt
join MA1480.1_DPRX_cut72_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1480.1_DPRX_cut72_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1480.1_DPRX_cut72_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1480.1_DPRX_cut72_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1480.1_DPRX_cut72_hum_chp_bon_gor_org_rhe.snps.txt > MA1480.1_DPRX_cut72_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1480.1_DPRX_cut72_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0737.1_GLIS3_cut-10440
sort -k1,1 ../human_chimp/processed/MA0737.1_GLIS3_cut-10440_hum_chp.snps.txt > MA0737.1_GLIS3_cut-10440_hum_chp.snps.sort.txt
join MA0737.1_GLIS3_cut-10440_hum_chp.snps.sort.txt ../process_bon/processed/MA0737.1_GLIS3_cut-10440_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0737.1_GLIS3_cut-10440_hum_chp_bon.pre.snps.txt
python reformat.py MA0737.1_GLIS3_cut-10440_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0737.1_GLIS3_cut-10440_hum_chp_bon.snps.txt > MA0737.1_GLIS3_cut-10440_hum_chp_bon.snps.sort.txt
join MA0737.1_GLIS3_cut-10440_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0737.1_GLIS3_cut-10440_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor.snps.txt > MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor.snps.sort.txt
join MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0737.1_GLIS3_cut-10440_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org.snps.txt > MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org.snps.sort.txt
join MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0737.1_GLIS3_cut-10440_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org_rhe.snps.txt > MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0737.1_GLIS3_cut-10440_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1494.1_HNF4A_cut-1923
sort -k1,1 ../human_chimp/processed/MA1494.1_HNF4A_cut-1923_hum_chp.snps.txt > MA1494.1_HNF4A_cut-1923_hum_chp.snps.sort.txt
join MA1494.1_HNF4A_cut-1923_hum_chp.snps.sort.txt ../process_bon/processed/MA1494.1_HNF4A_cut-1923_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1494.1_HNF4A_cut-1923_hum_chp_bon.pre.snps.txt
python reformat.py MA1494.1_HNF4A_cut-1923_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1494.1_HNF4A_cut-1923_hum_chp_bon.snps.txt > MA1494.1_HNF4A_cut-1923_hum_chp_bon.snps.sort.txt
join MA1494.1_HNF4A_cut-1923_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1494.1_HNF4A_cut-1923_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor.snps.txt > MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor.snps.sort.txt
join MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1494.1_HNF4A_cut-1923_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org.snps.txt > MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org.snps.sort.txt
join MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1494.1_HNF4A_cut-1923_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org_rhe.snps.txt > MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1494.1_HNF4A_cut-1923_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0881.1_Dlx4_cut358
sort -k1,1 ../human_chimp/processed/MA0881.1_Dlx4_cut358_hum_chp.snps.txt > MA0881.1_Dlx4_cut358_hum_chp.snps.sort.txt
join MA0881.1_Dlx4_cut358_hum_chp.snps.sort.txt ../process_bon/processed/MA0881.1_Dlx4_cut358_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0881.1_Dlx4_cut358_hum_chp_bon.pre.snps.txt
python reformat.py MA0881.1_Dlx4_cut358_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0881.1_Dlx4_cut358_hum_chp_bon.snps.txt > MA0881.1_Dlx4_cut358_hum_chp_bon.snps.sort.txt
join MA0881.1_Dlx4_cut358_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0881.1_Dlx4_cut358_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0881.1_Dlx4_cut358_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0881.1_Dlx4_cut358_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0881.1_Dlx4_cut358_hum_chp_bon_gor.snps.txt > MA0881.1_Dlx4_cut358_hum_chp_bon_gor.snps.sort.txt
join MA0881.1_Dlx4_cut358_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0881.1_Dlx4_cut358_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org.snps.txt > MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org.snps.sort.txt
join MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0881.1_Dlx4_cut358_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org_rhe.snps.txt > MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0881.1_Dlx4_cut358_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1633.2_BACH1_cut-615
sort -k1,1 ../human_chimp/processed/MA1633.2_BACH1_cut-615_hum_chp.snps.txt > MA1633.2_BACH1_cut-615_hum_chp.snps.sort.txt
join MA1633.2_BACH1_cut-615_hum_chp.snps.sort.txt ../process_bon/processed/MA1633.2_BACH1_cut-615_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1633.2_BACH1_cut-615_hum_chp_bon.pre.snps.txt
python reformat.py MA1633.2_BACH1_cut-615_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1633.2_BACH1_cut-615_hum_chp_bon.snps.txt > MA1633.2_BACH1_cut-615_hum_chp_bon.snps.sort.txt
join MA1633.2_BACH1_cut-615_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1633.2_BACH1_cut-615_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1633.2_BACH1_cut-615_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1633.2_BACH1_cut-615_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1633.2_BACH1_cut-615_hum_chp_bon_gor.snps.txt > MA1633.2_BACH1_cut-615_hum_chp_bon_gor.snps.sort.txt
join MA1633.2_BACH1_cut-615_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1633.2_BACH1_cut-615_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org.snps.txt > MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org.snps.sort.txt
join MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1633.2_BACH1_cut-615_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org_rhe.snps.txt > MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1633.2_BACH1_cut-615_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0597.2_THAP1_cut-55
sort -k1,1 ../human_chimp/processed/MA0597.2_THAP1_cut-55_hum_chp.snps.txt > MA0597.2_THAP1_cut-55_hum_chp.snps.sort.txt
join MA0597.2_THAP1_cut-55_hum_chp.snps.sort.txt ../process_bon/processed/MA0597.2_THAP1_cut-55_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0597.2_THAP1_cut-55_hum_chp_bon.pre.snps.txt
python reformat.py MA0597.2_THAP1_cut-55_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0597.2_THAP1_cut-55_hum_chp_bon.snps.txt > MA0597.2_THAP1_cut-55_hum_chp_bon.snps.sort.txt
join MA0597.2_THAP1_cut-55_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0597.2_THAP1_cut-55_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0597.2_THAP1_cut-55_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0597.2_THAP1_cut-55_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0597.2_THAP1_cut-55_hum_chp_bon_gor.snps.txt > MA0597.2_THAP1_cut-55_hum_chp_bon_gor.snps.sort.txt
join MA0597.2_THAP1_cut-55_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0597.2_THAP1_cut-55_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org.snps.txt > MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org.snps.sort.txt
join MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0597.2_THAP1_cut-55_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org_rhe.snps.txt > MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0597.2_THAP1_cut-55_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0912.2_HOXD3_cut-9330
sort -k1,1 ../human_chimp/processed/MA0912.2_HOXD3_cut-9330_hum_chp.snps.txt > MA0912.2_HOXD3_cut-9330_hum_chp.snps.sort.txt
join MA0912.2_HOXD3_cut-9330_hum_chp.snps.sort.txt ../process_bon/processed/MA0912.2_HOXD3_cut-9330_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0912.2_HOXD3_cut-9330_hum_chp_bon.pre.snps.txt
python reformat.py MA0912.2_HOXD3_cut-9330_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0912.2_HOXD3_cut-9330_hum_chp_bon.snps.txt > MA0912.2_HOXD3_cut-9330_hum_chp_bon.snps.sort.txt
join MA0912.2_HOXD3_cut-9330_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0912.2_HOXD3_cut-9330_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor.snps.txt > MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor.snps.sort.txt
join MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0912.2_HOXD3_cut-9330_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org.snps.txt > MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org.snps.sort.txt
join MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0912.2_HOXD3_cut-9330_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org_rhe.snps.txt > MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0912.2_HOXD3_cut-9330_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1553.1_RARG_cut-421
sort -k1,1 ../human_chimp/processed/MA1553.1_RARG_cut-421_hum_chp.snps.txt > MA1553.1_RARG_cut-421_hum_chp.snps.sort.txt
join MA1553.1_RARG_cut-421_hum_chp.snps.sort.txt ../process_bon/processed/MA1553.1_RARG_cut-421_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1553.1_RARG_cut-421_hum_chp_bon.pre.snps.txt
python reformat.py MA1553.1_RARG_cut-421_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1553.1_RARG_cut-421_hum_chp_bon.snps.txt > MA1553.1_RARG_cut-421_hum_chp_bon.snps.sort.txt
join MA1553.1_RARG_cut-421_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1553.1_RARG_cut-421_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1553.1_RARG_cut-421_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1553.1_RARG_cut-421_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1553.1_RARG_cut-421_hum_chp_bon_gor.snps.txt > MA1553.1_RARG_cut-421_hum_chp_bon_gor.snps.sort.txt
join MA1553.1_RARG_cut-421_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1553.1_RARG_cut-421_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1553.1_RARG_cut-421_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1553.1_RARG_cut-421_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1553.1_RARG_cut-421_hum_chp_bon_gor_org.snps.txt > MA1553.1_RARG_cut-421_hum_chp_bon_gor_org.snps.sort.txt
join MA1553.1_RARG_cut-421_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1553.1_RARG_cut-421_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1553.1_RARG_cut-421_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1553.1_RARG_cut-421_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1553.1_RARG_cut-421_hum_chp_bon_gor_org_rhe.snps.txt > MA1553.1_RARG_cut-421_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1553.1_RARG_cut-421_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1722.1_ZSCAN31_cut-2421
sort -k1,1 ../human_chimp/processed/MA1722.1_ZSCAN31_cut-2421_hum_chp.snps.txt > MA1722.1_ZSCAN31_cut-2421_hum_chp.snps.sort.txt
join MA1722.1_ZSCAN31_cut-2421_hum_chp.snps.sort.txt ../process_bon/processed/MA1722.1_ZSCAN31_cut-2421_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1722.1_ZSCAN31_cut-2421_hum_chp_bon.pre.snps.txt
python reformat.py MA1722.1_ZSCAN31_cut-2421_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1722.1_ZSCAN31_cut-2421_hum_chp_bon.snps.txt > MA1722.1_ZSCAN31_cut-2421_hum_chp_bon.snps.sort.txt
join MA1722.1_ZSCAN31_cut-2421_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1722.1_ZSCAN31_cut-2421_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor.snps.txt > MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor.snps.sort.txt
join MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1722.1_ZSCAN31_cut-2421_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org.snps.txt > MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org.snps.sort.txt
join MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1722.1_ZSCAN31_cut-2421_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org_rhe.snps.txt > MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1722.1_ZSCAN31_cut-2421_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1994.1_Nkx2-1_cut68
sort -k1,1 ../human_chimp/processed/MA1994.1_Nkx2-1_cut68_hum_chp.snps.txt > MA1994.1_Nkx2-1_cut68_hum_chp.snps.sort.txt
join MA1994.1_Nkx2-1_cut68_hum_chp.snps.sort.txt ../process_bon/processed/MA1994.1_Nkx2-1_cut68_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1994.1_Nkx2-1_cut68_hum_chp_bon.pre.snps.txt
python reformat.py MA1994.1_Nkx2-1_cut68_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1994.1_Nkx2-1_cut68_hum_chp_bon.snps.txt > MA1994.1_Nkx2-1_cut68_hum_chp_bon.snps.sort.txt
join MA1994.1_Nkx2-1_cut68_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1994.1_Nkx2-1_cut68_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor.snps.txt > MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor.snps.sort.txt
join MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1994.1_Nkx2-1_cut68_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org.snps.txt > MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org.snps.sort.txt
join MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1994.1_Nkx2-1_cut68_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org_rhe.snps.txt > MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1994.1_Nkx2-1_cut68_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1126.1_FOS::JUN_cut189
sort -k1,1 ../human_chimp/processed/MA1126.1_FOS::JUN_cut189_hum_chp.snps.txt > MA1126.1_FOS::JUN_cut189_hum_chp.snps.sort.txt
join MA1126.1_FOS::JUN_cut189_hum_chp.snps.sort.txt ../process_bon/processed/MA1126.1_FOS::JUN_cut189_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1126.1_FOS::JUN_cut189_hum_chp_bon.pre.snps.txt
python reformat.py MA1126.1_FOS::JUN_cut189_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1126.1_FOS::JUN_cut189_hum_chp_bon.snps.txt > MA1126.1_FOS::JUN_cut189_hum_chp_bon.snps.sort.txt
join MA1126.1_FOS::JUN_cut189_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1126.1_FOS::JUN_cut189_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor.snps.txt > MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor.snps.sort.txt
join MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1126.1_FOS::JUN_cut189_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org.snps.txt > MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org.snps.sort.txt
join MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1126.1_FOS::JUN_cut189_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org_rhe.snps.txt > MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1126.1_FOS::JUN_cut189_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1558.1_SNAI1_cut-109
sort -k1,1 ../human_chimp/processed/MA1558.1_SNAI1_cut-109_hum_chp.snps.txt > MA1558.1_SNAI1_cut-109_hum_chp.snps.sort.txt
join MA1558.1_SNAI1_cut-109_hum_chp.snps.sort.txt ../process_bon/processed/MA1558.1_SNAI1_cut-109_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1558.1_SNAI1_cut-109_hum_chp_bon.pre.snps.txt
python reformat.py MA1558.1_SNAI1_cut-109_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1558.1_SNAI1_cut-109_hum_chp_bon.snps.txt > MA1558.1_SNAI1_cut-109_hum_chp_bon.snps.sort.txt
join MA1558.1_SNAI1_cut-109_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1558.1_SNAI1_cut-109_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1558.1_SNAI1_cut-109_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1558.1_SNAI1_cut-109_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1558.1_SNAI1_cut-109_hum_chp_bon_gor.snps.txt > MA1558.1_SNAI1_cut-109_hum_chp_bon_gor.snps.sort.txt
join MA1558.1_SNAI1_cut-109_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1558.1_SNAI1_cut-109_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org.snps.txt > MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org.snps.sort.txt
join MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1558.1_SNAI1_cut-109_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org_rhe.snps.txt > MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1558.1_SNAI1_cut-109_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0732.1_EGR3_cut-1830
sort -k1,1 ../human_chimp/processed/MA0732.1_EGR3_cut-1830_hum_chp.snps.txt > MA0732.1_EGR3_cut-1830_hum_chp.snps.sort.txt
join MA0732.1_EGR3_cut-1830_hum_chp.snps.sort.txt ../process_bon/processed/MA0732.1_EGR3_cut-1830_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0732.1_EGR3_cut-1830_hum_chp_bon.pre.snps.txt
python reformat.py MA0732.1_EGR3_cut-1830_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0732.1_EGR3_cut-1830_hum_chp_bon.snps.txt > MA0732.1_EGR3_cut-1830_hum_chp_bon.snps.sort.txt
join MA0732.1_EGR3_cut-1830_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0732.1_EGR3_cut-1830_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0732.1_EGR3_cut-1830_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0732.1_EGR3_cut-1830_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0732.1_EGR3_cut-1830_hum_chp_bon_gor.snps.txt > MA0732.1_EGR3_cut-1830_hum_chp_bon_gor.snps.sort.txt
join MA0732.1_EGR3_cut-1830_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0732.1_EGR3_cut-1830_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org.snps.txt > MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org.snps.sort.txt
join MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0732.1_EGR3_cut-1830_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org_rhe.snps.txt > MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0732.1_EGR3_cut-1830_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0753.2_ZNF740_cut-578
sort -k1,1 ../human_chimp/processed/MA0753.2_ZNF740_cut-578_hum_chp.snps.txt > MA0753.2_ZNF740_cut-578_hum_chp.snps.sort.txt
join MA0753.2_ZNF740_cut-578_hum_chp.snps.sort.txt ../process_bon/processed/MA0753.2_ZNF740_cut-578_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0753.2_ZNF740_cut-578_hum_chp_bon.pre.snps.txt
python reformat.py MA0753.2_ZNF740_cut-578_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0753.2_ZNF740_cut-578_hum_chp_bon.snps.txt > MA0753.2_ZNF740_cut-578_hum_chp_bon.snps.sort.txt
join MA0753.2_ZNF740_cut-578_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0753.2_ZNF740_cut-578_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0753.2_ZNF740_cut-578_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0753.2_ZNF740_cut-578_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0753.2_ZNF740_cut-578_hum_chp_bon_gor.snps.txt > MA0753.2_ZNF740_cut-578_hum_chp_bon_gor.snps.sort.txt
join MA0753.2_ZNF740_cut-578_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0753.2_ZNF740_cut-578_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org.snps.txt > MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org.snps.sort.txt
join MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0753.2_ZNF740_cut-578_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org_rhe.snps.txt > MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0753.2_ZNF740_cut-578_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1419.1_IRF4_cut-2408
sort -k1,1 ../human_chimp/processed/MA1419.1_IRF4_cut-2408_hum_chp.snps.txt > MA1419.1_IRF4_cut-2408_hum_chp.snps.sort.txt
join MA1419.1_IRF4_cut-2408_hum_chp.snps.sort.txt ../process_bon/processed/MA1419.1_IRF4_cut-2408_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1419.1_IRF4_cut-2408_hum_chp_bon.pre.snps.txt
python reformat.py MA1419.1_IRF4_cut-2408_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1419.1_IRF4_cut-2408_hum_chp_bon.snps.txt > MA1419.1_IRF4_cut-2408_hum_chp_bon.snps.sort.txt
join MA1419.1_IRF4_cut-2408_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1419.1_IRF4_cut-2408_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1419.1_IRF4_cut-2408_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1419.1_IRF4_cut-2408_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1419.1_IRF4_cut-2408_hum_chp_bon_gor.snps.txt > MA1419.1_IRF4_cut-2408_hum_chp_bon_gor.snps.sort.txt
join MA1419.1_IRF4_cut-2408_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1419.1_IRF4_cut-2408_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org.snps.txt > MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org.snps.sort.txt
join MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1419.1_IRF4_cut-2408_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org_rhe.snps.txt > MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1419.1_IRF4_cut-2408_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0618.1_LBX1_cut-9113
sort -k1,1 ../human_chimp/processed/MA0618.1_LBX1_cut-9113_hum_chp.snps.txt > MA0618.1_LBX1_cut-9113_hum_chp.snps.sort.txt
join MA0618.1_LBX1_cut-9113_hum_chp.snps.sort.txt ../process_bon/processed/MA0618.1_LBX1_cut-9113_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0618.1_LBX1_cut-9113_hum_chp_bon.pre.snps.txt
python reformat.py MA0618.1_LBX1_cut-9113_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0618.1_LBX1_cut-9113_hum_chp_bon.snps.txt > MA0618.1_LBX1_cut-9113_hum_chp_bon.snps.sort.txt
join MA0618.1_LBX1_cut-9113_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0618.1_LBX1_cut-9113_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0618.1_LBX1_cut-9113_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0618.1_LBX1_cut-9113_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0618.1_LBX1_cut-9113_hum_chp_bon_gor.snps.txt > MA0618.1_LBX1_cut-9113_hum_chp_bon_gor.snps.sort.txt
join MA0618.1_LBX1_cut-9113_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0618.1_LBX1_cut-9113_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org.snps.txt > MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org.snps.sort.txt
join MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0618.1_LBX1_cut-9113_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org_rhe.snps.txt > MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0618.1_LBX1_cut-9113_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0628.1_POU6F1_cut212
sort -k1,1 ../human_chimp/processed/MA0628.1_POU6F1_cut212_hum_chp.snps.txt > MA0628.1_POU6F1_cut212_hum_chp.snps.sort.txt
join MA0628.1_POU6F1_cut212_hum_chp.snps.sort.txt ../process_bon/processed/MA0628.1_POU6F1_cut212_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0628.1_POU6F1_cut212_hum_chp_bon.pre.snps.txt
python reformat.py MA0628.1_POU6F1_cut212_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0628.1_POU6F1_cut212_hum_chp_bon.snps.txt > MA0628.1_POU6F1_cut212_hum_chp_bon.snps.sort.txt
join MA0628.1_POU6F1_cut212_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0628.1_POU6F1_cut212_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0628.1_POU6F1_cut212_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0628.1_POU6F1_cut212_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0628.1_POU6F1_cut212_hum_chp_bon_gor.snps.txt > MA0628.1_POU6F1_cut212_hum_chp_bon_gor.snps.sort.txt
join MA0628.1_POU6F1_cut212_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0628.1_POU6F1_cut212_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org.snps.txt > MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org.snps.sort.txt
join MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0628.1_POU6F1_cut212_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org_rhe.snps.txt > MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0628.1_POU6F1_cut212_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0476.1_FOS_cut-10101
sort -k1,1 ../human_chimp/processed/MA0476.1_FOS_cut-10101_hum_chp.snps.txt > MA0476.1_FOS_cut-10101_hum_chp.snps.sort.txt
join MA0476.1_FOS_cut-10101_hum_chp.snps.sort.txt ../process_bon/processed/MA0476.1_FOS_cut-10101_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0476.1_FOS_cut-10101_hum_chp_bon.pre.snps.txt
python reformat.py MA0476.1_FOS_cut-10101_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0476.1_FOS_cut-10101_hum_chp_bon.snps.txt > MA0476.1_FOS_cut-10101_hum_chp_bon.snps.sort.txt
join MA0476.1_FOS_cut-10101_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0476.1_FOS_cut-10101_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0476.1_FOS_cut-10101_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0476.1_FOS_cut-10101_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0476.1_FOS_cut-10101_hum_chp_bon_gor.snps.txt > MA0476.1_FOS_cut-10101_hum_chp_bon_gor.snps.sort.txt
join MA0476.1_FOS_cut-10101_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0476.1_FOS_cut-10101_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org.snps.txt > MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org.snps.sort.txt
join MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0476.1_FOS_cut-10101_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org_rhe.snps.txt > MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0476.1_FOS_cut-10101_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1122.1_TFDP1_cut-50
sort -k1,1 ../human_chimp/processed/MA1122.1_TFDP1_cut-50_hum_chp.snps.txt > MA1122.1_TFDP1_cut-50_hum_chp.snps.sort.txt
join MA1122.1_TFDP1_cut-50_hum_chp.snps.sort.txt ../process_bon/processed/MA1122.1_TFDP1_cut-50_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1122.1_TFDP1_cut-50_hum_chp_bon.pre.snps.txt
python reformat.py MA1122.1_TFDP1_cut-50_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1122.1_TFDP1_cut-50_hum_chp_bon.snps.txt > MA1122.1_TFDP1_cut-50_hum_chp_bon.snps.sort.txt
join MA1122.1_TFDP1_cut-50_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1122.1_TFDP1_cut-50_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1122.1_TFDP1_cut-50_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1122.1_TFDP1_cut-50_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1122.1_TFDP1_cut-50_hum_chp_bon_gor.snps.txt > MA1122.1_TFDP1_cut-50_hum_chp_bon_gor.snps.sort.txt
join MA1122.1_TFDP1_cut-50_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1122.1_TFDP1_cut-50_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org.snps.txt > MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org.snps.sort.txt
join MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1122.1_TFDP1_cut-50_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org_rhe.snps.txt > MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1122.1_TFDP1_cut-50_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0162.4_EGR1_cut-117
sort -k1,1 ../human_chimp/processed/MA0162.4_EGR1_cut-117_hum_chp.snps.txt > MA0162.4_EGR1_cut-117_hum_chp.snps.sort.txt
join MA0162.4_EGR1_cut-117_hum_chp.snps.sort.txt ../process_bon/processed/MA0162.4_EGR1_cut-117_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0162.4_EGR1_cut-117_hum_chp_bon.pre.snps.txt
python reformat.py MA0162.4_EGR1_cut-117_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0162.4_EGR1_cut-117_hum_chp_bon.snps.txt > MA0162.4_EGR1_cut-117_hum_chp_bon.snps.sort.txt
join MA0162.4_EGR1_cut-117_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0162.4_EGR1_cut-117_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0162.4_EGR1_cut-117_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0162.4_EGR1_cut-117_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0162.4_EGR1_cut-117_hum_chp_bon_gor.snps.txt > MA0162.4_EGR1_cut-117_hum_chp_bon_gor.snps.sort.txt
join MA0162.4_EGR1_cut-117_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0162.4_EGR1_cut-117_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org.snps.txt > MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org.snps.sort.txt
join MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0162.4_EGR1_cut-117_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org_rhe.snps.txt > MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0162.4_EGR1_cut-117_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0080.6_Spi1_cut-170
sort -k1,1 ../human_chimp/processed/MA0080.6_Spi1_cut-170_hum_chp.snps.txt > MA0080.6_Spi1_cut-170_hum_chp.snps.sort.txt
join MA0080.6_Spi1_cut-170_hum_chp.snps.sort.txt ../process_bon/processed/MA0080.6_Spi1_cut-170_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0080.6_Spi1_cut-170_hum_chp_bon.pre.snps.txt
python reformat.py MA0080.6_Spi1_cut-170_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0080.6_Spi1_cut-170_hum_chp_bon.snps.txt > MA0080.6_Spi1_cut-170_hum_chp_bon.snps.sort.txt
join MA0080.6_Spi1_cut-170_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0080.6_Spi1_cut-170_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0080.6_Spi1_cut-170_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0080.6_Spi1_cut-170_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0080.6_Spi1_cut-170_hum_chp_bon_gor.snps.txt > MA0080.6_Spi1_cut-170_hum_chp_bon_gor.snps.sort.txt
join MA0080.6_Spi1_cut-170_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0080.6_Spi1_cut-170_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org.snps.txt > MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org.snps.sort.txt
join MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0080.6_Spi1_cut-170_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org_rhe.snps.txt > MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0080.6_Spi1_cut-170_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1953.1_FOXO1::ELF1_cut-118
sort -k1,1 ../human_chimp/processed/MA1953.1_FOXO1::ELF1_cut-118_hum_chp.snps.txt > MA1953.1_FOXO1::ELF1_cut-118_hum_chp.snps.sort.txt
join MA1953.1_FOXO1::ELF1_cut-118_hum_chp.snps.sort.txt ../process_bon/processed/MA1953.1_FOXO1::ELF1_cut-118_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon.pre.snps.txt
python reformat.py MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon.snps.txt > MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon.snps.sort.txt
join MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1953.1_FOXO1::ELF1_cut-118_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor.snps.txt > MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor.snps.sort.txt
join MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1953.1_FOXO1::ELF1_cut-118_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org.snps.txt > MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org.snps.sort.txt
join MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1953.1_FOXO1::ELF1_cut-118_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org_rhe.snps.txt > MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1953.1_FOXO1::ELF1_cut-118_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0102.4_CEBPA_cut38
sort -k1,1 ../human_chimp/processed/MA0102.4_CEBPA_cut38_hum_chp.snps.txt > MA0102.4_CEBPA_cut38_hum_chp.snps.sort.txt
join MA0102.4_CEBPA_cut38_hum_chp.snps.sort.txt ../process_bon/processed/MA0102.4_CEBPA_cut38_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0102.4_CEBPA_cut38_hum_chp_bon.pre.snps.txt
python reformat.py MA0102.4_CEBPA_cut38_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0102.4_CEBPA_cut38_hum_chp_bon.snps.txt > MA0102.4_CEBPA_cut38_hum_chp_bon.snps.sort.txt
join MA0102.4_CEBPA_cut38_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0102.4_CEBPA_cut38_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0102.4_CEBPA_cut38_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0102.4_CEBPA_cut38_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0102.4_CEBPA_cut38_hum_chp_bon_gor.snps.txt > MA0102.4_CEBPA_cut38_hum_chp_bon_gor.snps.sort.txt
join MA0102.4_CEBPA_cut38_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0102.4_CEBPA_cut38_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org.snps.txt > MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org.snps.sort.txt
join MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0102.4_CEBPA_cut38_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org_rhe.snps.txt > MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0102.4_CEBPA_cut38_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1487.2_FOXE1_cut-365
sort -k1,1 ../human_chimp/processed/MA1487.2_FOXE1_cut-365_hum_chp.snps.txt > MA1487.2_FOXE1_cut-365_hum_chp.snps.sort.txt
join MA1487.2_FOXE1_cut-365_hum_chp.snps.sort.txt ../process_bon/processed/MA1487.2_FOXE1_cut-365_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1487.2_FOXE1_cut-365_hum_chp_bon.pre.snps.txt
python reformat.py MA1487.2_FOXE1_cut-365_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1487.2_FOXE1_cut-365_hum_chp_bon.snps.txt > MA1487.2_FOXE1_cut-365_hum_chp_bon.snps.sort.txt
join MA1487.2_FOXE1_cut-365_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1487.2_FOXE1_cut-365_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1487.2_FOXE1_cut-365_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1487.2_FOXE1_cut-365_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1487.2_FOXE1_cut-365_hum_chp_bon_gor.snps.txt > MA1487.2_FOXE1_cut-365_hum_chp_bon_gor.snps.sort.txt
join MA1487.2_FOXE1_cut-365_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1487.2_FOXE1_cut-365_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org.snps.txt > MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org.snps.sort.txt
join MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1487.2_FOXE1_cut-365_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org_rhe.snps.txt > MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1487.2_FOXE1_cut-365_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1584.1_ZIC5_cut-1909
sort -k1,1 ../human_chimp/processed/MA1584.1_ZIC5_cut-1909_hum_chp.snps.txt > MA1584.1_ZIC5_cut-1909_hum_chp.snps.sort.txt
join MA1584.1_ZIC5_cut-1909_hum_chp.snps.sort.txt ../process_bon/processed/MA1584.1_ZIC5_cut-1909_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1584.1_ZIC5_cut-1909_hum_chp_bon.pre.snps.txt
python reformat.py MA1584.1_ZIC5_cut-1909_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1584.1_ZIC5_cut-1909_hum_chp_bon.snps.txt > MA1584.1_ZIC5_cut-1909_hum_chp_bon.snps.sort.txt
join MA1584.1_ZIC5_cut-1909_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1584.1_ZIC5_cut-1909_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor.snps.txt > MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor.snps.sort.txt
join MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1584.1_ZIC5_cut-1909_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org.snps.txt > MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org.snps.sort.txt
join MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1584.1_ZIC5_cut-1909_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org_rhe.snps.txt > MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1584.1_ZIC5_cut-1909_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0888.1_EVX2_cut332
sort -k1,1 ../human_chimp/processed/MA0888.1_EVX2_cut332_hum_chp.snps.txt > MA0888.1_EVX2_cut332_hum_chp.snps.sort.txt
join MA0888.1_EVX2_cut332_hum_chp.snps.sort.txt ../process_bon/processed/MA0888.1_EVX2_cut332_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0888.1_EVX2_cut332_hum_chp_bon.pre.snps.txt
python reformat.py MA0888.1_EVX2_cut332_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0888.1_EVX2_cut332_hum_chp_bon.snps.txt > MA0888.1_EVX2_cut332_hum_chp_bon.snps.sort.txt
join MA0888.1_EVX2_cut332_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0888.1_EVX2_cut332_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0888.1_EVX2_cut332_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0888.1_EVX2_cut332_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0888.1_EVX2_cut332_hum_chp_bon_gor.snps.txt > MA0888.1_EVX2_cut332_hum_chp_bon_gor.snps.sort.txt
join MA0888.1_EVX2_cut332_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0888.1_EVX2_cut332_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0888.1_EVX2_cut332_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0888.1_EVX2_cut332_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0888.1_EVX2_cut332_hum_chp_bon_gor_org.snps.txt > MA0888.1_EVX2_cut332_hum_chp_bon_gor_org.snps.sort.txt
join MA0888.1_EVX2_cut332_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0888.1_EVX2_cut332_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0888.1_EVX2_cut332_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0888.1_EVX2_cut332_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0888.1_EVX2_cut332_hum_chp_bon_gor_org_rhe.snps.txt > MA0888.1_EVX2_cut332_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0888.1_EVX2_cut332_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1517.1_KLF6_cut-375
sort -k1,1 ../human_chimp/processed/MA1517.1_KLF6_cut-375_hum_chp.snps.txt > MA1517.1_KLF6_cut-375_hum_chp.snps.sort.txt
join MA1517.1_KLF6_cut-375_hum_chp.snps.sort.txt ../process_bon/processed/MA1517.1_KLF6_cut-375_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1517.1_KLF6_cut-375_hum_chp_bon.pre.snps.txt
python reformat.py MA1517.1_KLF6_cut-375_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1517.1_KLF6_cut-375_hum_chp_bon.snps.txt > MA1517.1_KLF6_cut-375_hum_chp_bon.snps.sort.txt
join MA1517.1_KLF6_cut-375_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1517.1_KLF6_cut-375_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1517.1_KLF6_cut-375_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1517.1_KLF6_cut-375_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1517.1_KLF6_cut-375_hum_chp_bon_gor.snps.txt > MA1517.1_KLF6_cut-375_hum_chp_bon_gor.snps.sort.txt
join MA1517.1_KLF6_cut-375_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1517.1_KLF6_cut-375_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org.snps.txt > MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org.snps.sort.txt
join MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1517.1_KLF6_cut-375_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org_rhe.snps.txt > MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1517.1_KLF6_cut-375_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0748.2_YY2_cut-9
sort -k1,1 ../human_chimp/processed/MA0748.2_YY2_cut-9_hum_chp.snps.txt > MA0748.2_YY2_cut-9_hum_chp.snps.sort.txt
join MA0748.2_YY2_cut-9_hum_chp.snps.sort.txt ../process_bon/processed/MA0748.2_YY2_cut-9_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0748.2_YY2_cut-9_hum_chp_bon.pre.snps.txt
python reformat.py MA0748.2_YY2_cut-9_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0748.2_YY2_cut-9_hum_chp_bon.snps.txt > MA0748.2_YY2_cut-9_hum_chp_bon.snps.sort.txt
join MA0748.2_YY2_cut-9_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0748.2_YY2_cut-9_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0748.2_YY2_cut-9_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0748.2_YY2_cut-9_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0748.2_YY2_cut-9_hum_chp_bon_gor.snps.txt > MA0748.2_YY2_cut-9_hum_chp_bon_gor.snps.sort.txt
join MA0748.2_YY2_cut-9_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0748.2_YY2_cut-9_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0748.2_YY2_cut-9_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0748.2_YY2_cut-9_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0748.2_YY2_cut-9_hum_chp_bon_gor_org.snps.txt > MA0748.2_YY2_cut-9_hum_chp_bon_gor_org.snps.sort.txt
join MA0748.2_YY2_cut-9_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0748.2_YY2_cut-9_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0748.2_YY2_cut-9_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0748.2_YY2_cut-9_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0748.2_YY2_cut-9_hum_chp_bon_gor_org_rhe.snps.txt > MA0748.2_YY2_cut-9_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0748.2_YY2_cut-9_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0805.1_TBX1_cut-526
sort -k1,1 ../human_chimp/processed/MA0805.1_TBX1_cut-526_hum_chp.snps.txt > MA0805.1_TBX1_cut-526_hum_chp.snps.sort.txt
join MA0805.1_TBX1_cut-526_hum_chp.snps.sort.txt ../process_bon/processed/MA0805.1_TBX1_cut-526_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0805.1_TBX1_cut-526_hum_chp_bon.pre.snps.txt
python reformat.py MA0805.1_TBX1_cut-526_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0805.1_TBX1_cut-526_hum_chp_bon.snps.txt > MA0805.1_TBX1_cut-526_hum_chp_bon.snps.sort.txt
join MA0805.1_TBX1_cut-526_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0805.1_TBX1_cut-526_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0805.1_TBX1_cut-526_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0805.1_TBX1_cut-526_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0805.1_TBX1_cut-526_hum_chp_bon_gor.snps.txt > MA0805.1_TBX1_cut-526_hum_chp_bon_gor.snps.sort.txt
join MA0805.1_TBX1_cut-526_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0805.1_TBX1_cut-526_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org.snps.txt > MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org.snps.sort.txt
join MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0805.1_TBX1_cut-526_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org_rhe.snps.txt > MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0805.1_TBX1_cut-526_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1615.1_Plagl1_cut-55
sort -k1,1 ../human_chimp/processed/MA1615.1_Plagl1_cut-55_hum_chp.snps.txt > MA1615.1_Plagl1_cut-55_hum_chp.snps.sort.txt
join MA1615.1_Plagl1_cut-55_hum_chp.snps.sort.txt ../process_bon/processed/MA1615.1_Plagl1_cut-55_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1615.1_Plagl1_cut-55_hum_chp_bon.pre.snps.txt
python reformat.py MA1615.1_Plagl1_cut-55_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1615.1_Plagl1_cut-55_hum_chp_bon.snps.txt > MA1615.1_Plagl1_cut-55_hum_chp_bon.snps.sort.txt
join MA1615.1_Plagl1_cut-55_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1615.1_Plagl1_cut-55_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1615.1_Plagl1_cut-55_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1615.1_Plagl1_cut-55_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1615.1_Plagl1_cut-55_hum_chp_bon_gor.snps.txt > MA1615.1_Plagl1_cut-55_hum_chp_bon_gor.snps.sort.txt
join MA1615.1_Plagl1_cut-55_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1615.1_Plagl1_cut-55_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org.snps.txt > MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org.snps.sort.txt
join MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1615.1_Plagl1_cut-55_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org_rhe.snps.txt > MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1615.1_Plagl1_cut-55_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1641.1_MYF5_cut-119
sort -k1,1 ../human_chimp/processed/MA1641.1_MYF5_cut-119_hum_chp.snps.txt > MA1641.1_MYF5_cut-119_hum_chp.snps.sort.txt
join MA1641.1_MYF5_cut-119_hum_chp.snps.sort.txt ../process_bon/processed/MA1641.1_MYF5_cut-119_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1641.1_MYF5_cut-119_hum_chp_bon.pre.snps.txt
python reformat.py MA1641.1_MYF5_cut-119_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1641.1_MYF5_cut-119_hum_chp_bon.snps.txt > MA1641.1_MYF5_cut-119_hum_chp_bon.snps.sort.txt
join MA1641.1_MYF5_cut-119_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1641.1_MYF5_cut-119_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1641.1_MYF5_cut-119_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1641.1_MYF5_cut-119_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1641.1_MYF5_cut-119_hum_chp_bon_gor.snps.txt > MA1641.1_MYF5_cut-119_hum_chp_bon_gor.snps.sort.txt
join MA1641.1_MYF5_cut-119_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1641.1_MYF5_cut-119_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org.snps.txt > MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org.snps.sort.txt
join MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1641.1_MYF5_cut-119_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org_rhe.snps.txt > MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1641.1_MYF5_cut-119_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1934.1_ERF::FIGLA_cut-1346
sort -k1,1 ../human_chimp/processed/MA1934.1_ERF::FIGLA_cut-1346_hum_chp.snps.txt > MA1934.1_ERF::FIGLA_cut-1346_hum_chp.snps.sort.txt
join MA1934.1_ERF::FIGLA_cut-1346_hum_chp.snps.sort.txt ../process_bon/processed/MA1934.1_ERF::FIGLA_cut-1346_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon.pre.snps.txt
python reformat.py MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon.snps.txt > MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon.snps.sort.txt
join MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1934.1_ERF::FIGLA_cut-1346_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor.snps.txt > MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor.snps.sort.txt
join MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1934.1_ERF::FIGLA_cut-1346_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org.snps.txt > MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org.snps.sort.txt
join MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1934.1_ERF::FIGLA_cut-1346_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org_rhe.snps.txt > MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1934.1_ERF::FIGLA_cut-1346_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0828.2_SREBF2_cut-2027
sort -k1,1 ../human_chimp/processed/MA0828.2_SREBF2_cut-2027_hum_chp.snps.txt > MA0828.2_SREBF2_cut-2027_hum_chp.snps.sort.txt
join MA0828.2_SREBF2_cut-2027_hum_chp.snps.sort.txt ../process_bon/processed/MA0828.2_SREBF2_cut-2027_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0828.2_SREBF2_cut-2027_hum_chp_bon.pre.snps.txt
python reformat.py MA0828.2_SREBF2_cut-2027_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0828.2_SREBF2_cut-2027_hum_chp_bon.snps.txt > MA0828.2_SREBF2_cut-2027_hum_chp_bon.snps.sort.txt
join MA0828.2_SREBF2_cut-2027_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0828.2_SREBF2_cut-2027_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor.snps.txt > MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor.snps.sort.txt
join MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0828.2_SREBF2_cut-2027_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org.snps.txt > MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org.snps.sort.txt
join MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0828.2_SREBF2_cut-2027_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org_rhe.snps.txt > MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0828.2_SREBF2_cut-2027_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0114.4_HNF4A_cut30
sort -k1,1 ../human_chimp/processed/MA0114.4_HNF4A_cut30_hum_chp.snps.txt > MA0114.4_HNF4A_cut30_hum_chp.snps.sort.txt
join MA0114.4_HNF4A_cut30_hum_chp.snps.sort.txt ../process_bon/processed/MA0114.4_HNF4A_cut30_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0114.4_HNF4A_cut30_hum_chp_bon.pre.snps.txt
python reformat.py MA0114.4_HNF4A_cut30_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0114.4_HNF4A_cut30_hum_chp_bon.snps.txt > MA0114.4_HNF4A_cut30_hum_chp_bon.snps.sort.txt
join MA0114.4_HNF4A_cut30_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0114.4_HNF4A_cut30_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0114.4_HNF4A_cut30_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0114.4_HNF4A_cut30_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0114.4_HNF4A_cut30_hum_chp_bon_gor.snps.txt > MA0114.4_HNF4A_cut30_hum_chp_bon_gor.snps.sort.txt
join MA0114.4_HNF4A_cut30_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0114.4_HNF4A_cut30_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org.snps.txt > MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org.snps.sort.txt
join MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0114.4_HNF4A_cut30_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org_rhe.snps.txt > MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0114.4_HNF4A_cut30_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0842.2_NRL_cut-1119
sort -k1,1 ../human_chimp/processed/MA0842.2_NRL_cut-1119_hum_chp.snps.txt > MA0842.2_NRL_cut-1119_hum_chp.snps.sort.txt
join MA0842.2_NRL_cut-1119_hum_chp.snps.sort.txt ../process_bon/processed/MA0842.2_NRL_cut-1119_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0842.2_NRL_cut-1119_hum_chp_bon.pre.snps.txt
python reformat.py MA0842.2_NRL_cut-1119_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0842.2_NRL_cut-1119_hum_chp_bon.snps.txt > MA0842.2_NRL_cut-1119_hum_chp_bon.snps.sort.txt
join MA0842.2_NRL_cut-1119_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0842.2_NRL_cut-1119_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0842.2_NRL_cut-1119_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0842.2_NRL_cut-1119_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0842.2_NRL_cut-1119_hum_chp_bon_gor.snps.txt > MA0842.2_NRL_cut-1119_hum_chp_bon_gor.snps.sort.txt
join MA0842.2_NRL_cut-1119_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0842.2_NRL_cut-1119_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org.snps.txt > MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org.snps.sort.txt
join MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0842.2_NRL_cut-1119_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org_rhe.snps.txt > MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0842.2_NRL_cut-1119_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1637.1_EBF3_cut-111
sort -k1,1 ../human_chimp/processed/MA1637.1_EBF3_cut-111_hum_chp.snps.txt > MA1637.1_EBF3_cut-111_hum_chp.snps.sort.txt
join MA1637.1_EBF3_cut-111_hum_chp.snps.sort.txt ../process_bon/processed/MA1637.1_EBF3_cut-111_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1637.1_EBF3_cut-111_hum_chp_bon.pre.snps.txt
python reformat.py MA1637.1_EBF3_cut-111_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1637.1_EBF3_cut-111_hum_chp_bon.snps.txt > MA1637.1_EBF3_cut-111_hum_chp_bon.snps.sort.txt
join MA1637.1_EBF3_cut-111_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1637.1_EBF3_cut-111_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1637.1_EBF3_cut-111_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1637.1_EBF3_cut-111_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1637.1_EBF3_cut-111_hum_chp_bon_gor.snps.txt > MA1637.1_EBF3_cut-111_hum_chp_bon_gor.snps.sort.txt
join MA1637.1_EBF3_cut-111_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1637.1_EBF3_cut-111_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org.snps.txt > MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org.snps.sort.txt
join MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1637.1_EBF3_cut-111_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org_rhe.snps.txt > MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1637.1_EBF3_cut-111_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1501.1_HOXB7_cut-201
sort -k1,1 ../human_chimp/processed/MA1501.1_HOXB7_cut-201_hum_chp.snps.txt > MA1501.1_HOXB7_cut-201_hum_chp.snps.sort.txt
join MA1501.1_HOXB7_cut-201_hum_chp.snps.sort.txt ../process_bon/processed/MA1501.1_HOXB7_cut-201_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1501.1_HOXB7_cut-201_hum_chp_bon.pre.snps.txt
python reformat.py MA1501.1_HOXB7_cut-201_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1501.1_HOXB7_cut-201_hum_chp_bon.snps.txt > MA1501.1_HOXB7_cut-201_hum_chp_bon.snps.sort.txt
join MA1501.1_HOXB7_cut-201_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1501.1_HOXB7_cut-201_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1501.1_HOXB7_cut-201_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1501.1_HOXB7_cut-201_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1501.1_HOXB7_cut-201_hum_chp_bon_gor.snps.txt > MA1501.1_HOXB7_cut-201_hum_chp_bon_gor.snps.sort.txt
join MA1501.1_HOXB7_cut-201_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1501.1_HOXB7_cut-201_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org.snps.txt > MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org.snps.sort.txt
join MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1501.1_HOXB7_cut-201_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org_rhe.snps.txt > MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1501.1_HOXB7_cut-201_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0465.2_CDX2_cut116
sort -k1,1 ../human_chimp/processed/MA0465.2_CDX2_cut116_hum_chp.snps.txt > MA0465.2_CDX2_cut116_hum_chp.snps.sort.txt
join MA0465.2_CDX2_cut116_hum_chp.snps.sort.txt ../process_bon/processed/MA0465.2_CDX2_cut116_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0465.2_CDX2_cut116_hum_chp_bon.pre.snps.txt
python reformat.py MA0465.2_CDX2_cut116_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0465.2_CDX2_cut116_hum_chp_bon.snps.txt > MA0465.2_CDX2_cut116_hum_chp_bon.snps.sort.txt
join MA0465.2_CDX2_cut116_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0465.2_CDX2_cut116_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0465.2_CDX2_cut116_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0465.2_CDX2_cut116_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0465.2_CDX2_cut116_hum_chp_bon_gor.snps.txt > MA0465.2_CDX2_cut116_hum_chp_bon_gor.snps.sort.txt
join MA0465.2_CDX2_cut116_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0465.2_CDX2_cut116_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0465.2_CDX2_cut116_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0465.2_CDX2_cut116_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0465.2_CDX2_cut116_hum_chp_bon_gor_org.snps.txt > MA0465.2_CDX2_cut116_hum_chp_bon_gor_org.snps.sort.txt
join MA0465.2_CDX2_cut116_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0465.2_CDX2_cut116_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0465.2_CDX2_cut116_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0465.2_CDX2_cut116_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0465.2_CDX2_cut116_hum_chp_bon_gor_org_rhe.snps.txt > MA0465.2_CDX2_cut116_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0465.2_CDX2_cut116_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0666.2_MSX1_cut-104
sort -k1,1 ../human_chimp/processed/MA0666.2_MSX1_cut-104_hum_chp.snps.txt > MA0666.2_MSX1_cut-104_hum_chp.snps.sort.txt
join MA0666.2_MSX1_cut-104_hum_chp.snps.sort.txt ../process_bon/processed/MA0666.2_MSX1_cut-104_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0666.2_MSX1_cut-104_hum_chp_bon.pre.snps.txt
python reformat.py MA0666.2_MSX1_cut-104_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0666.2_MSX1_cut-104_hum_chp_bon.snps.txt > MA0666.2_MSX1_cut-104_hum_chp_bon.snps.sort.txt
join MA0666.2_MSX1_cut-104_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0666.2_MSX1_cut-104_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0666.2_MSX1_cut-104_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0666.2_MSX1_cut-104_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0666.2_MSX1_cut-104_hum_chp_bon_gor.snps.txt > MA0666.2_MSX1_cut-104_hum_chp_bon_gor.snps.sort.txt
join MA0666.2_MSX1_cut-104_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0666.2_MSX1_cut-104_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org.snps.txt > MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org.snps.sort.txt
join MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0666.2_MSX1_cut-104_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org_rhe.snps.txt > MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0666.2_MSX1_cut-104_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0504.1_NR2C2_cut-1150
sort -k1,1 ../human_chimp/processed/MA0504.1_NR2C2_cut-1150_hum_chp.snps.txt > MA0504.1_NR2C2_cut-1150_hum_chp.snps.sort.txt
join MA0504.1_NR2C2_cut-1150_hum_chp.snps.sort.txt ../process_bon/processed/MA0504.1_NR2C2_cut-1150_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0504.1_NR2C2_cut-1150_hum_chp_bon.pre.snps.txt
python reformat.py MA0504.1_NR2C2_cut-1150_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0504.1_NR2C2_cut-1150_hum_chp_bon.snps.txt > MA0504.1_NR2C2_cut-1150_hum_chp_bon.snps.sort.txt
join MA0504.1_NR2C2_cut-1150_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0504.1_NR2C2_cut-1150_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor.snps.txt > MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor.snps.sort.txt
join MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0504.1_NR2C2_cut-1150_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org.snps.txt > MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org.snps.sort.txt
join MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0504.1_NR2C2_cut-1150_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org_rhe.snps.txt > MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0504.1_NR2C2_cut-1150_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0658.1_LHX6_cut-29
sort -k1,1 ../human_chimp/processed/MA0658.1_LHX6_cut-29_hum_chp.snps.txt > MA0658.1_LHX6_cut-29_hum_chp.snps.sort.txt
join MA0658.1_LHX6_cut-29_hum_chp.snps.sort.txt ../process_bon/processed/MA0658.1_LHX6_cut-29_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0658.1_LHX6_cut-29_hum_chp_bon.pre.snps.txt
python reformat.py MA0658.1_LHX6_cut-29_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0658.1_LHX6_cut-29_hum_chp_bon.snps.txt > MA0658.1_LHX6_cut-29_hum_chp_bon.snps.sort.txt
join MA0658.1_LHX6_cut-29_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0658.1_LHX6_cut-29_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0658.1_LHX6_cut-29_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0658.1_LHX6_cut-29_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0658.1_LHX6_cut-29_hum_chp_bon_gor.snps.txt > MA0658.1_LHX6_cut-29_hum_chp_bon_gor.snps.sort.txt
join MA0658.1_LHX6_cut-29_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0658.1_LHX6_cut-29_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org.snps.txt > MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org.snps.sort.txt
join MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0658.1_LHX6_cut-29_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org_rhe.snps.txt > MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0658.1_LHX6_cut-29_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0725.1_VSX1_cut331
sort -k1,1 ../human_chimp/processed/MA0725.1_VSX1_cut331_hum_chp.snps.txt > MA0725.1_VSX1_cut331_hum_chp.snps.sort.txt
join MA0725.1_VSX1_cut331_hum_chp.snps.sort.txt ../process_bon/processed/MA0725.1_VSX1_cut331_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0725.1_VSX1_cut331_hum_chp_bon.pre.snps.txt
python reformat.py MA0725.1_VSX1_cut331_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0725.1_VSX1_cut331_hum_chp_bon.snps.txt > MA0725.1_VSX1_cut331_hum_chp_bon.snps.sort.txt
join MA0725.1_VSX1_cut331_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0725.1_VSX1_cut331_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0725.1_VSX1_cut331_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0725.1_VSX1_cut331_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0725.1_VSX1_cut331_hum_chp_bon_gor.snps.txt > MA0725.1_VSX1_cut331_hum_chp_bon_gor.snps.sort.txt
join MA0725.1_VSX1_cut331_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0725.1_VSX1_cut331_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0725.1_VSX1_cut331_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0725.1_VSX1_cut331_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0725.1_VSX1_cut331_hum_chp_bon_gor_org.snps.txt > MA0725.1_VSX1_cut331_hum_chp_bon_gor_org.snps.sort.txt
join MA0725.1_VSX1_cut331_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0725.1_VSX1_cut331_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0725.1_VSX1_cut331_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0725.1_VSX1_cut331_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0725.1_VSX1_cut331_hum_chp_bon_gor_org_rhe.snps.txt > MA0725.1_VSX1_cut331_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0725.1_VSX1_cut331_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1585.1_ZKSCAN1_cut-650
sort -k1,1 ../human_chimp/processed/MA1585.1_ZKSCAN1_cut-650_hum_chp.snps.txt > MA1585.1_ZKSCAN1_cut-650_hum_chp.snps.sort.txt
join MA1585.1_ZKSCAN1_cut-650_hum_chp.snps.sort.txt ../process_bon/processed/MA1585.1_ZKSCAN1_cut-650_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1585.1_ZKSCAN1_cut-650_hum_chp_bon.pre.snps.txt
python reformat.py MA1585.1_ZKSCAN1_cut-650_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1585.1_ZKSCAN1_cut-650_hum_chp_bon.snps.txt > MA1585.1_ZKSCAN1_cut-650_hum_chp_bon.snps.sort.txt
join MA1585.1_ZKSCAN1_cut-650_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1585.1_ZKSCAN1_cut-650_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor.snps.txt > MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor.snps.sort.txt
join MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1585.1_ZKSCAN1_cut-650_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org.snps.txt > MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org.snps.sort.txt
join MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1585.1_ZKSCAN1_cut-650_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org_rhe.snps.txt > MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1585.1_ZKSCAN1_cut-650_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0486.2_HSF1_cut-1301
sort -k1,1 ../human_chimp/processed/MA0486.2_HSF1_cut-1301_hum_chp.snps.txt > MA0486.2_HSF1_cut-1301_hum_chp.snps.sort.txt
join MA0486.2_HSF1_cut-1301_hum_chp.snps.sort.txt ../process_bon/processed/MA0486.2_HSF1_cut-1301_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0486.2_HSF1_cut-1301_hum_chp_bon.pre.snps.txt
python reformat.py MA0486.2_HSF1_cut-1301_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0486.2_HSF1_cut-1301_hum_chp_bon.snps.txt > MA0486.2_HSF1_cut-1301_hum_chp_bon.snps.sort.txt
join MA0486.2_HSF1_cut-1301_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0486.2_HSF1_cut-1301_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0486.2_HSF1_cut-1301_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0486.2_HSF1_cut-1301_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0486.2_HSF1_cut-1301_hum_chp_bon_gor.snps.txt > MA0486.2_HSF1_cut-1301_hum_chp_bon_gor.snps.sort.txt
join MA0486.2_HSF1_cut-1301_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0486.2_HSF1_cut-1301_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org.snps.txt > MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org.snps.sort.txt
join MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0486.2_HSF1_cut-1301_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org_rhe.snps.txt > MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0486.2_HSF1_cut-1301_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0820.1_FIGLA_cut-85
sort -k1,1 ../human_chimp/processed/MA0820.1_FIGLA_cut-85_hum_chp.snps.txt > MA0820.1_FIGLA_cut-85_hum_chp.snps.sort.txt
join MA0820.1_FIGLA_cut-85_hum_chp.snps.sort.txt ../process_bon/processed/MA0820.1_FIGLA_cut-85_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0820.1_FIGLA_cut-85_hum_chp_bon.pre.snps.txt
python reformat.py MA0820.1_FIGLA_cut-85_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0820.1_FIGLA_cut-85_hum_chp_bon.snps.txt > MA0820.1_FIGLA_cut-85_hum_chp_bon.snps.sort.txt
join MA0820.1_FIGLA_cut-85_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0820.1_FIGLA_cut-85_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0820.1_FIGLA_cut-85_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0820.1_FIGLA_cut-85_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0820.1_FIGLA_cut-85_hum_chp_bon_gor.snps.txt > MA0820.1_FIGLA_cut-85_hum_chp_bon_gor.snps.sort.txt
join MA0820.1_FIGLA_cut-85_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0820.1_FIGLA_cut-85_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org.snps.txt > MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org.snps.sort.txt
join MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0820.1_FIGLA_cut-85_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org_rhe.snps.txt > MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0820.1_FIGLA_cut-85_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0604.1_Atf1_cut-546
sort -k1,1 ../human_chimp/processed/MA0604.1_Atf1_cut-546_hum_chp.snps.txt > MA0604.1_Atf1_cut-546_hum_chp.snps.sort.txt
join MA0604.1_Atf1_cut-546_hum_chp.snps.sort.txt ../process_bon/processed/MA0604.1_Atf1_cut-546_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0604.1_Atf1_cut-546_hum_chp_bon.pre.snps.txt
python reformat.py MA0604.1_Atf1_cut-546_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0604.1_Atf1_cut-546_hum_chp_bon.snps.txt > MA0604.1_Atf1_cut-546_hum_chp_bon.snps.sort.txt
join MA0604.1_Atf1_cut-546_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0604.1_Atf1_cut-546_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0604.1_Atf1_cut-546_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0604.1_Atf1_cut-546_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0604.1_Atf1_cut-546_hum_chp_bon_gor.snps.txt > MA0604.1_Atf1_cut-546_hum_chp_bon_gor.snps.sort.txt
join MA0604.1_Atf1_cut-546_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0604.1_Atf1_cut-546_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org.snps.txt > MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org.snps.sort.txt
join MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0604.1_Atf1_cut-546_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org_rhe.snps.txt > MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0604.1_Atf1_cut-546_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0144.2_STAT3_cut-9001
sort -k1,1 ../human_chimp/processed/MA0144.2_STAT3_cut-9001_hum_chp.snps.txt > MA0144.2_STAT3_cut-9001_hum_chp.snps.sort.txt
join MA0144.2_STAT3_cut-9001_hum_chp.snps.sort.txt ../process_bon/processed/MA0144.2_STAT3_cut-9001_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0144.2_STAT3_cut-9001_hum_chp_bon.pre.snps.txt
python reformat.py MA0144.2_STAT3_cut-9001_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0144.2_STAT3_cut-9001_hum_chp_bon.snps.txt > MA0144.2_STAT3_cut-9001_hum_chp_bon.snps.sort.txt
join MA0144.2_STAT3_cut-9001_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0144.2_STAT3_cut-9001_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0144.2_STAT3_cut-9001_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0144.2_STAT3_cut-9001_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0144.2_STAT3_cut-9001_hum_chp_bon_gor.snps.txt > MA0144.2_STAT3_cut-9001_hum_chp_bon_gor.snps.sort.txt
join MA0144.2_STAT3_cut-9001_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0144.2_STAT3_cut-9001_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org.snps.txt > MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org.snps.sort.txt
join MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0144.2_STAT3_cut-9001_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org_rhe.snps.txt > MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0144.2_STAT3_cut-9001_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1103.2_FOXK2_cut219
sort -k1,1 ../human_chimp/processed/MA1103.2_FOXK2_cut219_hum_chp.snps.txt > MA1103.2_FOXK2_cut219_hum_chp.snps.sort.txt
join MA1103.2_FOXK2_cut219_hum_chp.snps.sort.txt ../process_bon/processed/MA1103.2_FOXK2_cut219_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1103.2_FOXK2_cut219_hum_chp_bon.pre.snps.txt
python reformat.py MA1103.2_FOXK2_cut219_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1103.2_FOXK2_cut219_hum_chp_bon.snps.txt > MA1103.2_FOXK2_cut219_hum_chp_bon.snps.sort.txt
join MA1103.2_FOXK2_cut219_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1103.2_FOXK2_cut219_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1103.2_FOXK2_cut219_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1103.2_FOXK2_cut219_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1103.2_FOXK2_cut219_hum_chp_bon_gor.snps.txt > MA1103.2_FOXK2_cut219_hum_chp_bon_gor.snps.sort.txt
join MA1103.2_FOXK2_cut219_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1103.2_FOXK2_cut219_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org.snps.txt > MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org.snps.sort.txt
join MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1103.2_FOXK2_cut219_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org_rhe.snps.txt > MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1103.2_FOXK2_cut219_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1141.1_FOS::JUND_cut-9239
sort -k1,1 ../human_chimp/processed/MA1141.1_FOS::JUND_cut-9239_hum_chp.snps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp.snps.sort.txt
join MA1141.1_FOS::JUND_cut-9239_hum_chp.snps.sort.txt ../process_bon/processed/MA1141.1_FOS::JUND_cut-9239_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1141.1_FOS::JUND_cut-9239_hum_chp_bon.pre.snps.txt
python reformat.py MA1141.1_FOS::JUND_cut-9239_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1141.1_FOS::JUND_cut-9239_hum_chp_bon.snps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp_bon.snps.sort.txt
join MA1141.1_FOS::JUND_cut-9239_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1141.1_FOS::JUND_cut-9239_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor.snps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor.snps.sort.txt
join MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1141.1_FOS::JUND_cut-9239_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org.snps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org.snps.sort.txt
join MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1141.1_FOS::JUND_cut-9239_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org_rhe.snps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1141.1_FOS::JUND_cut-9239_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0785.1_POU2F1_cut65
sort -k1,1 ../human_chimp/processed/MA0785.1_POU2F1_cut65_hum_chp.snps.txt > MA0785.1_POU2F1_cut65_hum_chp.snps.sort.txt
join MA0785.1_POU2F1_cut65_hum_chp.snps.sort.txt ../process_bon/processed/MA0785.1_POU2F1_cut65_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0785.1_POU2F1_cut65_hum_chp_bon.pre.snps.txt
python reformat.py MA0785.1_POU2F1_cut65_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0785.1_POU2F1_cut65_hum_chp_bon.snps.txt > MA0785.1_POU2F1_cut65_hum_chp_bon.snps.sort.txt
join MA0785.1_POU2F1_cut65_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0785.1_POU2F1_cut65_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0785.1_POU2F1_cut65_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0785.1_POU2F1_cut65_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0785.1_POU2F1_cut65_hum_chp_bon_gor.snps.txt > MA0785.1_POU2F1_cut65_hum_chp_bon_gor.snps.sort.txt
join MA0785.1_POU2F1_cut65_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0785.1_POU2F1_cut65_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org.snps.txt > MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org.snps.sort.txt
join MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0785.1_POU2F1_cut65_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org_rhe.snps.txt > MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0785.1_POU2F1_cut65_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1636.1_CEBPG_cut-111
sort -k1,1 ../human_chimp/processed/MA1636.1_CEBPG_cut-111_hum_chp.snps.txt > MA1636.1_CEBPG_cut-111_hum_chp.snps.sort.txt
join MA1636.1_CEBPG_cut-111_hum_chp.snps.sort.txt ../process_bon/processed/MA1636.1_CEBPG_cut-111_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1636.1_CEBPG_cut-111_hum_chp_bon.pre.snps.txt
python reformat.py MA1636.1_CEBPG_cut-111_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1636.1_CEBPG_cut-111_hum_chp_bon.snps.txt > MA1636.1_CEBPG_cut-111_hum_chp_bon.snps.sort.txt
join MA1636.1_CEBPG_cut-111_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1636.1_CEBPG_cut-111_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1636.1_CEBPG_cut-111_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1636.1_CEBPG_cut-111_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1636.1_CEBPG_cut-111_hum_chp_bon_gor.snps.txt > MA1636.1_CEBPG_cut-111_hum_chp_bon_gor.snps.sort.txt
join MA1636.1_CEBPG_cut-111_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1636.1_CEBPG_cut-111_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org.snps.txt > MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org.snps.sort.txt
join MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1636.1_CEBPG_cut-111_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org_rhe.snps.txt > MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1636.1_CEBPG_cut-111_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0650.3_Hoxa13_cut127
sort -k1,1 ../human_chimp/processed/MA0650.3_Hoxa13_cut127_hum_chp.snps.txt > MA0650.3_Hoxa13_cut127_hum_chp.snps.sort.txt
join MA0650.3_Hoxa13_cut127_hum_chp.snps.sort.txt ../process_bon/processed/MA0650.3_Hoxa13_cut127_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0650.3_Hoxa13_cut127_hum_chp_bon.pre.snps.txt
python reformat.py MA0650.3_Hoxa13_cut127_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0650.3_Hoxa13_cut127_hum_chp_bon.snps.txt > MA0650.3_Hoxa13_cut127_hum_chp_bon.snps.sort.txt
join MA0650.3_Hoxa13_cut127_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0650.3_Hoxa13_cut127_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0650.3_Hoxa13_cut127_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0650.3_Hoxa13_cut127_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0650.3_Hoxa13_cut127_hum_chp_bon_gor.snps.txt > MA0650.3_Hoxa13_cut127_hum_chp_bon_gor.snps.sort.txt
join MA0650.3_Hoxa13_cut127_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0650.3_Hoxa13_cut127_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org.snps.txt > MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org.snps.sort.txt
join MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0650.3_Hoxa13_cut127_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org_rhe.snps.txt > MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0650.3_Hoxa13_cut127_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0741.1_KLF16_cut-466
sort -k1,1 ../human_chimp/processed/MA0741.1_KLF16_cut-466_hum_chp.snps.txt > MA0741.1_KLF16_cut-466_hum_chp.snps.sort.txt
join MA0741.1_KLF16_cut-466_hum_chp.snps.sort.txt ../process_bon/processed/MA0741.1_KLF16_cut-466_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0741.1_KLF16_cut-466_hum_chp_bon.pre.snps.txt
python reformat.py MA0741.1_KLF16_cut-466_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0741.1_KLF16_cut-466_hum_chp_bon.snps.txt > MA0741.1_KLF16_cut-466_hum_chp_bon.snps.sort.txt
join MA0741.1_KLF16_cut-466_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0741.1_KLF16_cut-466_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0741.1_KLF16_cut-466_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0741.1_KLF16_cut-466_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0741.1_KLF16_cut-466_hum_chp_bon_gor.snps.txt > MA0741.1_KLF16_cut-466_hum_chp_bon_gor.snps.sort.txt
join MA0741.1_KLF16_cut-466_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0741.1_KLF16_cut-466_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org.snps.txt > MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org.snps.sort.txt
join MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0741.1_KLF16_cut-466_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org_rhe.snps.txt > MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0741.1_KLF16_cut-466_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0852.2_FOXK1_cut65
sort -k1,1 ../human_chimp/processed/MA0852.2_FOXK1_cut65_hum_chp.snps.txt > MA0852.2_FOXK1_cut65_hum_chp.snps.sort.txt
join MA0852.2_FOXK1_cut65_hum_chp.snps.sort.txt ../process_bon/processed/MA0852.2_FOXK1_cut65_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0852.2_FOXK1_cut65_hum_chp_bon.pre.snps.txt
python reformat.py MA0852.2_FOXK1_cut65_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0852.2_FOXK1_cut65_hum_chp_bon.snps.txt > MA0852.2_FOXK1_cut65_hum_chp_bon.snps.sort.txt
join MA0852.2_FOXK1_cut65_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0852.2_FOXK1_cut65_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0852.2_FOXK1_cut65_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0852.2_FOXK1_cut65_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0852.2_FOXK1_cut65_hum_chp_bon_gor.snps.txt > MA0852.2_FOXK1_cut65_hum_chp_bon_gor.snps.sort.txt
join MA0852.2_FOXK1_cut65_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0852.2_FOXK1_cut65_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org.snps.txt > MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org.snps.sort.txt
join MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0852.2_FOXK1_cut65_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org_rhe.snps.txt > MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0852.2_FOXK1_cut65_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1973.1_ZKSCAN3_cut-684
sort -k1,1 ../human_chimp/processed/MA1973.1_ZKSCAN3_cut-684_hum_chp.snps.txt > MA1973.1_ZKSCAN3_cut-684_hum_chp.snps.sort.txt
join MA1973.1_ZKSCAN3_cut-684_hum_chp.snps.sort.txt ../process_bon/processed/MA1973.1_ZKSCAN3_cut-684_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1973.1_ZKSCAN3_cut-684_hum_chp_bon.pre.snps.txt
python reformat.py MA1973.1_ZKSCAN3_cut-684_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1973.1_ZKSCAN3_cut-684_hum_chp_bon.snps.txt > MA1973.1_ZKSCAN3_cut-684_hum_chp_bon.snps.sort.txt
join MA1973.1_ZKSCAN3_cut-684_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1973.1_ZKSCAN3_cut-684_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor.snps.txt > MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor.snps.sort.txt
join MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1973.1_ZKSCAN3_cut-684_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org.snps.txt > MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org.snps.sort.txt
join MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1973.1_ZKSCAN3_cut-684_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org_rhe.snps.txt > MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1973.1_ZKSCAN3_cut-684_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0802.1_TBR1_cut-173
sort -k1,1 ../human_chimp/processed/MA0802.1_TBR1_cut-173_hum_chp.snps.txt > MA0802.1_TBR1_cut-173_hum_chp.snps.sort.txt
join MA0802.1_TBR1_cut-173_hum_chp.snps.sort.txt ../process_bon/processed/MA0802.1_TBR1_cut-173_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0802.1_TBR1_cut-173_hum_chp_bon.pre.snps.txt
python reformat.py MA0802.1_TBR1_cut-173_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0802.1_TBR1_cut-173_hum_chp_bon.snps.txt > MA0802.1_TBR1_cut-173_hum_chp_bon.snps.sort.txt
join MA0802.1_TBR1_cut-173_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0802.1_TBR1_cut-173_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0802.1_TBR1_cut-173_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0802.1_TBR1_cut-173_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0802.1_TBR1_cut-173_hum_chp_bon_gor.snps.txt > MA0802.1_TBR1_cut-173_hum_chp_bon_gor.snps.sort.txt
join MA0802.1_TBR1_cut-173_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0802.1_TBR1_cut-173_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org.snps.txt > MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org.snps.sort.txt
join MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0802.1_TBR1_cut-173_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org_rhe.snps.txt > MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0802.1_TBR1_cut-173_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0092.1_Hand1::Tcf3_cut-245
sort -k1,1 ../human_chimp/processed/MA0092.1_Hand1::Tcf3_cut-245_hum_chp.snps.txt > MA0092.1_Hand1::Tcf3_cut-245_hum_chp.snps.sort.txt
join MA0092.1_Hand1::Tcf3_cut-245_hum_chp.snps.sort.txt ../process_bon/processed/MA0092.1_Hand1::Tcf3_cut-245_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon.pre.snps.txt
python reformat.py MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon.snps.txt > MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon.snps.sort.txt
join MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0092.1_Hand1::Tcf3_cut-245_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor.snps.txt > MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor.snps.sort.txt
join MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0092.1_Hand1::Tcf3_cut-245_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org.snps.txt > MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org.snps.sort.txt
join MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0092.1_Hand1::Tcf3_cut-245_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org_rhe.snps.txt > MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0092.1_Hand1::Tcf3_cut-245_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0033.2_FOXL1_cut-39
sort -k1,1 ../human_chimp/processed/MA0033.2_FOXL1_cut-39_hum_chp.snps.txt > MA0033.2_FOXL1_cut-39_hum_chp.snps.sort.txt
join MA0033.2_FOXL1_cut-39_hum_chp.snps.sort.txt ../process_bon/processed/MA0033.2_FOXL1_cut-39_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0033.2_FOXL1_cut-39_hum_chp_bon.pre.snps.txt
python reformat.py MA0033.2_FOXL1_cut-39_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0033.2_FOXL1_cut-39_hum_chp_bon.snps.txt > MA0033.2_FOXL1_cut-39_hum_chp_bon.snps.sort.txt
join MA0033.2_FOXL1_cut-39_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0033.2_FOXL1_cut-39_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0033.2_FOXL1_cut-39_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0033.2_FOXL1_cut-39_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0033.2_FOXL1_cut-39_hum_chp_bon_gor.snps.txt > MA0033.2_FOXL1_cut-39_hum_chp_bon_gor.snps.sort.txt
join MA0033.2_FOXL1_cut-39_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0033.2_FOXL1_cut-39_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org.snps.txt > MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org.snps.sort.txt
join MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0033.2_FOXL1_cut-39_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org_rhe.snps.txt > MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0033.2_FOXL1_cut-39_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA1520.1_MAF_cut14
sort -k1,1 ../human_chimp/processed/MA1520.1_MAF_cut14_hum_chp.snps.txt > MA1520.1_MAF_cut14_hum_chp.snps.sort.txt
join MA1520.1_MAF_cut14_hum_chp.snps.sort.txt ../process_bon/processed/MA1520.1_MAF_cut14_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA1520.1_MAF_cut14_hum_chp_bon.pre.snps.txt
python reformat.py MA1520.1_MAF_cut14_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA1520.1_MAF_cut14_hum_chp_bon.snps.txt > MA1520.1_MAF_cut14_hum_chp_bon.snps.sort.txt
join MA1520.1_MAF_cut14_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA1520.1_MAF_cut14_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA1520.1_MAF_cut14_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA1520.1_MAF_cut14_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA1520.1_MAF_cut14_hum_chp_bon_gor.snps.txt > MA1520.1_MAF_cut14_hum_chp_bon_gor.snps.sort.txt
join MA1520.1_MAF_cut14_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA1520.1_MAF_cut14_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA1520.1_MAF_cut14_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA1520.1_MAF_cut14_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA1520.1_MAF_cut14_hum_chp_bon_gor_org.snps.txt > MA1520.1_MAF_cut14_hum_chp_bon_gor_org.snps.sort.txt
join MA1520.1_MAF_cut14_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA1520.1_MAF_cut14_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA1520.1_MAF_cut14_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA1520.1_MAF_cut14_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA1520.1_MAF_cut14_hum_chp_bon_gor_org_rhe.snps.txt > MA1520.1_MAF_cut14_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA1520.1_MAF_cut14_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0797.1_TGIF2_cut-770
sort -k1,1 ../human_chimp/processed/MA0797.1_TGIF2_cut-770_hum_chp.snps.txt > MA0797.1_TGIF2_cut-770_hum_chp.snps.sort.txt
join MA0797.1_TGIF2_cut-770_hum_chp.snps.sort.txt ../process_bon/processed/MA0797.1_TGIF2_cut-770_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0797.1_TGIF2_cut-770_hum_chp_bon.pre.snps.txt
python reformat.py MA0797.1_TGIF2_cut-770_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0797.1_TGIF2_cut-770_hum_chp_bon.snps.txt > MA0797.1_TGIF2_cut-770_hum_chp_bon.snps.sort.txt
join MA0797.1_TGIF2_cut-770_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0797.1_TGIF2_cut-770_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0797.1_TGIF2_cut-770_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0797.1_TGIF2_cut-770_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0797.1_TGIF2_cut-770_hum_chp_bon_gor.snps.txt > MA0797.1_TGIF2_cut-770_hum_chp_bon_gor.snps.sort.txt
join MA0797.1_TGIF2_cut-770_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0797.1_TGIF2_cut-770_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org.snps.txt > MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org.snps.sort.txt
join MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0797.1_TGIF2_cut-770_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org_rhe.snps.txt > MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0797.1_TGIF2_cut-770_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA0607.2_BHLHA15_cut-640
sort -k1,1 ../human_chimp/processed/MA0607.2_BHLHA15_cut-640_hum_chp.snps.txt > MA0607.2_BHLHA15_cut-640_hum_chp.snps.sort.txt
join MA0607.2_BHLHA15_cut-640_hum_chp.snps.sort.txt ../process_bon/processed/MA0607.2_BHLHA15_cut-640_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA0607.2_BHLHA15_cut-640_hum_chp_bon.pre.snps.txt
python reformat.py MA0607.2_BHLHA15_cut-640_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA0607.2_BHLHA15_cut-640_hum_chp_bon.snps.txt > MA0607.2_BHLHA15_cut-640_hum_chp_bon.snps.sort.txt
join MA0607.2_BHLHA15_cut-640_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA0607.2_BHLHA15_cut-640_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor.snps.txt > MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor.snps.sort.txt
join MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA0607.2_BHLHA15_cut-640_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org.snps.txt > MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org.snps.sort.txt
join MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA0607.2_BHLHA15_cut-640_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org_rhe.snps.txt > MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA0607.2_BHLHA15_cut-640_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
#MA2001.1_Six4_cut196
sort -k1,1 ../human_chimp/processed/MA2001.1_Six4_cut196_hum_chp.snps.txt > MA2001.1_Six4_cut196_hum_chp.snps.sort.txt
join MA2001.1_Six4_cut196_hum_chp.snps.sort.txt ../process_bon/processed/MA2001.1_Six4_cut196_bonobo_ms.snps.join.actual.bed -a1 -a2 >  MA2001.1_Six4_cut196_hum_chp_bon.pre.snps.txt
python reformat.py MA2001.1_Six4_cut196_hum_chp_bon.pre.snps.txt 4 PanPan3

sort -k1,1 MA2001.1_Six4_cut196_hum_chp_bon.snps.txt > MA2001.1_Six4_cut196_hum_chp_bon.snps.sort.txt
join MA2001.1_Six4_cut196_hum_chp_bon.snps.sort.txt ../process_gor/processed/MA2001.1_Six4_cut196_gorilla_ms.snps.join.actual.bed -a1 -a2 >  MA2001.1_Six4_cut196_hum_chp_bon_gor.pre.snps.txt
python reformat.py MA2001.1_Six4_cut196_hum_chp_bon_gor.pre.snps.txt 5 GorGor6

sort -k1,1 MA2001.1_Six4_cut196_hum_chp_bon_gor.snps.txt > MA2001.1_Six4_cut196_hum_chp_bon_gor.snps.sort.txt
join MA2001.1_Six4_cut196_hum_chp_bon_gor.snps.sort.txt ../process_org/processed/MA2001.1_Six4_cut196_orangutan_ms.snps.join.actual.bed -a1 -a2 >  MA2001.1_Six4_cut196_hum_chp_bon_gor_org.pre.snps.txt
python reformat.py MA2001.1_Six4_cut196_hum_chp_bon_gor_org.pre.snps.txt 6 PonAbe3

sort -k1,1 MA2001.1_Six4_cut196_hum_chp_bon_gor_org.snps.txt > MA2001.1_Six4_cut196_hum_chp_bon_gor_org.snps.sort.txt
join MA2001.1_Six4_cut196_hum_chp_bon_gor_org.snps.sort.txt ../process_rhe/processed/MA2001.1_Six4_cut196_rhesus_ms.snps.join.actual.bed -a1 -a2 >  MA2001.1_Six4_cut196_hum_chp_bon_gor_org_rhe.pre.snps.txt
python reformat.py MA2001.1_Six4_cut196_hum_chp_bon_gor_org_rhe.pre.snps.txt 7 RheMac10

sort -k1,1 MA2001.1_Six4_cut196_hum_chp_bon_gor_org_rhe.snps.txt > MA2001.1_Six4_cut196_hum_chp_bon_gor_org_rhe.snps.sort.txt
mv MA2001.1_Six4_cut196_hum_chp_bon_gor_org_rhe.snps.sort.txt all_done
