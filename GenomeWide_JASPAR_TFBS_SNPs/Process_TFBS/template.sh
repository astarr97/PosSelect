
sort -k10,10 PREFIX_bonobo_ms.bed.snps.bed > PREFIX_bonobo_ms.bed.snps.sort.bed
python process_tfbs.py PREFIX_bonobo_ms.bed.snps.sort.bed
sort -k1,1 PREFIX_bonobo_ms.snps.proc.bed > PREFIX_bonobo_ms.snps.procsort.bed
join human_referenced_chp_hum_snps_sorted.PanPan3.whitelist.procsort.bed PREFIX_bonobo_ms.snps.procsort.bed > PREFIX_bonobo_ms.snps.join.bed
python hc_to_bed.py PREFIX_bonobo_ms.snps.join.bed
