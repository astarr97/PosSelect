#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cores 1
#SBATCH --mem-per-cpu 16GB

#MA0111.1_Spz1_cut-9356
#sort -k1,1 ../human_chimp/processed_poly/MA0111.1_Spz1_cut-9356_hum_chp.polysnps.txt > MA0111.1_Spz1_cut-9356_hum_chp.polysnps.sort.txt
#join MA0111.1_Spz1_cut-9356_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0111.1_Spz1_cut-9356_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0111.1_Spz1_cut-9356_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0111.1_Spz1_cut-9356_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0111.1_Spz1_cut-9356_hum_chp.polysnps.txt > MA0111.1_Spz1_cut-9356_hum_chp.polysnps.sort.txt
#join MA0111.1_Spz1_cut-9356_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0111.1_Spz1_cut-9356_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0111.1_Spz1_cut-9356_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0111.1_Spz1_cut-9356_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0111.1_Spz1_cut-9356_hum_chp_gor.polysnps.txt > MA0111.1_Spz1_cut-9356_hum_chp_gor.polysnps.sort.txt
#join MA0111.1_Spz1_cut-9356_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0111.1_Spz1_cut-9356_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0111.1_Spz1_cut-9356_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0111.1_Spz1_cut-9356_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0111.1_Spz1_cut-9356_hum_chp_gor_org.polysnps.txt > MA0111.1_Spz1_cut-9356_hum_chp_gor_org.polysnps.sort.txt
#join MA0111.1_Spz1_cut-9356_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0111.1_Spz1_cut-9356_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0111.1_Spz1_cut-9356_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0111.1_Spz1_cut-9356_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0111.1_Spz1_cut-9356_hum_chp_gor_org_rhe.polysnps.txt > MA0111.1_Spz1_cut-9356_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0111.1_Spz1_cut-9356_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0037.4_Gata3_cut182
#sort -k1,1 ../human_chimp/processed_poly/MA0037.4_Gata3_cut182_hum_chp.polysnps.txt > MA0037.4_Gata3_cut182_hum_chp.polysnps.sort.txt
#join MA0037.4_Gata3_cut182_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0037.4_Gata3_cut182_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0037.4_Gata3_cut182_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0037.4_Gata3_cut182_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0037.4_Gata3_cut182_hum_chp.polysnps.txt > MA0037.4_Gata3_cut182_hum_chp.polysnps.sort.txt
#join MA0037.4_Gata3_cut182_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0037.4_Gata3_cut182_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0037.4_Gata3_cut182_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0037.4_Gata3_cut182_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0037.4_Gata3_cut182_hum_chp_gor.polysnps.txt > MA0037.4_Gata3_cut182_hum_chp_gor.polysnps.sort.txt
#join MA0037.4_Gata3_cut182_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0037.4_Gata3_cut182_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0037.4_Gata3_cut182_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0037.4_Gata3_cut182_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0037.4_Gata3_cut182_hum_chp_gor_org.polysnps.txt > MA0037.4_Gata3_cut182_hum_chp_gor_org.polysnps.sort.txt
#join MA0037.4_Gata3_cut182_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0037.4_Gata3_cut182_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0037.4_Gata3_cut182_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0037.4_Gata3_cut182_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0037.4_Gata3_cut182_hum_chp_gor_org_rhe.polysnps.txt > MA0037.4_Gata3_cut182_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0037.4_Gata3_cut182_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1496.1_HOXA4_cut317
#sort -k1,1 ../human_chimp/processed_poly/MA1496.1_HOXA4_cut317_hum_chp.polysnps.txt > MA1496.1_HOXA4_cut317_hum_chp.polysnps.sort.txt
#join MA1496.1_HOXA4_cut317_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1496.1_HOXA4_cut317_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1496.1_HOXA4_cut317_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1496.1_HOXA4_cut317_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1496.1_HOXA4_cut317_hum_chp.polysnps.txt > MA1496.1_HOXA4_cut317_hum_chp.polysnps.sort.txt
#join MA1496.1_HOXA4_cut317_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1496.1_HOXA4_cut317_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1496.1_HOXA4_cut317_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1496.1_HOXA4_cut317_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1496.1_HOXA4_cut317_hum_chp_gor.polysnps.txt > MA1496.1_HOXA4_cut317_hum_chp_gor.polysnps.sort.txt
#join MA1496.1_HOXA4_cut317_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1496.1_HOXA4_cut317_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1496.1_HOXA4_cut317_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1496.1_HOXA4_cut317_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1496.1_HOXA4_cut317_hum_chp_gor_org.polysnps.txt > MA1496.1_HOXA4_cut317_hum_chp_gor_org.polysnps.sort.txt
#join MA1496.1_HOXA4_cut317_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1496.1_HOXA4_cut317_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1496.1_HOXA4_cut317_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1496.1_HOXA4_cut317_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1496.1_HOXA4_cut317_hum_chp_gor_org_rhe.polysnps.txt > MA1496.1_HOXA4_cut317_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1496.1_HOXA4_cut317_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0628.1_POU6F1_cut212
#sort -k1,1 ../human_chimp/processed_poly/MA0628.1_POU6F1_cut212_hum_chp.polysnps.txt > MA0628.1_POU6F1_cut212_hum_chp.polysnps.sort.txt
#join MA0628.1_POU6F1_cut212_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0628.1_POU6F1_cut212_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0628.1_POU6F1_cut212_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0628.1_POU6F1_cut212_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0628.1_POU6F1_cut212_hum_chp.polysnps.txt > MA0628.1_POU6F1_cut212_hum_chp.polysnps.sort.txt
#join MA0628.1_POU6F1_cut212_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0628.1_POU6F1_cut212_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0628.1_POU6F1_cut212_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0628.1_POU6F1_cut212_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0628.1_POU6F1_cut212_hum_chp_gor.polysnps.txt > MA0628.1_POU6F1_cut212_hum_chp_gor.polysnps.sort.txt
#join MA0628.1_POU6F1_cut212_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0628.1_POU6F1_cut212_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0628.1_POU6F1_cut212_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0628.1_POU6F1_cut212_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0628.1_POU6F1_cut212_hum_chp_gor_org.polysnps.txt > MA0628.1_POU6F1_cut212_hum_chp_gor_org.polysnps.sort.txt
#join MA0628.1_POU6F1_cut212_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0628.1_POU6F1_cut212_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0628.1_POU6F1_cut212_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0628.1_POU6F1_cut212_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0628.1_POU6F1_cut212_hum_chp_gor_org_rhe.polysnps.txt > MA0628.1_POU6F1_cut212_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0628.1_POU6F1_cut212_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0856.1_RXRG_cut-2402
#sort -k1,1 ../human_chimp/processed_poly/MA0856.1_RXRG_cut-2402_hum_chp.polysnps.txt > MA0856.1_RXRG_cut-2402_hum_chp.polysnps.sort.txt
#join MA0856.1_RXRG_cut-2402_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0856.1_RXRG_cut-2402_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0856.1_RXRG_cut-2402_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0856.1_RXRG_cut-2402_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0856.1_RXRG_cut-2402_hum_chp.polysnps.txt > MA0856.1_RXRG_cut-2402_hum_chp.polysnps.sort.txt
#join MA0856.1_RXRG_cut-2402_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0856.1_RXRG_cut-2402_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0856.1_RXRG_cut-2402_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0856.1_RXRG_cut-2402_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0856.1_RXRG_cut-2402_hum_chp_gor.polysnps.txt > MA0856.1_RXRG_cut-2402_hum_chp_gor.polysnps.sort.txt
#join MA0856.1_RXRG_cut-2402_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0856.1_RXRG_cut-2402_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0856.1_RXRG_cut-2402_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0856.1_RXRG_cut-2402_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0856.1_RXRG_cut-2402_hum_chp_gor_org.polysnps.txt > MA0856.1_RXRG_cut-2402_hum_chp_gor_org.polysnps.sort.txt
#join MA0856.1_RXRG_cut-2402_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0856.1_RXRG_cut-2402_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0856.1_RXRG_cut-2402_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0856.1_RXRG_cut-2402_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0856.1_RXRG_cut-2402_hum_chp_gor_org_rhe.polysnps.txt > MA0856.1_RXRG_cut-2402_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0856.1_RXRG_cut-2402_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0680.2_Pax7_cut56
#sort -k1,1 ../human_chimp/processed_poly/MA0680.2_Pax7_cut56_hum_chp.polysnps.txt > MA0680.2_Pax7_cut56_hum_chp.polysnps.sort.txt
#join MA0680.2_Pax7_cut56_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0680.2_Pax7_cut56_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0680.2_Pax7_cut56_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0680.2_Pax7_cut56_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0680.2_Pax7_cut56_hum_chp.polysnps.txt > MA0680.2_Pax7_cut56_hum_chp.polysnps.sort.txt
#join MA0680.2_Pax7_cut56_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0680.2_Pax7_cut56_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0680.2_Pax7_cut56_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0680.2_Pax7_cut56_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0680.2_Pax7_cut56_hum_chp_gor.polysnps.txt > MA0680.2_Pax7_cut56_hum_chp_gor.polysnps.sort.txt
#join MA0680.2_Pax7_cut56_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0680.2_Pax7_cut56_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0680.2_Pax7_cut56_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0680.2_Pax7_cut56_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0680.2_Pax7_cut56_hum_chp_gor_org.polysnps.txt > MA0680.2_Pax7_cut56_hum_chp_gor_org.polysnps.sort.txt
#join MA0680.2_Pax7_cut56_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0680.2_Pax7_cut56_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0680.2_Pax7_cut56_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0680.2_Pax7_cut56_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0680.2_Pax7_cut56_hum_chp_gor_org_rhe.polysnps.txt > MA0680.2_Pax7_cut56_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0680.2_Pax7_cut56_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1123.2_TWIST1_cut18
#sort -k1,1 ../human_chimp/processed_poly/MA1123.2_TWIST1_cut18_hum_chp.polysnps.txt > MA1123.2_TWIST1_cut18_hum_chp.polysnps.sort.txt
#join MA1123.2_TWIST1_cut18_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1123.2_TWIST1_cut18_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1123.2_TWIST1_cut18_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1123.2_TWIST1_cut18_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1123.2_TWIST1_cut18_hum_chp.polysnps.txt > MA1123.2_TWIST1_cut18_hum_chp.polysnps.sort.txt
#join MA1123.2_TWIST1_cut18_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1123.2_TWIST1_cut18_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1123.2_TWIST1_cut18_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1123.2_TWIST1_cut18_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1123.2_TWIST1_cut18_hum_chp_gor.polysnps.txt > MA1123.2_TWIST1_cut18_hum_chp_gor.polysnps.sort.txt
#join MA1123.2_TWIST1_cut18_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1123.2_TWIST1_cut18_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1123.2_TWIST1_cut18_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1123.2_TWIST1_cut18_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1123.2_TWIST1_cut18_hum_chp_gor_org.polysnps.txt > MA1123.2_TWIST1_cut18_hum_chp_gor_org.polysnps.sort.txt
#join MA1123.2_TWIST1_cut18_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1123.2_TWIST1_cut18_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1123.2_TWIST1_cut18_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1123.2_TWIST1_cut18_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1123.2_TWIST1_cut18_hum_chp_gor_org_rhe.polysnps.txt > MA1123.2_TWIST1_cut18_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1123.2_TWIST1_cut18_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1538.1_NR2F1_cut-959
#sort -k1,1 ../human_chimp/processed_poly/MA1538.1_NR2F1_cut-959_hum_chp.polysnps.txt > MA1538.1_NR2F1_cut-959_hum_chp.polysnps.sort.txt
#join MA1538.1_NR2F1_cut-959_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1538.1_NR2F1_cut-959_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1538.1_NR2F1_cut-959_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1538.1_NR2F1_cut-959_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1538.1_NR2F1_cut-959_hum_chp.polysnps.txt > MA1538.1_NR2F1_cut-959_hum_chp.polysnps.sort.txt
#join MA1538.1_NR2F1_cut-959_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1538.1_NR2F1_cut-959_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1538.1_NR2F1_cut-959_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1538.1_NR2F1_cut-959_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1538.1_NR2F1_cut-959_hum_chp_gor.polysnps.txt > MA1538.1_NR2F1_cut-959_hum_chp_gor.polysnps.sort.txt
#join MA1538.1_NR2F1_cut-959_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1538.1_NR2F1_cut-959_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1538.1_NR2F1_cut-959_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1538.1_NR2F1_cut-959_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1538.1_NR2F1_cut-959_hum_chp_gor_org.polysnps.txt > MA1538.1_NR2F1_cut-959_hum_chp_gor_org.polysnps.sort.txt
#join MA1538.1_NR2F1_cut-959_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1538.1_NR2F1_cut-959_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1538.1_NR2F1_cut-959_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1538.1_NR2F1_cut-959_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1538.1_NR2F1_cut-959_hum_chp_gor_org_rhe.polysnps.txt > MA1538.1_NR2F1_cut-959_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1538.1_NR2F1_cut-959_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0810.1_TFAP2A_cut-183
#sort -k1,1 ../human_chimp/processed_poly/MA0810.1_TFAP2A_cut-183_hum_chp.polysnps.txt > MA0810.1_TFAP2A_cut-183_hum_chp.polysnps.sort.txt
#join MA0810.1_TFAP2A_cut-183_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0810.1_TFAP2A_cut-183_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0810.1_TFAP2A_cut-183_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0810.1_TFAP2A_cut-183_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0810.1_TFAP2A_cut-183_hum_chp.polysnps.txt > MA0810.1_TFAP2A_cut-183_hum_chp.polysnps.sort.txt
#join MA0810.1_TFAP2A_cut-183_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0810.1_TFAP2A_cut-183_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0810.1_TFAP2A_cut-183_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0810.1_TFAP2A_cut-183_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0810.1_TFAP2A_cut-183_hum_chp_gor.polysnps.txt > MA0810.1_TFAP2A_cut-183_hum_chp_gor.polysnps.sort.txt
#join MA0810.1_TFAP2A_cut-183_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0810.1_TFAP2A_cut-183_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0810.1_TFAP2A_cut-183_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0810.1_TFAP2A_cut-183_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0810.1_TFAP2A_cut-183_hum_chp_gor_org.polysnps.txt > MA0810.1_TFAP2A_cut-183_hum_chp_gor_org.polysnps.sort.txt
#join MA0810.1_TFAP2A_cut-183_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0810.1_TFAP2A_cut-183_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0810.1_TFAP2A_cut-183_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0810.1_TFAP2A_cut-183_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0810.1_TFAP2A_cut-183_hum_chp_gor_org_rhe.polysnps.txt > MA0810.1_TFAP2A_cut-183_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0810.1_TFAP2A_cut-183_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0467.2_Crx_cut-104
#sort -k1,1 ../human_chimp/processed_poly/MA0467.2_Crx_cut-104_hum_chp.polysnps.txt > MA0467.2_Crx_cut-104_hum_chp.polysnps.sort.txt
#join MA0467.2_Crx_cut-104_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0467.2_Crx_cut-104_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0467.2_Crx_cut-104_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0467.2_Crx_cut-104_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0467.2_Crx_cut-104_hum_chp.polysnps.txt > MA0467.2_Crx_cut-104_hum_chp.polysnps.sort.txt
#join MA0467.2_Crx_cut-104_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0467.2_Crx_cut-104_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0467.2_Crx_cut-104_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0467.2_Crx_cut-104_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0467.2_Crx_cut-104_hum_chp_gor.polysnps.txt > MA0467.2_Crx_cut-104_hum_chp_gor.polysnps.sort.txt
#join MA0467.2_Crx_cut-104_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0467.2_Crx_cut-104_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0467.2_Crx_cut-104_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0467.2_Crx_cut-104_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0467.2_Crx_cut-104_hum_chp_gor_org.polysnps.txt > MA0467.2_Crx_cut-104_hum_chp_gor_org.polysnps.sort.txt
#join MA0467.2_Crx_cut-104_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0467.2_Crx_cut-104_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0467.2_Crx_cut-104_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0467.2_Crx_cut-104_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0467.2_Crx_cut-104_hum_chp_gor_org_rhe.polysnps.txt > MA0467.2_Crx_cut-104_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0467.2_Crx_cut-104_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1717.1_ZNF784_cut-244
#sort -k1,1 ../human_chimp/processed_poly/MA1717.1_ZNF784_cut-244_hum_chp.polysnps.txt > MA1717.1_ZNF784_cut-244_hum_chp.polysnps.sort.txt
#join MA1717.1_ZNF784_cut-244_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1717.1_ZNF784_cut-244_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1717.1_ZNF784_cut-244_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1717.1_ZNF784_cut-244_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1717.1_ZNF784_cut-244_hum_chp.polysnps.txt > MA1717.1_ZNF784_cut-244_hum_chp.polysnps.sort.txt
#join MA1717.1_ZNF784_cut-244_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1717.1_ZNF784_cut-244_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1717.1_ZNF784_cut-244_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1717.1_ZNF784_cut-244_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1717.1_ZNF784_cut-244_hum_chp_gor.polysnps.txt > MA1717.1_ZNF784_cut-244_hum_chp_gor.polysnps.sort.txt
#join MA1717.1_ZNF784_cut-244_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1717.1_ZNF784_cut-244_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1717.1_ZNF784_cut-244_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1717.1_ZNF784_cut-244_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1717.1_ZNF784_cut-244_hum_chp_gor_org.polysnps.txt > MA1717.1_ZNF784_cut-244_hum_chp_gor_org.polysnps.sort.txt
#join MA1717.1_ZNF784_cut-244_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1717.1_ZNF784_cut-244_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1717.1_ZNF784_cut-244_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1717.1_ZNF784_cut-244_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1717.1_ZNF784_cut-244_hum_chp_gor_org_rhe.polysnps.txt > MA1717.1_ZNF784_cut-244_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1717.1_ZNF784_cut-244_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0089.2_MAFG::NFE2L1_cut-719
#sort -k1,1 ../human_chimp/processed_poly/MA0089.2_MAFG::NFE2L1_cut-719_hum_chp.polysnps.txt > MA0089.2_MAFG::NFE2L1_cut-719_hum_chp.polysnps.sort.txt
#join MA0089.2_MAFG::NFE2L1_cut-719_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0089.2_MAFG::NFE2L1_cut-719_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0089.2_MAFG::NFE2L1_cut-719_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0089.2_MAFG::NFE2L1_cut-719_hum_chp.polysnps.txt > MA0089.2_MAFG::NFE2L1_cut-719_hum_chp.polysnps.sort.txt
#join MA0089.2_MAFG::NFE2L1_cut-719_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0089.2_MAFG::NFE2L1_cut-719_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor.polysnps.txt > MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor.polysnps.sort.txt
#join MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0089.2_MAFG::NFE2L1_cut-719_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org.polysnps.txt > MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org.polysnps.sort.txt
#join MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0089.2_MAFG::NFE2L1_cut-719_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org_rhe.polysnps.txt > MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0089.2_MAFG::NFE2L1_cut-719_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0884.2_DUXA_cut-1181
#sort -k1,1 ../human_chimp/processed_poly/MA0884.2_DUXA_cut-1181_hum_chp.polysnps.txt > MA0884.2_DUXA_cut-1181_hum_chp.polysnps.sort.txt
#join MA0884.2_DUXA_cut-1181_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0884.2_DUXA_cut-1181_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0884.2_DUXA_cut-1181_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0884.2_DUXA_cut-1181_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0884.2_DUXA_cut-1181_hum_chp.polysnps.txt > MA0884.2_DUXA_cut-1181_hum_chp.polysnps.sort.txt
#join MA0884.2_DUXA_cut-1181_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0884.2_DUXA_cut-1181_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0884.2_DUXA_cut-1181_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0884.2_DUXA_cut-1181_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0884.2_DUXA_cut-1181_hum_chp_gor.polysnps.txt > MA0884.2_DUXA_cut-1181_hum_chp_gor.polysnps.sort.txt
#join MA0884.2_DUXA_cut-1181_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0884.2_DUXA_cut-1181_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0884.2_DUXA_cut-1181_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0884.2_DUXA_cut-1181_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0884.2_DUXA_cut-1181_hum_chp_gor_org.polysnps.txt > MA0884.2_DUXA_cut-1181_hum_chp_gor_org.polysnps.sort.txt
#join MA0884.2_DUXA_cut-1181_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0884.2_DUXA_cut-1181_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0884.2_DUXA_cut-1181_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0884.2_DUXA_cut-1181_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0884.2_DUXA_cut-1181_hum_chp_gor_org_rhe.polysnps.txt > MA0884.2_DUXA_cut-1181_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0884.2_DUXA_cut-1181_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1985.1_ZNF669_cut-581
#sort -k1,1 ../human_chimp/processed_poly/MA1985.1_ZNF669_cut-581_hum_chp.polysnps.txt > MA1985.1_ZNF669_cut-581_hum_chp.polysnps.sort.txt
#join MA1985.1_ZNF669_cut-581_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1985.1_ZNF669_cut-581_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1985.1_ZNF669_cut-581_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1985.1_ZNF669_cut-581_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1985.1_ZNF669_cut-581_hum_chp.polysnps.txt > MA1985.1_ZNF669_cut-581_hum_chp.polysnps.sort.txt
#join MA1985.1_ZNF669_cut-581_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1985.1_ZNF669_cut-581_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1985.1_ZNF669_cut-581_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1985.1_ZNF669_cut-581_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1985.1_ZNF669_cut-581_hum_chp_gor.polysnps.txt > MA1985.1_ZNF669_cut-581_hum_chp_gor.polysnps.sort.txt
#join MA1985.1_ZNF669_cut-581_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1985.1_ZNF669_cut-581_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1985.1_ZNF669_cut-581_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1985.1_ZNF669_cut-581_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1985.1_ZNF669_cut-581_hum_chp_gor_org.polysnps.txt > MA1985.1_ZNF669_cut-581_hum_chp_gor_org.polysnps.sort.txt
#join MA1985.1_ZNF669_cut-581_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1985.1_ZNF669_cut-581_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1985.1_ZNF669_cut-581_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1985.1_ZNF669_cut-581_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1985.1_ZNF669_cut-581_hum_chp_gor_org_rhe.polysnps.txt > MA1985.1_ZNF669_cut-581_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1985.1_ZNF669_cut-581_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1981.1_ZNF530_cut-989
#sort -k1,1 ../human_chimp/processed_poly/MA1981.1_ZNF530_cut-989_hum_chp.polysnps.txt > MA1981.1_ZNF530_cut-989_hum_chp.polysnps.sort.txt
#join MA1981.1_ZNF530_cut-989_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1981.1_ZNF530_cut-989_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1981.1_ZNF530_cut-989_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1981.1_ZNF530_cut-989_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1981.1_ZNF530_cut-989_hum_chp.polysnps.txt > MA1981.1_ZNF530_cut-989_hum_chp.polysnps.sort.txt
#join MA1981.1_ZNF530_cut-989_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1981.1_ZNF530_cut-989_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1981.1_ZNF530_cut-989_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1981.1_ZNF530_cut-989_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1981.1_ZNF530_cut-989_hum_chp_gor.polysnps.txt > MA1981.1_ZNF530_cut-989_hum_chp_gor.polysnps.sort.txt
#join MA1981.1_ZNF530_cut-989_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1981.1_ZNF530_cut-989_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1981.1_ZNF530_cut-989_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1981.1_ZNF530_cut-989_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1981.1_ZNF530_cut-989_hum_chp_gor_org.polysnps.txt > MA1981.1_ZNF530_cut-989_hum_chp_gor_org.polysnps.sort.txt
#join MA1981.1_ZNF530_cut-989_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1981.1_ZNF530_cut-989_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1981.1_ZNF530_cut-989_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1981.1_ZNF530_cut-989_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1981.1_ZNF530_cut-989_hum_chp_gor_org_rhe.polysnps.txt > MA1981.1_ZNF530_cut-989_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1981.1_ZNF530_cut-989_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0468.1_DUX4_cut-10057
#sort -k1,1 ../human_chimp/processed_poly/MA0468.1_DUX4_cut-10057_hum_chp.polysnps.txt > MA0468.1_DUX4_cut-10057_hum_chp.polysnps.sort.txt
#join MA0468.1_DUX4_cut-10057_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0468.1_DUX4_cut-10057_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0468.1_DUX4_cut-10057_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0468.1_DUX4_cut-10057_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0468.1_DUX4_cut-10057_hum_chp.polysnps.txt > MA0468.1_DUX4_cut-10057_hum_chp.polysnps.sort.txt
#join MA0468.1_DUX4_cut-10057_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0468.1_DUX4_cut-10057_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0468.1_DUX4_cut-10057_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0468.1_DUX4_cut-10057_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0468.1_DUX4_cut-10057_hum_chp_gor.polysnps.txt > MA0468.1_DUX4_cut-10057_hum_chp_gor.polysnps.sort.txt
#join MA0468.1_DUX4_cut-10057_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0468.1_DUX4_cut-10057_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0468.1_DUX4_cut-10057_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0468.1_DUX4_cut-10057_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0468.1_DUX4_cut-10057_hum_chp_gor_org.polysnps.txt > MA0468.1_DUX4_cut-10057_hum_chp_gor_org.polysnps.sort.txt
#join MA0468.1_DUX4_cut-10057_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0468.1_DUX4_cut-10057_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0468.1_DUX4_cut-10057_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0468.1_DUX4_cut-10057_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0468.1_DUX4_cut-10057_hum_chp_gor_org_rhe.polysnps.txt > MA0468.1_DUX4_cut-10057_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0468.1_DUX4_cut-10057_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0890.1_GBX2_cut128
#sort -k1,1 ../human_chimp/processed_poly/MA0890.1_GBX2_cut128_hum_chp.polysnps.txt > MA0890.1_GBX2_cut128_hum_chp.polysnps.sort.txt
#join MA0890.1_GBX2_cut128_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0890.1_GBX2_cut128_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0890.1_GBX2_cut128_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0890.1_GBX2_cut128_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0890.1_GBX2_cut128_hum_chp.polysnps.txt > MA0890.1_GBX2_cut128_hum_chp.polysnps.sort.txt
#join MA0890.1_GBX2_cut128_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0890.1_GBX2_cut128_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0890.1_GBX2_cut128_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0890.1_GBX2_cut128_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0890.1_GBX2_cut128_hum_chp_gor.polysnps.txt > MA0890.1_GBX2_cut128_hum_chp_gor.polysnps.sort.txt
#join MA0890.1_GBX2_cut128_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0890.1_GBX2_cut128_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0890.1_GBX2_cut128_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0890.1_GBX2_cut128_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0890.1_GBX2_cut128_hum_chp_gor_org.polysnps.txt > MA0890.1_GBX2_cut128_hum_chp_gor_org.polysnps.sort.txt
#join MA0890.1_GBX2_cut128_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0890.1_GBX2_cut128_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0890.1_GBX2_cut128_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0890.1_GBX2_cut128_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0890.1_GBX2_cut128_hum_chp_gor_org_rhe.polysnps.txt > MA0890.1_GBX2_cut128_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0890.1_GBX2_cut128_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1975.1_ZNF214_cut-176
#sort -k1,1 ../human_chimp/processed_poly/MA1975.1_ZNF214_cut-176_hum_chp.polysnps.txt > MA1975.1_ZNF214_cut-176_hum_chp.polysnps.sort.txt
#join MA1975.1_ZNF214_cut-176_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1975.1_ZNF214_cut-176_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1975.1_ZNF214_cut-176_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1975.1_ZNF214_cut-176_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1975.1_ZNF214_cut-176_hum_chp.polysnps.txt > MA1975.1_ZNF214_cut-176_hum_chp.polysnps.sort.txt
#join MA1975.1_ZNF214_cut-176_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1975.1_ZNF214_cut-176_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1975.1_ZNF214_cut-176_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1975.1_ZNF214_cut-176_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1975.1_ZNF214_cut-176_hum_chp_gor.polysnps.txt > MA1975.1_ZNF214_cut-176_hum_chp_gor.polysnps.sort.txt
#join MA1975.1_ZNF214_cut-176_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1975.1_ZNF214_cut-176_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1975.1_ZNF214_cut-176_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1975.1_ZNF214_cut-176_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1975.1_ZNF214_cut-176_hum_chp_gor_org.polysnps.txt > MA1975.1_ZNF214_cut-176_hum_chp_gor_org.polysnps.sort.txt
#join MA1975.1_ZNF214_cut-176_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1975.1_ZNF214_cut-176_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1975.1_ZNF214_cut-176_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1975.1_ZNF214_cut-176_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1975.1_ZNF214_cut-176_hum_chp_gor_org_rhe.polysnps.txt > MA1975.1_ZNF214_cut-176_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1975.1_ZNF214_cut-176_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0155.1_INSM1_cut-19309
#sort -k1,1 ../human_chimp/processed_poly/MA0155.1_INSM1_cut-19309_hum_chp.polysnps.txt > MA0155.1_INSM1_cut-19309_hum_chp.polysnps.sort.txt
#join MA0155.1_INSM1_cut-19309_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0155.1_INSM1_cut-19309_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0155.1_INSM1_cut-19309_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0155.1_INSM1_cut-19309_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0155.1_INSM1_cut-19309_hum_chp.polysnps.txt > MA0155.1_INSM1_cut-19309_hum_chp.polysnps.sort.txt
#join MA0155.1_INSM1_cut-19309_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0155.1_INSM1_cut-19309_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0155.1_INSM1_cut-19309_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0155.1_INSM1_cut-19309_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0155.1_INSM1_cut-19309_hum_chp_gor.polysnps.txt > MA0155.1_INSM1_cut-19309_hum_chp_gor.polysnps.sort.txt
#join MA0155.1_INSM1_cut-19309_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0155.1_INSM1_cut-19309_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0155.1_INSM1_cut-19309_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0155.1_INSM1_cut-19309_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0155.1_INSM1_cut-19309_hum_chp_gor_org.polysnps.txt > MA0155.1_INSM1_cut-19309_hum_chp_gor_org.polysnps.sort.txt
#join MA0155.1_INSM1_cut-19309_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0155.1_INSM1_cut-19309_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0155.1_INSM1_cut-19309_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0155.1_INSM1_cut-19309_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0155.1_INSM1_cut-19309_hum_chp_gor_org_rhe.polysnps.txt > MA0155.1_INSM1_cut-19309_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0155.1_INSM1_cut-19309_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1133.1_JUN::JUNB_cut138
#sort -k1,1 ../human_chimp/processed_poly/MA1133.1_JUN::JUNB_cut138_hum_chp.polysnps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp.polysnps.sort.txt
#join MA1133.1_JUN::JUNB_cut138_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1133.1_JUN::JUNB_cut138_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1133.1_JUN::JUNB_cut138_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1133.1_JUN::JUNB_cut138_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1133.1_JUN::JUNB_cut138_hum_chp.polysnps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp.polysnps.sort.txt
#join MA1133.1_JUN::JUNB_cut138_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1133.1_JUN::JUNB_cut138_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1133.1_JUN::JUNB_cut138_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1133.1_JUN::JUNB_cut138_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1133.1_JUN::JUNB_cut138_hum_chp_gor.polysnps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp_gor.polysnps.sort.txt
#join MA1133.1_JUN::JUNB_cut138_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1133.1_JUN::JUNB_cut138_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org.polysnps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org.polysnps.sort.txt
#join MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1133.1_JUN::JUNB_cut138_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org_rhe.polysnps.txt > MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1133.1_JUN::JUNB_cut138_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1113.2_PBX2_cut117
#sort -k1,1 ../human_chimp/processed_poly/MA1113.2_PBX2_cut117_hum_chp.polysnps.txt > MA1113.2_PBX2_cut117_hum_chp.polysnps.sort.txt
#join MA1113.2_PBX2_cut117_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1113.2_PBX2_cut117_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1113.2_PBX2_cut117_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1113.2_PBX2_cut117_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1113.2_PBX2_cut117_hum_chp.polysnps.txt > MA1113.2_PBX2_cut117_hum_chp.polysnps.sort.txt
#join MA1113.2_PBX2_cut117_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1113.2_PBX2_cut117_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1113.2_PBX2_cut117_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1113.2_PBX2_cut117_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1113.2_PBX2_cut117_hum_chp_gor.polysnps.txt > MA1113.2_PBX2_cut117_hum_chp_gor.polysnps.sort.txt
#join MA1113.2_PBX2_cut117_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1113.2_PBX2_cut117_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1113.2_PBX2_cut117_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1113.2_PBX2_cut117_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1113.2_PBX2_cut117_hum_chp_gor_org.polysnps.txt > MA1113.2_PBX2_cut117_hum_chp_gor_org.polysnps.sort.txt
#join MA1113.2_PBX2_cut117_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1113.2_PBX2_cut117_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1113.2_PBX2_cut117_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1113.2_PBX2_cut117_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1113.2_PBX2_cut117_hum_chp_gor_org_rhe.polysnps.txt > MA1113.2_PBX2_cut117_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1113.2_PBX2_cut117_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0703.2_LMX1B_cut-10201
#sort -k1,1 ../human_chimp/processed_poly/MA0703.2_LMX1B_cut-10201_hum_chp.polysnps.txt > MA0703.2_LMX1B_cut-10201_hum_chp.polysnps.sort.txt
#join MA0703.2_LMX1B_cut-10201_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0703.2_LMX1B_cut-10201_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0703.2_LMX1B_cut-10201_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0703.2_LMX1B_cut-10201_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0703.2_LMX1B_cut-10201_hum_chp.polysnps.txt > MA0703.2_LMX1B_cut-10201_hum_chp.polysnps.sort.txt
#join MA0703.2_LMX1B_cut-10201_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0703.2_LMX1B_cut-10201_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0703.2_LMX1B_cut-10201_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0703.2_LMX1B_cut-10201_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0703.2_LMX1B_cut-10201_hum_chp_gor.polysnps.txt > MA0703.2_LMX1B_cut-10201_hum_chp_gor.polysnps.sort.txt
#join MA0703.2_LMX1B_cut-10201_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0703.2_LMX1B_cut-10201_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0703.2_LMX1B_cut-10201_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0703.2_LMX1B_cut-10201_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0703.2_LMX1B_cut-10201_hum_chp_gor_org.polysnps.txt > MA0703.2_LMX1B_cut-10201_hum_chp_gor_org.polysnps.sort.txt
#join MA0703.2_LMX1B_cut-10201_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0703.2_LMX1B_cut-10201_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0703.2_LMX1B_cut-10201_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0703.2_LMX1B_cut-10201_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0703.2_LMX1B_cut-10201_hum_chp_gor_org_rhe.polysnps.txt > MA0703.2_LMX1B_cut-10201_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0703.2_LMX1B_cut-10201_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0039.4_KLF4_cut7
#sort -k1,1 ../human_chimp/processed_poly/MA0039.4_KLF4_cut7_hum_chp.polysnps.txt > MA0039.4_KLF4_cut7_hum_chp.polysnps.sort.txt
#join MA0039.4_KLF4_cut7_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0039.4_KLF4_cut7_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0039.4_KLF4_cut7_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0039.4_KLF4_cut7_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0039.4_KLF4_cut7_hum_chp.polysnps.txt > MA0039.4_KLF4_cut7_hum_chp.polysnps.sort.txt
#join MA0039.4_KLF4_cut7_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0039.4_KLF4_cut7_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0039.4_KLF4_cut7_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0039.4_KLF4_cut7_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0039.4_KLF4_cut7_hum_chp_gor.polysnps.txt > MA0039.4_KLF4_cut7_hum_chp_gor.polysnps.sort.txt
#join MA0039.4_KLF4_cut7_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0039.4_KLF4_cut7_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0039.4_KLF4_cut7_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0039.4_KLF4_cut7_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0039.4_KLF4_cut7_hum_chp_gor_org.polysnps.txt > MA0039.4_KLF4_cut7_hum_chp_gor_org.polysnps.sort.txt
#join MA0039.4_KLF4_cut7_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0039.4_KLF4_cut7_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0039.4_KLF4_cut7_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0039.4_KLF4_cut7_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0039.4_KLF4_cut7_hum_chp_gor_org_rhe.polysnps.txt > MA0039.4_KLF4_cut7_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0039.4_KLF4_cut7_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1578.1_VEZF1_cut-762
#sort -k1,1 ../human_chimp/processed_poly/MA1578.1_VEZF1_cut-762_hum_chp.polysnps.txt > MA1578.1_VEZF1_cut-762_hum_chp.polysnps.sort.txt
#join MA1578.1_VEZF1_cut-762_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1578.1_VEZF1_cut-762_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1578.1_VEZF1_cut-762_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1578.1_VEZF1_cut-762_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1578.1_VEZF1_cut-762_hum_chp.polysnps.txt > MA1578.1_VEZF1_cut-762_hum_chp.polysnps.sort.txt
#join MA1578.1_VEZF1_cut-762_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1578.1_VEZF1_cut-762_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1578.1_VEZF1_cut-762_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1578.1_VEZF1_cut-762_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1578.1_VEZF1_cut-762_hum_chp_gor.polysnps.txt > MA1578.1_VEZF1_cut-762_hum_chp_gor.polysnps.sort.txt
#join MA1578.1_VEZF1_cut-762_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1578.1_VEZF1_cut-762_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1578.1_VEZF1_cut-762_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1578.1_VEZF1_cut-762_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1578.1_VEZF1_cut-762_hum_chp_gor_org.polysnps.txt > MA1578.1_VEZF1_cut-762_hum_chp_gor_org.polysnps.sort.txt
#join MA1578.1_VEZF1_cut-762_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1578.1_VEZF1_cut-762_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1578.1_VEZF1_cut-762_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1578.1_VEZF1_cut-762_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1578.1_VEZF1_cut-762_hum_chp_gor_org_rhe.polysnps.txt > MA1578.1_VEZF1_cut-762_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1578.1_VEZF1_cut-762_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1485.1_FERD3L_cut-2133
#sort -k1,1 ../human_chimp/processed_poly/MA1485.1_FERD3L_cut-2133_hum_chp.polysnps.txt > MA1485.1_FERD3L_cut-2133_hum_chp.polysnps.sort.txt
#join MA1485.1_FERD3L_cut-2133_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1485.1_FERD3L_cut-2133_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1485.1_FERD3L_cut-2133_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1485.1_FERD3L_cut-2133_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1485.1_FERD3L_cut-2133_hum_chp.polysnps.txt > MA1485.1_FERD3L_cut-2133_hum_chp.polysnps.sort.txt
#join MA1485.1_FERD3L_cut-2133_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1485.1_FERD3L_cut-2133_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1485.1_FERD3L_cut-2133_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1485.1_FERD3L_cut-2133_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1485.1_FERD3L_cut-2133_hum_chp_gor.polysnps.txt > MA1485.1_FERD3L_cut-2133_hum_chp_gor.polysnps.sort.txt
#join MA1485.1_FERD3L_cut-2133_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1485.1_FERD3L_cut-2133_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1485.1_FERD3L_cut-2133_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1485.1_FERD3L_cut-2133_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1485.1_FERD3L_cut-2133_hum_chp_gor_org.polysnps.txt > MA1485.1_FERD3L_cut-2133_hum_chp_gor_org.polysnps.sort.txt
#join MA1485.1_FERD3L_cut-2133_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1485.1_FERD3L_cut-2133_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1485.1_FERD3L_cut-2133_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1485.1_FERD3L_cut-2133_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1485.1_FERD3L_cut-2133_hum_chp_gor_org_rhe.polysnps.txt > MA1485.1_FERD3L_cut-2133_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1485.1_FERD3L_cut-2133_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1719.1_ZNF816_cut-571
#sort -k1,1 ../human_chimp/processed_poly/MA1719.1_ZNF816_cut-571_hum_chp.polysnps.txt > MA1719.1_ZNF816_cut-571_hum_chp.polysnps.sort.txt
#join MA1719.1_ZNF816_cut-571_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1719.1_ZNF816_cut-571_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1719.1_ZNF816_cut-571_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1719.1_ZNF816_cut-571_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1719.1_ZNF816_cut-571_hum_chp.polysnps.txt > MA1719.1_ZNF816_cut-571_hum_chp.polysnps.sort.txt
#join MA1719.1_ZNF816_cut-571_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1719.1_ZNF816_cut-571_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1719.1_ZNF816_cut-571_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1719.1_ZNF816_cut-571_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1719.1_ZNF816_cut-571_hum_chp_gor.polysnps.txt > MA1719.1_ZNF816_cut-571_hum_chp_gor.polysnps.sort.txt
#join MA1719.1_ZNF816_cut-571_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1719.1_ZNF816_cut-571_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1719.1_ZNF816_cut-571_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1719.1_ZNF816_cut-571_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1719.1_ZNF816_cut-571_hum_chp_gor_org.polysnps.txt > MA1719.1_ZNF816_cut-571_hum_chp_gor_org.polysnps.sort.txt
#join MA1719.1_ZNF816_cut-571_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1719.1_ZNF816_cut-571_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1719.1_ZNF816_cut-571_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1719.1_ZNF816_cut-571_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1719.1_ZNF816_cut-571_hum_chp_gor_org_rhe.polysnps.txt > MA1719.1_ZNF816_cut-571_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1719.1_ZNF816_cut-571_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1708.1_ETV7_cut-301
#sort -k1,1 ../human_chimp/processed_poly/MA1708.1_ETV7_cut-301_hum_chp.polysnps.txt > MA1708.1_ETV7_cut-301_hum_chp.polysnps.sort.txt
#join MA1708.1_ETV7_cut-301_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1708.1_ETV7_cut-301_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1708.1_ETV7_cut-301_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1708.1_ETV7_cut-301_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1708.1_ETV7_cut-301_hum_chp.polysnps.txt > MA1708.1_ETV7_cut-301_hum_chp.polysnps.sort.txt
#join MA1708.1_ETV7_cut-301_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1708.1_ETV7_cut-301_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1708.1_ETV7_cut-301_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1708.1_ETV7_cut-301_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1708.1_ETV7_cut-301_hum_chp_gor.polysnps.txt > MA1708.1_ETV7_cut-301_hum_chp_gor.polysnps.sort.txt
#join MA1708.1_ETV7_cut-301_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1708.1_ETV7_cut-301_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1708.1_ETV7_cut-301_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1708.1_ETV7_cut-301_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1708.1_ETV7_cut-301_hum_chp_gor_org.polysnps.txt > MA1708.1_ETV7_cut-301_hum_chp_gor_org.polysnps.sort.txt
#join MA1708.1_ETV7_cut-301_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1708.1_ETV7_cut-301_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1708.1_ETV7_cut-301_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1708.1_ETV7_cut-301_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1708.1_ETV7_cut-301_hum_chp_gor_org_rhe.polysnps.txt > MA1708.1_ETV7_cut-301_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1708.1_ETV7_cut-301_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0040.1_Foxq1_cut-18827
#sort -k1,1 ../human_chimp/processed_poly/MA0040.1_Foxq1_cut-18827_hum_chp.polysnps.txt > MA0040.1_Foxq1_cut-18827_hum_chp.polysnps.sort.txt
#join MA0040.1_Foxq1_cut-18827_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0040.1_Foxq1_cut-18827_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0040.1_Foxq1_cut-18827_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0040.1_Foxq1_cut-18827_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0040.1_Foxq1_cut-18827_hum_chp.polysnps.txt > MA0040.1_Foxq1_cut-18827_hum_chp.polysnps.sort.txt
#join MA0040.1_Foxq1_cut-18827_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0040.1_Foxq1_cut-18827_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0040.1_Foxq1_cut-18827_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0040.1_Foxq1_cut-18827_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0040.1_Foxq1_cut-18827_hum_chp_gor.polysnps.txt > MA0040.1_Foxq1_cut-18827_hum_chp_gor.polysnps.sort.txt
#join MA0040.1_Foxq1_cut-18827_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0040.1_Foxq1_cut-18827_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0040.1_Foxq1_cut-18827_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0040.1_Foxq1_cut-18827_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0040.1_Foxq1_cut-18827_hum_chp_gor_org.polysnps.txt > MA0040.1_Foxq1_cut-18827_hum_chp_gor_org.polysnps.sort.txt
#join MA0040.1_Foxq1_cut-18827_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0040.1_Foxq1_cut-18827_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0040.1_Foxq1_cut-18827_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0040.1_Foxq1_cut-18827_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0040.1_Foxq1_cut-18827_hum_chp_gor_org_rhe.polysnps.txt > MA0040.1_Foxq1_cut-18827_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0040.1_Foxq1_cut-18827_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1982.1_ZNF574_cut-641
#sort -k1,1 ../human_chimp/processed_poly/MA1982.1_ZNF574_cut-641_hum_chp.polysnps.txt > MA1982.1_ZNF574_cut-641_hum_chp.polysnps.sort.txt
#join MA1982.1_ZNF574_cut-641_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1982.1_ZNF574_cut-641_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1982.1_ZNF574_cut-641_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1982.1_ZNF574_cut-641_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1982.1_ZNF574_cut-641_hum_chp.polysnps.txt > MA1982.1_ZNF574_cut-641_hum_chp.polysnps.sort.txt
#join MA1982.1_ZNF574_cut-641_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1982.1_ZNF574_cut-641_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1982.1_ZNF574_cut-641_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1982.1_ZNF574_cut-641_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1982.1_ZNF574_cut-641_hum_chp_gor.polysnps.txt > MA1982.1_ZNF574_cut-641_hum_chp_gor.polysnps.sort.txt
#join MA1982.1_ZNF574_cut-641_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1982.1_ZNF574_cut-641_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1982.1_ZNF574_cut-641_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1982.1_ZNF574_cut-641_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1982.1_ZNF574_cut-641_hum_chp_gor_org.polysnps.txt > MA1982.1_ZNF574_cut-641_hum_chp_gor_org.polysnps.sort.txt
#join MA1982.1_ZNF574_cut-641_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1982.1_ZNF574_cut-641_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1982.1_ZNF574_cut-641_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1982.1_ZNF574_cut-641_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1982.1_ZNF574_cut-641_hum_chp_gor_org_rhe.polysnps.txt > MA1982.1_ZNF574_cut-641_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1982.1_ZNF574_cut-641_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1478.1_DMRTA2_cut158
#sort -k1,1 ../human_chimp/processed_poly/MA1478.1_DMRTA2_cut158_hum_chp.polysnps.txt > MA1478.1_DMRTA2_cut158_hum_chp.polysnps.sort.txt
#join MA1478.1_DMRTA2_cut158_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1478.1_DMRTA2_cut158_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1478.1_DMRTA2_cut158_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1478.1_DMRTA2_cut158_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1478.1_DMRTA2_cut158_hum_chp.polysnps.txt > MA1478.1_DMRTA2_cut158_hum_chp.polysnps.sort.txt
#join MA1478.1_DMRTA2_cut158_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1478.1_DMRTA2_cut158_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1478.1_DMRTA2_cut158_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1478.1_DMRTA2_cut158_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1478.1_DMRTA2_cut158_hum_chp_gor.polysnps.txt > MA1478.1_DMRTA2_cut158_hum_chp_gor.polysnps.sort.txt
#join MA1478.1_DMRTA2_cut158_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1478.1_DMRTA2_cut158_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1478.1_DMRTA2_cut158_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1478.1_DMRTA2_cut158_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1478.1_DMRTA2_cut158_hum_chp_gor_org.polysnps.txt > MA1478.1_DMRTA2_cut158_hum_chp_gor_org.polysnps.sort.txt
#join MA1478.1_DMRTA2_cut158_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1478.1_DMRTA2_cut158_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1478.1_DMRTA2_cut158_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1478.1_DMRTA2_cut158_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1478.1_DMRTA2_cut158_hum_chp_gor_org_rhe.polysnps.txt > MA1478.1_DMRTA2_cut158_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1478.1_DMRTA2_cut158_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0841.1_NFE2_cut-2385
#sort -k1,1 ../human_chimp/processed_poly/MA0841.1_NFE2_cut-2385_hum_chp.polysnps.txt > MA0841.1_NFE2_cut-2385_hum_chp.polysnps.sort.txt
#join MA0841.1_NFE2_cut-2385_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0841.1_NFE2_cut-2385_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0841.1_NFE2_cut-2385_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0841.1_NFE2_cut-2385_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0841.1_NFE2_cut-2385_hum_chp.polysnps.txt > MA0841.1_NFE2_cut-2385_hum_chp.polysnps.sort.txt
#join MA0841.1_NFE2_cut-2385_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0841.1_NFE2_cut-2385_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0841.1_NFE2_cut-2385_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0841.1_NFE2_cut-2385_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0841.1_NFE2_cut-2385_hum_chp_gor.polysnps.txt > MA0841.1_NFE2_cut-2385_hum_chp_gor.polysnps.sort.txt
#join MA0841.1_NFE2_cut-2385_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0841.1_NFE2_cut-2385_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0841.1_NFE2_cut-2385_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0841.1_NFE2_cut-2385_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0841.1_NFE2_cut-2385_hum_chp_gor_org.polysnps.txt > MA0841.1_NFE2_cut-2385_hum_chp_gor_org.polysnps.sort.txt
#join MA0841.1_NFE2_cut-2385_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0841.1_NFE2_cut-2385_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0841.1_NFE2_cut-2385_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0841.1_NFE2_cut-2385_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0841.1_NFE2_cut-2385_hum_chp_gor_org_rhe.polysnps.txt > MA0841.1_NFE2_cut-2385_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0841.1_NFE2_cut-2385_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0873.1_HOXD12_cut-674
#sort -k1,1 ../human_chimp/processed_poly/MA0873.1_HOXD12_cut-674_hum_chp.polysnps.txt > MA0873.1_HOXD12_cut-674_hum_chp.polysnps.sort.txt
#join MA0873.1_HOXD12_cut-674_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0873.1_HOXD12_cut-674_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0873.1_HOXD12_cut-674_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0873.1_HOXD12_cut-674_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0873.1_HOXD12_cut-674_hum_chp.polysnps.txt > MA0873.1_HOXD12_cut-674_hum_chp.polysnps.sort.txt
#join MA0873.1_HOXD12_cut-674_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0873.1_HOXD12_cut-674_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0873.1_HOXD12_cut-674_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0873.1_HOXD12_cut-674_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0873.1_HOXD12_cut-674_hum_chp_gor.polysnps.txt > MA0873.1_HOXD12_cut-674_hum_chp_gor.polysnps.sort.txt
#join MA0873.1_HOXD12_cut-674_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0873.1_HOXD12_cut-674_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0873.1_HOXD12_cut-674_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0873.1_HOXD12_cut-674_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0873.1_HOXD12_cut-674_hum_chp_gor_org.polysnps.txt > MA0873.1_HOXD12_cut-674_hum_chp_gor_org.polysnps.sort.txt
#join MA0873.1_HOXD12_cut-674_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0873.1_HOXD12_cut-674_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0873.1_HOXD12_cut-674_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0873.1_HOXD12_cut-674_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0873.1_HOXD12_cut-674_hum_chp_gor_org_rhe.polysnps.txt > MA0873.1_HOXD12_cut-674_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0873.1_HOXD12_cut-674_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1141.1_FOS::JUND_cut-9239
#sort -k1,1 ../human_chimp/processed_poly/MA1141.1_FOS::JUND_cut-9239_hum_chp.polysnps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp.polysnps.sort.txt
#join MA1141.1_FOS::JUND_cut-9239_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1141.1_FOS::JUND_cut-9239_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1141.1_FOS::JUND_cut-9239_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1141.1_FOS::JUND_cut-9239_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1141.1_FOS::JUND_cut-9239_hum_chp.polysnps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp.polysnps.sort.txt
#join MA1141.1_FOS::JUND_cut-9239_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1141.1_FOS::JUND_cut-9239_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1141.1_FOS::JUND_cut-9239_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1141.1_FOS::JUND_cut-9239_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1141.1_FOS::JUND_cut-9239_hum_chp_gor.polysnps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp_gor.polysnps.sort.txt
#join MA1141.1_FOS::JUND_cut-9239_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1141.1_FOS::JUND_cut-9239_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org.polysnps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org.polysnps.sort.txt
#join MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1141.1_FOS::JUND_cut-9239_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org_rhe.polysnps.txt > MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1141.1_FOS::JUND_cut-9239_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1577.1_TLX2_cut-9250
#sort -k1,1 ../human_chimp/processed_poly/MA1577.1_TLX2_cut-9250_hum_chp.polysnps.txt > MA1577.1_TLX2_cut-9250_hum_chp.polysnps.sort.txt
#join MA1577.1_TLX2_cut-9250_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1577.1_TLX2_cut-9250_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1577.1_TLX2_cut-9250_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1577.1_TLX2_cut-9250_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1577.1_TLX2_cut-9250_hum_chp.polysnps.txt > MA1577.1_TLX2_cut-9250_hum_chp.polysnps.sort.txt
#join MA1577.1_TLX2_cut-9250_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1577.1_TLX2_cut-9250_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1577.1_TLX2_cut-9250_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1577.1_TLX2_cut-9250_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1577.1_TLX2_cut-9250_hum_chp_gor.polysnps.txt > MA1577.1_TLX2_cut-9250_hum_chp_gor.polysnps.sort.txt
#join MA1577.1_TLX2_cut-9250_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1577.1_TLX2_cut-9250_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1577.1_TLX2_cut-9250_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1577.1_TLX2_cut-9250_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1577.1_TLX2_cut-9250_hum_chp_gor_org.polysnps.txt > MA1577.1_TLX2_cut-9250_hum_chp_gor_org.polysnps.sort.txt
#join MA1577.1_TLX2_cut-9250_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1577.1_TLX2_cut-9250_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1577.1_TLX2_cut-9250_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1577.1_TLX2_cut-9250_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1577.1_TLX2_cut-9250_hum_chp_gor_org_rhe.polysnps.txt > MA1577.1_TLX2_cut-9250_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1577.1_TLX2_cut-9250_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1727.1_ZNF417_cut-728
#sort -k1,1 ../human_chimp/processed_poly/MA1727.1_ZNF417_cut-728_hum_chp.polysnps.txt > MA1727.1_ZNF417_cut-728_hum_chp.polysnps.sort.txt
#join MA1727.1_ZNF417_cut-728_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1727.1_ZNF417_cut-728_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1727.1_ZNF417_cut-728_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1727.1_ZNF417_cut-728_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1727.1_ZNF417_cut-728_hum_chp.polysnps.txt > MA1727.1_ZNF417_cut-728_hum_chp.polysnps.sort.txt
#join MA1727.1_ZNF417_cut-728_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1727.1_ZNF417_cut-728_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1727.1_ZNF417_cut-728_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1727.1_ZNF417_cut-728_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1727.1_ZNF417_cut-728_hum_chp_gor.polysnps.txt > MA1727.1_ZNF417_cut-728_hum_chp_gor.polysnps.sort.txt
#join MA1727.1_ZNF417_cut-728_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1727.1_ZNF417_cut-728_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1727.1_ZNF417_cut-728_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1727.1_ZNF417_cut-728_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1727.1_ZNF417_cut-728_hum_chp_gor_org.polysnps.txt > MA1727.1_ZNF417_cut-728_hum_chp_gor_org.polysnps.sort.txt
#join MA1727.1_ZNF417_cut-728_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1727.1_ZNF417_cut-728_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1727.1_ZNF417_cut-728_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1727.1_ZNF417_cut-728_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1727.1_ZNF417_cut-728_hum_chp_gor_org_rhe.polysnps.txt > MA1727.1_ZNF417_cut-728_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1727.1_ZNF417_cut-728_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1716.1_ZNF76_cut-1254
#sort -k1,1 ../human_chimp/processed_poly/MA1716.1_ZNF76_cut-1254_hum_chp.polysnps.txt > MA1716.1_ZNF76_cut-1254_hum_chp.polysnps.sort.txt
#join MA1716.1_ZNF76_cut-1254_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1716.1_ZNF76_cut-1254_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1716.1_ZNF76_cut-1254_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1716.1_ZNF76_cut-1254_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1716.1_ZNF76_cut-1254_hum_chp.polysnps.txt > MA1716.1_ZNF76_cut-1254_hum_chp.polysnps.sort.txt
#join MA1716.1_ZNF76_cut-1254_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1716.1_ZNF76_cut-1254_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1716.1_ZNF76_cut-1254_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1716.1_ZNF76_cut-1254_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1716.1_ZNF76_cut-1254_hum_chp_gor.polysnps.txt > MA1716.1_ZNF76_cut-1254_hum_chp_gor.polysnps.sort.txt
#join MA1716.1_ZNF76_cut-1254_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1716.1_ZNF76_cut-1254_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1716.1_ZNF76_cut-1254_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1716.1_ZNF76_cut-1254_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1716.1_ZNF76_cut-1254_hum_chp_gor_org.polysnps.txt > MA1716.1_ZNF76_cut-1254_hum_chp_gor_org.polysnps.sort.txt
#join MA1716.1_ZNF76_cut-1254_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1716.1_ZNF76_cut-1254_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1716.1_ZNF76_cut-1254_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1716.1_ZNF76_cut-1254_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1716.1_ZNF76_cut-1254_hum_chp_gor_org_rhe.polysnps.txt > MA1716.1_ZNF76_cut-1254_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1716.1_ZNF76_cut-1254_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0905.1_HOXC10_cut32
#sort -k1,1 ../human_chimp/processed_poly/MA0905.1_HOXC10_cut32_hum_chp.polysnps.txt > MA0905.1_HOXC10_cut32_hum_chp.polysnps.sort.txt
#join MA0905.1_HOXC10_cut32_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0905.1_HOXC10_cut32_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0905.1_HOXC10_cut32_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0905.1_HOXC10_cut32_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0905.1_HOXC10_cut32_hum_chp.polysnps.txt > MA0905.1_HOXC10_cut32_hum_chp.polysnps.sort.txt
#join MA0905.1_HOXC10_cut32_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0905.1_HOXC10_cut32_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0905.1_HOXC10_cut32_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0905.1_HOXC10_cut32_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0905.1_HOXC10_cut32_hum_chp_gor.polysnps.txt > MA0905.1_HOXC10_cut32_hum_chp_gor.polysnps.sort.txt
#join MA0905.1_HOXC10_cut32_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0905.1_HOXC10_cut32_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0905.1_HOXC10_cut32_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0905.1_HOXC10_cut32_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0905.1_HOXC10_cut32_hum_chp_gor_org.polysnps.txt > MA0905.1_HOXC10_cut32_hum_chp_gor_org.polysnps.sort.txt
#join MA0905.1_HOXC10_cut32_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0905.1_HOXC10_cut32_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0905.1_HOXC10_cut32_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0905.1_HOXC10_cut32_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0905.1_HOXC10_cut32_hum_chp_gor_org_rhe.polysnps.txt > MA0905.1_HOXC10_cut32_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0905.1_HOXC10_cut32_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0095.3_Yy1_cut15
#sort -k1,1 ../human_chimp/processed_poly/MA0095.3_Yy1_cut15_hum_chp.polysnps.txt > MA0095.3_Yy1_cut15_hum_chp.polysnps.sort.txt
#join MA0095.3_Yy1_cut15_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0095.3_Yy1_cut15_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0095.3_Yy1_cut15_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0095.3_Yy1_cut15_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0095.3_Yy1_cut15_hum_chp.polysnps.txt > MA0095.3_Yy1_cut15_hum_chp.polysnps.sort.txt
#join MA0095.3_Yy1_cut15_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0095.3_Yy1_cut15_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0095.3_Yy1_cut15_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0095.3_Yy1_cut15_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0095.3_Yy1_cut15_hum_chp_gor.polysnps.txt > MA0095.3_Yy1_cut15_hum_chp_gor.polysnps.sort.txt
#join MA0095.3_Yy1_cut15_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0095.3_Yy1_cut15_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0095.3_Yy1_cut15_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0095.3_Yy1_cut15_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0095.3_Yy1_cut15_hum_chp_gor_org.polysnps.txt > MA0095.3_Yy1_cut15_hum_chp_gor_org.polysnps.sort.txt
#join MA0095.3_Yy1_cut15_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0095.3_Yy1_cut15_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0095.3_Yy1_cut15_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0095.3_Yy1_cut15_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0095.3_Yy1_cut15_hum_chp_gor_org_rhe.polysnps.txt > MA0095.3_Yy1_cut15_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0095.3_Yy1_cut15_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA1942.1_ETV2::FOXI1_cut-167
#sort -k1,1 ../human_chimp/processed_poly/MA1942.1_ETV2::FOXI1_cut-167_hum_chp.polysnps.txt > MA1942.1_ETV2::FOXI1_cut-167_hum_chp.polysnps.sort.txt
#join MA1942.1_ETV2::FOXI1_cut-167_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA1942.1_ETV2::FOXI1_cut-167_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA1942.1_ETV2::FOXI1_cut-167_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA1942.1_ETV2::FOXI1_cut-167_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA1942.1_ETV2::FOXI1_cut-167_hum_chp.polysnps.txt > MA1942.1_ETV2::FOXI1_cut-167_hum_chp.polysnps.sort.txt
#join MA1942.1_ETV2::FOXI1_cut-167_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA1942.1_ETV2::FOXI1_cut-167_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor.polysnps.txt > MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor.polysnps.sort.txt
#join MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA1942.1_ETV2::FOXI1_cut-167_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org.polysnps.txt > MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org.polysnps.sort.txt
#join MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA1942.1_ETV2::FOXI1_cut-167_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org_rhe.polysnps.txt > MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA1942.1_ETV2::FOXI1_cut-167_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

