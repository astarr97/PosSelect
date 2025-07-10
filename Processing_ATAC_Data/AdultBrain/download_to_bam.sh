#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH -p normal,owners,hbfraser
#SBATCH --mem=32GB

wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ACBGM.bedpe.gz
gunzip ACBGM.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ACBGM.bedpe > ACBGM.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/AMY.bedpe.gz
gunzip AMY.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i AMY.bedpe > AMY.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ASCNT_1.bedpe.gz
gunzip ASCNT_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ASCNT_1.bedpe > ASCNT_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ASCNT_2.bedpe.gz
gunzip ASCNT_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ASCNT_2.bedpe > ASCNT_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ASCNT_3.bedpe.gz
gunzip ASCNT_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ASCNT_3.bedpe > ASCNT_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ASCT_1.bedpe.gz
gunzip ASCT_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ASCT_1.bedpe > ASCT_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ASCT_2.bedpe.gz
gunzip ASCT_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ASCT_2.bedpe > ASCT_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ASCT_3.bedpe.gz
gunzip ASCT_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ASCT_3.bedpe > ASCT_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/BFEXA.bedpe.gz
gunzip BFEXA.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i BFEXA.bedpe > BFEXA.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/BNGA.bedpe.gz
gunzip BNGA.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i BNGA.bedpe > BNGA.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/CBGRC.bedpe.gz
gunzip CBGRC.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i CBGRC.bedpe > CBGRC.bam
#wget http://catlas.org/catlas_downloads/humanbrain/bedpe/CBINH.bedpe.gz
#gunzip CBINH.bedpe.gz
#bedtools bedpetobam -g ChromSizes.txt -i CBINH.bedpe > CBINH.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/CHO.bedpe.gz
gunzip CHO.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i CHO.bedpe > CHO.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/CNGA_1.bedpe.gz
gunzip CNGA_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i CNGA_1.bedpe > CNGA_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/CNGA_2.bedpe.gz
gunzip CNGA_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i CNGA_2.bedpe > CNGA_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/CNMIX.bedpe.gz
gunzip CNMIX.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i CNMIX.bedpe > CNMIX.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/COP.bedpe.gz
gunzip COP.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i COP.bedpe > COP.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/CTXGA.bedpe.gz
gunzip CTXGA.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i CTXGA.bedpe > CTXGA.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/CT_1.bedpe.gz
gunzip CT_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i CT_1.bedpe > CT_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/CT_2.bedpe.gz
gunzip CT_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i CT_2.bedpe > CT_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/D1CaB.bedpe.gz
gunzip D1CaB.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i D1CaB.bedpe > D1CaB.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/D1Pu.bedpe.gz
gunzip D1Pu.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i D1Pu.bedpe > D1Pu.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/D2CaB.bedpe.gz
gunzip D2CaB.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i D2CaB.bedpe > D2CaB.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/D2Pu.bedpe.gz
gunzip D2Pu.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i D2Pu.bedpe > D2Pu.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/D12NAC.bedpe.gz
gunzip D12NAC.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i D12NAC.bedpe > D12NAC.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/EC.bedpe.gz
gunzip EC.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i EC.bedpe > EC.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ERC_1.bedpe.gz
gunzip ERC_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ERC_1.bedpe > ERC_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ERC_2.bedpe.gz
gunzip ERC_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ERC_2.bedpe > ERC_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ET.bedpe.gz
gunzip ET.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ET.bedpe > ET.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/FOXP2_1.bedpe.gz
gunzip FOXP2_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i FOXP2_1.bedpe > FOXP2_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/FOXP2_2.bedpe.gz
gunzip FOXP2_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i FOXP2_2.bedpe > FOXP2_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/FOXP2_3.bedpe.gz
gunzip FOXP2_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i FOXP2_3.bedpe > FOXP2_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/FOXP2_4.bedpe.gz
gunzip FOXP2_4.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i FOXP2_4.bedpe > FOXP2_4.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ICGA_1.bedpe.gz
gunzip ICGA_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ICGA_1.bedpe > ICGA_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ICGA_2.bedpe.gz
gunzip ICGA_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ICGA_2.bedpe > ICGA_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL4_1.bedpe.gz
gunzip ITL4_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL4_1.bedpe > ITL4_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL4_2.bedpe.gz
gunzip ITL4_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL4_2.bedpe > ITL4_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL5_1.bedpe.gz
gunzip ITL5_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL5_1.bedpe > ITL5_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL5_2.bedpe.gz
gunzip ITL5_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL5_2.bedpe > ITL5_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL5_3.bedpe.gz
gunzip ITL5_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL5_3.bedpe > ITL5_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL5_4.bedpe.gz
gunzip ITL5_4.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL5_4.bedpe > ITL5_4.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL6_1_1.bedpe.gz
gunzip ITL6_1_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL6_1_1.bedpe > ITL6_1_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL6_1_2.bedpe.gz
gunzip ITL6_1_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL6_1_2.bedpe > ITL6_1_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL6_2_1.bedpe.gz
gunzip ITL6_2_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL6_2_1.bedpe > ITL6_2_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL6_2_2.bedpe.gz
gunzip ITL6_2_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL6_2_2.bedpe > ITL6_2_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL23_1.bedpe.gz
gunzip ITL23_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL23_1.bedpe > ITL23_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL23_2.bedpe.gz
gunzip ITL23_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL23_2.bedpe > ITL23_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL23_3.bedpe.gz
gunzip ITL23_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL23_3.bedpe > ITL23_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL23_4.bedpe.gz
gunzip ITL23_4.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL23_4.bedpe > ITL23_4.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL23_5.bedpe.gz
gunzip ITL23_5.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL23_5.bedpe > ITL23_5.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL23_6.bedpe.gz
gunzip ITL23_6.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL23_6.bedpe > ITL23_6.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL34.bedpe.gz
gunzip ITL34.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL34.bedpe > ITL34.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL45_1.bedpe.gz
gunzip ITL45_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL45_1.bedpe > ITL45_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITL45_2.bedpe.gz
gunzip ITL45_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITL45_2.bedpe > ITL45_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITV1C_1.bedpe.gz
gunzip ITV1C_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITV1C_1.bedpe > ITV1C_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITV1C_2.bedpe.gz
gunzip ITV1C_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITV1C_2.bedpe > ITV1C_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/ITV1C_3.bedpe.gz
gunzip ITV1C_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i ITV1C_3.bedpe > ITV1C_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/L6B_1.bedpe.gz
gunzip L6B_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i L6B_1.bedpe > L6B_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/L6B_2.bedpe.gz
gunzip L6B_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i L6B_2.bedpe > L6B_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/LAMP5_1.bedpe.gz
gunzip LAMP5_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i LAMP5_1.bedpe > LAMP5_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/LAMP5_2.bedpe.gz
gunzip LAMP5_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i LAMP5_2.bedpe > LAMP5_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/MDGA.bedpe.gz
gunzip MDGA.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i MDGA.bedpe > MDGA.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/MGC_1.bedpe.gz
gunzip MGC_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i MGC_1.bedpe > MGC_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/MGC_2.bedpe.gz
gunzip MGC_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i MGC_2.bedpe > MGC_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/MSN_1.bedpe.gz
gunzip MSN_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i MSN_1.bedpe > MSN_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/MSN_2.bedpe.gz
gunzip MSN_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i MSN_2.bedpe > MSN_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/MSN_3.bedpe.gz
gunzip MSN_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i MSN_3.bedpe > MSN_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/NP_1.bedpe.gz
gunzip NP_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i NP_1.bedpe > NP_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/NP_2.bedpe.gz
gunzip NP_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i NP_2.bedpe > NP_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/NP_3.bedpe.gz
gunzip NP_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i NP_3.bedpe > NP_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/OGC_1.bedpe.gz
gunzip OGC_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i OGC_1.bedpe > OGC_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/OGC_2.bedpe.gz
gunzip OGC_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i OGC_2.bedpe > OGC_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/OGC_3.bedpe.gz
gunzip OGC_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i OGC_3.bedpe > OGC_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/OPC.bedpe.gz
gunzip OPC.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i OPC.bedpe > OPC.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/PER.bedpe.gz
gunzip PER.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i PER.bedpe > PER.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/PIR.bedpe.gz
gunzip PIR.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i PIR.bedpe > PIR.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/PKJ_1.bedpe.gz
gunzip PKJ_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i PKJ_1.bedpe > PKJ_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/PKJ_2.bedpe.gz
gunzip PKJ_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i PKJ_2.bedpe > PKJ_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/PVALB_1.bedpe.gz
gunzip PVALB_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i PVALB_1.bedpe > PVALB_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/PVALB_2.bedpe.gz
gunzip PVALB_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i PVALB_2.bedpe > PVALB_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/PVALB_3.bedpe.gz
gunzip PVALB_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i PVALB_3.bedpe > PVALB_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/PVALB_4.bedpe.gz
gunzip PVALB_4.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i PVALB_4.bedpe > PVALB_4.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/PV_ChCs.bedpe.gz
gunzip PV_ChCs.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i PV_ChCs.bedpe > PV_ChCs.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SEPGA.bedpe.gz
gunzip SEPGA.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SEPGA.bedpe > SEPGA.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SIGA.bedpe.gz
gunzip SIGA.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SIGA.bedpe > SIGA.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SMC.bedpe.gz
gunzip SMC.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SMC.bedpe > SMC.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SNCG_1.bedpe.gz
gunzip SNCG_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SNCG_1.bedpe > SNCG_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SNCG_2.bedpe.gz
gunzip SNCG_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SNCG_2.bedpe > SNCG_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SNCG_3.bedpe.gz
gunzip SNCG_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SNCG_3.bedpe > SNCG_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SNCG_4.bedpe.gz
gunzip SNCG_4.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SNCG_4.bedpe > SNCG_4.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SNCG_5.bedpe.gz
gunzip SNCG_5.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SNCG_5.bedpe > SNCG_5.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SST_1.bedpe.gz
gunzip SST_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SST_1.bedpe > SST_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SST_2.bedpe.gz
gunzip SST_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SST_2.bedpe > SST_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SST_3.bedpe.gz
gunzip SST_3.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SST_3.bedpe > SST_3.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SST_4.bedpe.gz
gunzip SST_4.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SST_4.bedpe > SST_4.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SST_5.bedpe.gz
gunzip SST_5.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SST_5.bedpe > SST_5.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SST_CHODL.bedpe.gz
gunzip SST_CHODL.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SST_CHODL.bedpe > SST_CHODL.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/SUB.bedpe.gz
gunzip SUB.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i SUB.bedpe > SUB.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/THMGA_1.bedpe.gz
gunzip THMGA_1.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i THMGA_1.bedpe > THMGA_1.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/THMGA_2.bedpe.gz
gunzip THMGA_2.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i THMGA_2.bedpe > THMGA_2.bam
wget http://catlas.org/catlas_downloads/humanbrain/bedpe/TP.bedpe.gz
gunzip TP.bedpe.gz
bedtools bedpetobam -g ChromSizes.txt -i TP.bedpe > TP.bam
#wget http://catlas.org/catlas_downloads/humanbrain/bedpe/VIP_1.bedpe.gz
#gunzip VIP_1.bedpe.gz
#bedtools bedpetobam -g ChromSizes.txt -i VIP_1.bedpe > VIP_1.bam
#wget http://catlas.org/catlas_downloads/humanbrain/bedpe/VIP_2.bedpe.gz
#gunzip VIP_2.bedpe.gz
#bedtools bedpetobam -g ChromSizes.txt -i VIP_2.bedpe > VIP_2.bam
#wget http://catlas.org/catlas_downloads/humanbrain/bedpe/VIP_3.bedpe.gz
#gunzip VIP_3.bedpe.gz
#bedtools bedpetobam -g ChromSizes.txt -i VIP_3.bedpe > VIP_3.bam
#wget http://catlas.org/catlas_downloads/humanbrain/bedpe/VIP_4.bedpe.gz
#gunzip VIP_4.bedpe.gz
#bedtools bedpetobam -g ChromSizes.txt -i VIP_4.bedpe > VIP_4.bam
#wget http://catlas.org/catlas_downloads/humanbrain/bedpe/VIP_5.bedpe.gz
#gunzip VIP_5.bedpe.gz
#bedtools bedpetobam -g ChromSizes.txt -i VIP_5.bedpe > VIP_5.bam
#wget http://catlas.org/catlas_downloads/humanbrain/bedpe/VIP_6.bedpe.gz
#gunzip VIP_6.bedpe.gz
#bedtools bedpetobam -g ChromSizes.txt -i VIP_6.bedpe > VIP_6.bam
#wget http://catlas.org/catlas_downloads/humanbrain/bedpe/VIP_7.bedpe.gz
#gunzip VIP_7.bedpe.gz
#bedtools bedpetobam -g ChromSizes.txt -i VIP_7.bedpe > VIP_7.bam
