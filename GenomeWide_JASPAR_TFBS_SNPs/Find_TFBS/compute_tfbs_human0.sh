#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH -p hbfraser
#SBATCH --mem=64GB
#SBATCH -c 1

cat ../human.fasta | ./matrix_scan -m MA1597.1_ZNF528.mat -c -1152 | sort -s -k1,1 -k2,2n > MA1597.1_ZNF528_cut-1152_human_ms.out
python convert_score.py MA1597.1_ZNF528_cut-1152_human_ms.out MA1597.1_ZNF528.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0829.2_SREBF1.mat -c -173 | sort -s -k1,1 -k2,2n > MA0829.2_SREBF1_cut-173_human_ms.out
python convert_score.py MA0829.2_SREBF1_cut-173_human_ms.out MA0829.2_SREBF1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0826.1_OLIG1.mat -c -813 | sort -s -k1,1 -k2,2n > MA0826.1_OLIG1_cut-813_human_ms.out
python convert_score.py MA0826.1_OLIG1_cut-813_human_ms.out MA0826.1_OLIG1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1505.1_HOXC8.mat -c 341 | sort -s -k1,1 -k2,2n > MA1505.1_HOXC8_cut341_human_ms.out
python convert_score.py MA1505.1_HOXC8_cut341_human_ms.out MA1505.1_HOXC8.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0820.1_FIGLA.mat -c -85 | sort -s -k1,1 -k2,2n > MA0820.1_FIGLA_cut-85_human_ms.out
python convert_score.py MA0820.1_FIGLA_cut-85_human_ms.out MA0820.1_FIGLA.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0819.2_CLOCK.mat -c -150 | sort -s -k1,1 -k2,2n > MA0819.2_CLOCK_cut-150_human_ms.out
python convert_score.py MA0819.2_CLOCK_cut-150_human_ms.out MA0819.2_CLOCK.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1103.2_FOXK2.mat -c 219 | sort -s -k1,1 -k2,2n > MA1103.2_FOXK2_cut219_human_ms.out
python convert_score.py MA1103.2_FOXK2_cut219_human_ms.out MA1103.2_FOXK2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1535.1_NR2C1.mat -c -785 | sort -s -k1,1 -k2,2n > MA1535.1_NR2C1_cut-785_human_ms.out
python convert_score.py MA1535.1_NR2C1_cut-785_human_ms.out MA1535.1_NR2C1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1139.1_FOSL2::JUNB.mat -c -156 | sort -s -k1,1 -k2,2n > MA1139.1_FOSL2::JUNB_cut-156_human_ms.out
python convert_score.py MA1139.1_FOSL2::JUNB_cut-156_human_ms.out MA1139.1_FOSL2::JUNB.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0634.1_ALX3.mat -c 366 | sort -s -k1,1 -k2,2n > MA0634.1_ALX3_cut366_human_ms.out
python convert_score.py MA0634.1_ALX3_cut366_human_ms.out MA0634.1_ALX3.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1968.1_TFCP2.mat -c -93 | sort -s -k1,1 -k2,2n > MA1968.1_TFCP2_cut-93_human_ms.out
python convert_score.py MA1968.1_TFCP2_cut-93_human_ms.out MA1968.1_TFCP2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0510.2_RFX5.mat -c -1117 | sort -s -k1,1 -k2,2n > MA0510.2_RFX5_cut-1117_human_ms.out
python convert_score.py MA0510.2_RFX5_cut-1117_human_ms.out MA0510.2_RFX5.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1478.1_DMRTA2.mat -c 158 | sort -s -k1,1 -k2,2n > MA1478.1_DMRTA2_cut158_human_ms.out
python convert_score.py MA1478.1_DMRTA2_cut158_human_ms.out MA1478.1_DMRTA2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0810.1_TFAP2A.mat -c -183 | sort -s -k1,1 -k2,2n > MA0810.1_TFAP2A_cut-183_human_ms.out
python convert_score.py MA0810.1_TFAP2A_cut-183_human_ms.out MA0810.1_TFAP2A.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1996.1_Nr1H2.mat -c -15 | sort -s -k1,1 -k2,2n > MA1996.1_Nr1H2_cut-15_human_ms.out
python convert_score.py MA1996.1_Nr1H2_cut-15_human_ms.out MA1996.1_Nr1H2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0593.1_FOXP2.mat -c -9975 | sort -s -k1,1 -k2,2n > MA0593.1_FOXP2_cut-9975_human_ms.out
python convert_score.py MA0593.1_FOXP2_cut-9975_human_ms.out MA0593.1_FOXP2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1625.1_Stat5b.mat -c -119 | sort -s -k1,1 -k2,2n > MA1625.1_Stat5b_cut-119_human_ms.out
python convert_score.py MA1625.1_Stat5b_cut-119_human_ms.out MA1625.1_Stat5b.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1961.1_PATZ1.mat -c -1025 | sort -s -k1,1 -k2,2n > MA1961.1_PATZ1_cut-1025_human_ms.out
python convert_score.py MA1961.1_PATZ1_cut-1025_human_ms.out MA1961.1_PATZ1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1101.2_BACH2.mat -c -1996 | sort -s -k1,1 -k2,2n > MA1101.2_BACH2_cut-1996_human_ms.out
python convert_score.py MA1101.2_BACH2_cut-1996_human_ms.out MA1101.2_BACH2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1988.1_Atf3.mat -c 119 | sort -s -k1,1 -k2,2n > MA1988.1_Atf3_cut119_human_ms.out
python convert_score.py MA1988.1_Atf3_cut119_human_ms.out MA1988.1_Atf3.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0612.2_EMX1.mat -c -9246 | sort -s -k1,1 -k2,2n > MA0612.2_EMX1_cut-9246_human_ms.out
python convert_score.py MA0612.2_EMX1_cut-9246_human_ms.out MA0612.2_EMX1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1618.1_Ptf1a.mat -c 41 | sort -s -k1,1 -k2,2n > MA1618.1_Ptf1a_cut41_human_ms.out
python convert_score.py MA1618.1_Ptf1a_cut41_human_ms.out MA1618.1_Ptf1a.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0604.1_Atf1.mat -c -546 | sort -s -k1,1 -k2,2n > MA0604.1_Atf1_cut-546_human_ms.out
python convert_score.py MA0604.1_Atf1_cut-546_human_ms.out MA0604.1_Atf1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0595.1_SREBF1.mat -c -19093 | sort -s -k1,1 -k2,2n > MA0595.1_SREBF1_cut-19093_human_ms.out
python convert_score.py MA0595.1_SREBF1_cut-19093_human_ms.out MA0595.1_SREBF1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0622.1_Mlxip.mat -c -19109 | sort -s -k1,1 -k2,2n > MA0622.1_Mlxip_cut-19109_human_ms.out
python convert_score.py MA0622.1_Mlxip_cut-19109_human_ms.out MA0622.1_Mlxip.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1642.1_NEUROG2.mat -c -29 | sort -s -k1,1 -k2,2n > MA1642.1_NEUROG2_cut-29_human_ms.out
python convert_score.py MA1642.1_NEUROG2_cut-29_human_ms.out MA1642.1_NEUROG2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0704.1_Lhx4.mat -c 343 | sort -s -k1,1 -k2,2n > MA0704.1_Lhx4_cut343_human_ms.out
python convert_score.py MA0704.1_Lhx4_cut343_human_ms.out MA0704.1_Lhx4.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0733.1_EGR4.mat -c -251 | sort -s -k1,1 -k2,2n > MA0733.1_EGR4_cut-251_human_ms.out
python convert_score.py MA0733.1_EGR4_cut-251_human_ms.out MA0733.1_EGR4.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0631.1_Six3.mat -c -524 | sort -s -k1,1 -k2,2n > MA0631.1_Six3_cut-524_human_ms.out
python convert_score.py MA0631.1_Six3_cut-524_human_ms.out MA0631.1_Six3.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0914.1_ISL2.mat -c 332 | sort -s -k1,1 -k2,2n > MA0914.1_ISL2_cut332_human_ms.out
python convert_score.py MA0914.1_ISL2_cut332_human_ms.out MA0914.1_ISL2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0857.1_Rarb.mat -c -4932 | sort -s -k1,1 -k2,2n > MA0857.1_Rarb_cut-4932_human_ms.out
python convert_score.py MA0857.1_Rarb_cut-4932_human_ms.out MA0857.1_Rarb.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0511.2_RUNX2.mat -c -9398 | sort -s -k1,1 -k2,2n > MA0511.2_RUNX2_cut-9398_human_ms.out
python convert_score.py MA0511.2_RUNX2_cut-9398_human_ms.out MA0511.2_RUNX2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0104.4_MYCN.mat -c -171 | sort -s -k1,1 -k2,2n > MA0104.4_MYCN_cut-171_human_ms.out
python convert_score.py MA0104.4_MYCN_cut-171_human_ms.out MA0104.4_MYCN.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0087.2_Sox5.mat -c -29 | sort -s -k1,1 -k2,2n > MA0087.2_Sox5_cut-29_human_ms.out
python convert_score.py MA0087.2_Sox5_cut-29_human_ms.out MA0087.2_Sox5.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1572.1_TGIF2LY.mat -c -23 | sort -s -k1,1 -k2,2n > MA1572.1_TGIF2LY_cut-23_human_ms.out
python convert_score.py MA1572.1_TGIF2LY_cut-23_human_ms.out MA1572.1_TGIF2LY.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0602.1_Arid5a.mat -c 213 | sort -s -k1,1 -k2,2n > MA0602.1_Arid5a_cut213_human_ms.out
python convert_score.py MA0602.1_Arid5a_cut213_human_ms.out MA0602.1_Arid5a.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0036.3_GATA2.mat -c 75 | sort -s -k1,1 -k2,2n > MA0036.3_GATA2_cut75_human_ms.out
python convert_score.py MA0036.3_GATA2_cut75_human_ms.out MA0036.3_GATA2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0160.2_NR4A2.mat -c -217 | sort -s -k1,1 -k2,2n > MA0160.2_NR4A2_cut-217_human_ms.out
python convert_score.py MA0160.2_NR4A2_cut-217_human_ms.out MA0160.2_NR4A2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0636.1_BHLHE41.mat -c -1458 | sort -s -k1,1 -k2,2n > MA0636.1_BHLHE41_cut-1458_human_ms.out
python convert_score.py MA0636.1_BHLHE41_cut-1458_human_ms.out MA0636.1_BHLHE41.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1969.1_THRA.mat -c -1151 | sort -s -k1,1 -k2,2n > MA1969.1_THRA_cut-1151_human_ms.out
python convert_score.py MA1969.1_THRA_cut-1151_human_ms.out MA1969.1_THRA.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0621.1_mix-a.mat -c -9454 | sort -s -k1,1 -k2,2n > MA0621.1_mix-a_cut-9454_human_ms.out
python convert_score.py MA0621.1_mix-a_cut-9454_human_ms.out MA0621.1_mix-a.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0051.1_IRF2.mat -c -38689 | sort -s -k1,1 -k2,2n > MA0051.1_IRF2_cut-38689_human_ms.out
python convert_score.py MA0051.1_IRF2_cut-38689_human_ms.out MA0051.1_IRF2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0505.2_Nr5A2.mat -c -149 | sort -s -k1,1 -k2,2n > MA0505.2_Nr5A2_cut-149_human_ms.out
python convert_score.py MA0505.2_Nr5A2_cut-149_human_ms.out MA0505.2_Nr5A2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1419.1_IRF4.mat -c -2408 | sort -s -k1,1 -k2,2n > MA1419.1_IRF4_cut-2408_human_ms.out
python convert_score.py MA1419.1_IRF4_cut-2408_human_ms.out MA1419.1_IRF4.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0668.2_Neurod2.mat -c -143 | sort -s -k1,1 -k2,2n > MA0668.2_Neurod2_cut-143_human_ms.out
python convert_score.py MA0668.2_Neurod2_cut-143_human_ms.out MA0668.2_Neurod2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0823.1_HEY1.mat -c -642 | sort -s -k1,1 -k2,2n > MA0823.1_HEY1_cut-642_human_ms.out
python convert_score.py MA0823.1_HEY1_cut-642_human_ms.out MA0823.1_HEY1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1721.1_ZNF93.mat -c -546 | sort -s -k1,1 -k2,2n > MA1721.1_ZNF93_cut-546_human_ms.out
python convert_score.py MA1721.1_ZNF93_cut-546_human_ms.out MA1721.1_ZNF93.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0843.1_TEF.mat -c -651 | sort -s -k1,1 -k2,2n > MA0843.1_TEF_cut-651_human_ms.out
python convert_score.py MA0843.1_TEF_cut-651_human_ms.out MA0843.1_TEF.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0672.1_NKX2-3.mat -c -256 | sort -s -k1,1 -k2,2n > MA0672.1_NKX2-3_cut-256_human_ms.out
python convert_score.py MA0672.1_NKX2-3_cut-256_human_ms.out MA0672.1_NKX2-3.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0641.1_ELF4.mat -c -1060 | sort -s -k1,1 -k2,2n > MA0641.1_ELF4_cut-1060_human_ms.out
python convert_score.py MA0641.1_ELF4_cut-1060_human_ms.out MA0641.1_ELF4.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1731.1_ZNF768.mat -c -421 | sort -s -k1,1 -k2,2n > MA1731.1_ZNF768_cut-421_human_ms.out
python convert_score.py MA1731.1_ZNF768_cut-421_human_ms.out MA1731.1_ZNF768.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0069.1_PAX6.mat -c -112 | sort -s -k1,1 -k2,2n > MA0069.1_PAX6_cut-112_human_ms.out
python convert_score.py MA0069.1_PAX6_cut-112_human_ms.out MA0069.1_PAX6.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0882.1_DLX6.mat -c 307 | sort -s -k1,1 -k2,2n > MA0882.1_DLX6_cut307_human_ms.out
python convert_score.py MA0882.1_DLX6_cut307_human_ms.out MA0882.1_DLX6.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1717.1_ZNF784.mat -c -244 | sort -s -k1,1 -k2,2n > MA1717.1_ZNF784_cut-244_human_ms.out
python convert_score.py MA1717.1_ZNF784_cut-244_human_ms.out MA1717.1_ZNF784.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0825.1_MNT.mat -c -389 | sort -s -k1,1 -k2,2n > MA0825.1_MNT_cut-389_human_ms.out
python convert_score.py MA0825.1_MNT_cut-389_human_ms.out MA0825.1_MNT.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1987.1_ZNF701.mat -c -582 | sort -s -k1,1 -k2,2n > MA1987.1_ZNF701_cut-582_human_ms.out
python convert_score.py MA1987.1_ZNF701_cut-582_human_ms.out MA1987.1_ZNF701.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1724.1_Rfx6.mat -c 20 | sort -s -k1,1 -k2,2n > MA1724.1_Rfx6_cut20_human_ms.out
python convert_score.py MA1724.1_Rfx6_cut20_human_ms.out MA1724.1_Rfx6.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1711.1_ZNF343.mat -c -1910 | sort -s -k1,1 -k2,2n > MA1711.1_ZNF343_cut-1910_human_ms.out
python convert_score.py MA1711.1_ZNF343_cut-1910_human_ms.out MA1711.1_ZNF343.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1578.1_VEZF1.mat -c -762 | sort -s -k1,1 -k2,2n > MA1578.1_VEZF1_cut-762_human_ms.out
python convert_score.py MA1578.1_VEZF1_cut-762_human_ms.out MA1578.1_VEZF1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0848.1_FOXO4.mat -c 21 | sort -s -k1,1 -k2,2n > MA0848.1_FOXO4_cut21_human_ms.out
python convert_score.py MA0848.1_FOXO4_cut21_human_ms.out MA0848.1_FOXO4.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0030.1_FOXF2.mat -c -19108 | sort -s -k1,1 -k2,2n > MA0030.1_FOXF2_cut-19108_human_ms.out
python convert_score.py MA0030.1_FOXF2_cut-19108_human_ms.out MA0030.1_FOXF2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0804.1_TBX19.mat -c -575 | sort -s -k1,1 -k2,2n > MA0804.1_TBX19_cut-575_human_ms.out
python convert_score.py MA0804.1_TBX19_cut-575_human_ms.out MA0804.1_TBX19.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0834.1_ATF7.mat -c -1276 | sort -s -k1,1 -k2,2n > MA0834.1_ATF7_cut-1276_human_ms.out
python convert_score.py MA0834.1_ATF7_cut-1276_human_ms.out MA0834.1_ATF7.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0723.2_VAX2.mat -c 396 | sort -s -k1,1 -k2,2n > MA0723.2_VAX2_cut396_human_ms.out
python convert_score.py MA0723.2_VAX2_cut396_human_ms.out MA0723.2_VAX2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0475.2_FLI1.mat -c -746 | sort -s -k1,1 -k2,2n > MA0475.2_FLI1_cut-746_human_ms.out
python convert_score.py MA0475.2_FLI1_cut-746_human_ms.out MA0475.2_FLI1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0048.2_NHLH1.mat -c -731 | sort -s -k1,1 -k2,2n > MA0048.2_NHLH1_cut-731_human_ms.out
python convert_score.py MA0048.2_NHLH1_cut-731_human_ms.out MA0048.2_NHLH1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0091.1_TAL1::TCF3.mat -c -9874 | sort -s -k1,1 -k2,2n > MA0091.1_TAL1::TCF3_cut-9874_human_ms.out
python convert_score.py MA0091.1_TAL1::TCF3_cut-9874_human_ms.out MA0091.1_TAL1::TCF3.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1584.1_ZIC5.mat -c -1909 | sort -s -k1,1 -k2,2n > MA1584.1_ZIC5_cut-1909_human_ms.out
python convert_score.py MA1584.1_ZIC5_cut-1909_human_ms.out MA1584.1_ZIC5.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0007.3_Ar.mat -c -1506 | sort -s -k1,1 -k2,2n > MA0007.3_Ar_cut-1506_human_ms.out
python convert_score.py MA0007.3_Ar_cut-1506_human_ms.out MA0007.3_Ar.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0837.2_CEBPE.mat -c -1268 | sort -s -k1,1 -k2,2n > MA0837.2_CEBPE_cut-1268_human_ms.out
python convert_score.py MA0837.2_CEBPE_cut-1268_human_ms.out MA0837.2_CEBPE.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1105.2_GRHL2.mat -c 87 | sort -s -k1,1 -k2,2n > MA1105.2_GRHL2_cut87_human_ms.out
python convert_score.py MA1105.2_GRHL2_cut87_human_ms.out MA1105.2_GRHL2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1941.1_ETV2::FIGLA.mat -c -362 | sort -s -k1,1 -k2,2n > MA1941.1_ETV2::FIGLA_cut-362_human_ms.out
python convert_score.py MA1941.1_ETV2::FIGLA_cut-362_human_ms.out MA1941.1_ETV2::FIGLA.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0092.1_Hand1::Tcf3.mat -c -245 | sort -s -k1,1 -k2,2n > MA0092.1_Hand1::Tcf3_cut-245_human_ms.out
python convert_score.py MA0092.1_Hand1::Tcf3_cut-245_human_ms.out MA0092.1_Hand1::Tcf3.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0629.1_Rhox11.mat -c -57 | sort -s -k1,1 -k2,2n > MA0629.1_Rhox11_cut-57_human_ms.out
python convert_score.py MA0629.1_Rhox11_cut-57_human_ms.out MA0629.1_Rhox11.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1607.1_Foxl2.mat -c 131 | sort -s -k1,1 -k2,2n > MA1607.1_Foxl2_cut131_human_ms.out
python convert_score.py MA1607.1_Foxl2_cut131_human_ms.out MA1607.1_Foxl2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0635.1_BARHL2.mat -c 297 | sort -s -k1,1 -k2,2n > MA0635.1_BARHL2_cut297_human_ms.out
python convert_score.py MA0635.1_BARHL2_cut297_human_ms.out MA0635.1_BARHL2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0142.1_Pou5f1::Sox2.mat -c -104 | sort -s -k1,1 -k2,2n > MA0142.1_Pou5f1::Sox2_cut-104_human_ms.out
python convert_score.py MA0142.1_Pou5f1::Sox2_cut-104_human_ms.out MA0142.1_Pou5f1::Sox2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0002.2_Runx1.mat -c 47 | sort -s -k1,1 -k2,2n > MA0002.2_Runx1_cut47_human_ms.out
python convert_score.py MA0002.2_Runx1_cut47_human_ms.out MA0002.2_Runx1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0059.1_MAX::MYC.mat -c -9789 | sort -s -k1,1 -k2,2n > MA0059.1_MAX::MYC_cut-9789_human_ms.out
python convert_score.py MA0059.1_MAX::MYC_cut-9789_human_ms.out MA0059.1_MAX::MYC.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0845.1_FOXB1.mat -c 64 | sort -s -k1,1 -k2,2n > MA0845.1_FOXB1_cut64_human_ms.out
python convert_score.py MA0845.1_FOXB1_cut64_human_ms.out MA0845.1_FOXB1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0151.1_Arid3a.mat -c -9216 | sort -s -k1,1 -k2,2n > MA0151.1_Arid3a_cut-9216_human_ms.out
python convert_score.py MA0151.1_Arid3a_cut-9216_human_ms.out MA0151.1_Arid3a.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0869.2_Sox11.mat -c 6 | sort -s -k1,1 -k2,2n > MA0869.2_Sox11_cut6_human_ms.out
python convert_score.py MA0869.2_Sox11_cut6_human_ms.out MA0869.2_Sox11.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0902.2_HOXB2.mat -c -9205 | sort -s -k1,1 -k2,2n > MA0902.2_HOXB2_cut-9205_human_ms.out
python convert_score.py MA0902.2_HOXB2_cut-9205_human_ms.out MA0902.2_HOXB2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0625.2_NFATC3.mat -c 124 | sort -s -k1,1 -k2,2n > MA0625.2_NFATC3_cut124_human_ms.out
python convert_score.py MA0625.2_NFATC3_cut124_human_ms.out MA0625.2_NFATC3.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0755.1_CUX2.mat -c -24 | sort -s -k1,1 -k2,2n > MA0755.1_CUX2_cut-24_human_ms.out
python convert_score.py MA0755.1_CUX2_cut-24_human_ms.out MA0755.1_CUX2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0528.2_ZNF263.mat -c -78 | sort -s -k1,1 -k2,2n > MA0528.2_ZNF263_cut-78_human_ms.out
python convert_score.py MA0528.2_ZNF263_cut-78_human_ms.out MA0528.2_ZNF263.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0827.1_OLIG3.mat -c -28 | sort -s -k1,1 -k2,2n > MA0827.1_OLIG3_cut-28_human_ms.out
python convert_score.py MA0827.1_OLIG3_cut-28_human_ms.out MA0827.1_OLIG3.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1640.1_MEIS2.mat -c 108 | sort -s -k1,1 -k2,2n > MA1640.1_MEIS2_cut108_human_ms.out
python convert_score.py MA1640.1_MEIS2_cut108_human_ms.out MA1640.1_MEIS2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0632.2_TCFL5.mat -c -611 | sort -s -k1,1 -k2,2n > MA0632.2_TCFL5_cut-611_human_ms.out
python convert_score.py MA0632.2_TCFL5_cut-611_human_ms.out MA0632.2_TCFL5.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1971.1_ZBED2.mat -c 24 | sort -s -k1,1 -k2,2n > MA1971.1_ZBED2_cut24_human_ms.out
python convert_score.py MA1971.1_ZBED2_cut24_human_ms.out MA1971.1_ZBED2.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1132.1_JUN::JUNB.mat -c 190 | sort -s -k1,1 -k2,2n > MA1132.1_JUN::JUNB_cut190_human_ms.out
python convert_score.py MA1132.1_JUN::JUNB_cut190_human_ms.out MA1132.1_JUN::JUNB.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0610.1_DMRT3.mat -c -9364 | sort -s -k1,1 -k2,2n > MA0610.1_DMRT3_cut-9364_human_ms.out
python convert_score.py MA0610.1_DMRT3_cut-9364_human_ms.out MA0610.1_DMRT3.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1593.1_ZNF317.mat -c 29 | sort -s -k1,1 -k2,2n > MA1593.1_ZNF317_cut29_human_ms.out
python convert_score.py MA1593.1_ZNF317_cut29_human_ms.out MA1593.1_ZNF317.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0803.1_TBX15.mat -c -419 | sort -s -k1,1 -k2,2n > MA0803.1_TBX15_cut-419_human_ms.out
python convert_score.py MA0803.1_TBX15_cut-419_human_ms.out MA0803.1_TBX15.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1544.1_OVOL1.mat -c -10565 | sort -s -k1,1 -k2,2n > MA1544.1_OVOL1_cut-10565_human_ms.out
python convert_score.py MA1544.1_OVOL1_cut-10565_human_ms.out MA1544.1_OVOL1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1541.1_NR6A1.mat -c -313 | sort -s -k1,1 -k2,2n > MA1541.1_NR6A1_cut-313_human_ms.out
python convert_score.py MA1541.1_NR6A1_cut-313_human_ms.out MA1541.1_NR6A1.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0019.1_Ddit3::Cebpa.mat -c -285 | sort -s -k1,1 -k2,2n > MA0019.1_Ddit3::Cebpa_cut-285_human_ms.out
python convert_score.py MA0019.1_Ddit3::Cebpa_cut-285_human_ms.out MA0019.1_Ddit3::Cebpa.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA0159.1_RARA::RXRA.mat -c -9823 | sort -s -k1,1 -k2,2n > MA0159.1_RARA::RXRA_cut-9823_human_ms.out
python convert_score.py MA0159.1_RARA::RXRA_cut-9823_human_ms.out MA0159.1_RARA::RXRA.mat.scoretab.out
cat ../human.fasta | ./matrix_scan -m MA1515.1_KLF2.mat -c -7 | sort -s -k1,1 -k2,2n > MA1515.1_KLF2_cut-7_human_ms.out
python convert_score.py MA1515.1_KLF2_cut-7_human_ms.out MA1515.1_KLF2.mat.scoretab.out