#MA0767.1_GCM2_cut-119
#sort -k1,1 ../human_chimp/processed_poly/MA0767.1_GCM2_cut-119_hum_chp.polysnps.txt > MA0767.1_GCM2_cut-119_hum_chp.polysnps.sort.txt
#join MA0767.1_GCM2_cut-119_hum_chp.polysnps.sort.txt ../process_bon/processed_poly/MA0767.1_GCM2_cut-119_bonobo_ms.polysnps.join.actual.bed -a1 -a2 >  MA0767.1_GCM2_cut-119_hum_chp_bon.pre.polysnps.txt
#python reformat.py MA0767.1_GCM2_cut-119_hum_chp.pre.polysnps.txt 4 PanPan3

#sort -k1,1 MA0767.1_GCM2_cut-119_hum_chp.polysnps.txt > MA0767.1_GCM2_cut-119_hum_chp.polysnps.sort.txt
#join MA0767.1_GCM2_cut-119_hum_chp.polysnps.sort.txt ../process_gor/processed_poly/MA0767.1_GCM2_cut-119_gorilla_ms.polysnps.join.actual.bed -a1 -a2 >  MA0767.1_GCM2_cut-119_hum_chp_gor.pre.polysnps.txt
#python reformat.py MA0767.1_GCM2_cut-119_hum_chp_gor.pre.polysnps.txt 4 GorGor6

