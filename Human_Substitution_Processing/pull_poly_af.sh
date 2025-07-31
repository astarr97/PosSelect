#Pull things with the right allele frequency (> 0.001) in at least one population, greater than 5 counts chromsome by chromosome
bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chrY.vcf.bgz" > "./gnomad_extract_chrY_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr1.vcf.bgz" > "./gnomad_extract_chr1_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr2.vcf.bgz" > "./gnomad_extract_chr2_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr3.vcf.bgz" > "./gnomad_extract_chr3_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr4.vcf.bgz" > "./gnomad_extract_chr4_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr5.vcf.bgz" > "./gnomad_extract_chr5_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr6.vcf.bgz" > "./gnomad_extract_chr6_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr7.vcf.bgz" > "./gnomad_extract_chr7_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr8.vcf.bgz" > "./gnomad_extract_chr8_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr9.vcf.bgz" > "./gnomad_extract_chr9_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr10.vcf.bgz" > "./gnomad_extract_chr10_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr11.vcf.bgz" > "./gnomad_extract_chr11_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr12.vcf.bgz" > "./gnomad_extract_chr12_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr13.vcf.bgz" > "./gnomad_extract_chr13_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr14.vcf.bgz" > "./gnomad_extract_chr14_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr15.vcf.bgz" > "./gnomad_extract_chr15_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr16.vcf.bgz" > "./gnomad_extract_chr16_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr17.vcf.bgz" > "./gnomad_extract_chr17_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr18.vcf.bgz" > "./gnomad_extract_chr18_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr19.vcf.bgz" > "./gnomad_extract_chr19_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr20.vcf.bgz" > "./gnomad_extract_chr20_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr21.vcf.bgz" > "./gnomad_extract_chr21_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chr22.vcf.bgz" > "./gnomad_extract_chr22_full_0.001.txt"

bcftools query -f 'chr%CHROM\t%POS\t%ID\t%REF\t%ALT\t%QUAL\t%FILTER\t%AF\t%AF_afr\t%AF_amr\t%AF_asj\t%AF_eas\t%AF_fin\t%AF_nfe\t%AF_oth\t%vep\t\n' -i 'FILTER="PASS" & TYPE="snp" & (AF_afr>0.001 | AF_amr>0.001 | AF_asj>0.001 | AF_eas>0.001 | AF_fin>0.001 | AF_nfe>0.001 | AF_oth>0.001) & AC>5' "./gnomad.genomes.v3.1.2.sites.chrX.vcf.bgz" > "./gnomad_extract_chrX_full_0.001.txt"