#sort -k1,1 MA0767.1_GCM2_cut-119_hum_chp_gor.polysnps.txt > MA0767.1_GCM2_cut-119_hum_chp_gor.polysnps.sort.txt
#join MA0767.1_GCM2_cut-119_hum_chp_gor.polysnps.sort.txt ../process_org/processed_poly/MA0767.1_GCM2_cut-119_orangutan_ms.polysnps.join.actual.bed -a1 -a2 >  MA0767.1_GCM2_cut-119_hum_chp_gor_org.pre.polysnps.txt
#python reformat.py MA0767.1_GCM2_cut-119_hum_chp_gor_org.pre.polysnps.txt 5 PonAbe3

#sort -k1,1 MA0767.1_GCM2_cut-119_hum_chp_gor_org.polysnps.txt > MA0767.1_GCM2_cut-119_hum_chp_gor_org.polysnps.sort.txt
#join MA0767.1_GCM2_cut-119_hum_chp_gor_org.polysnps.sort.txt ../process_rhe/processed_poly/MA0767.1_GCM2_cut-119_rhesus_ms.polysnps.join.actual.bed -a1 -a2 >  MA0767.1_GCM2_cut-119_hum_chp_gor_org_rhe.pre.polysnps.txt
#python reformat.py MA0767.1_GCM2_cut-119_hum_chp_gor_org_rhe.pre.polysnps.txt 6 RheMac10

sort -k1,1 MA0767.1_GCM2_cut-119_hum_chp_gor_org_rhe.polysnps.txt > MA0767.1_GCM2_cut-119_hum_chp_gor_org_rhe.polysnps.sort.txt
mv MA0767.1_GCM2_cut-119_hum_chp_gor_org_rhe.polysnps.sort.txt all_done_poly

