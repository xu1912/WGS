 #!/bin/bash
 samtools mpileup -q20 -Iugf /DataStorage2/Shares/ref/human.g1k.v37.fa M11030/M11030.final.bam | bcftools call -vmO z -o /DataStorage2/cqiu/M11030.vcf.gz
 
 bcftools filter -O z -o M01700_filtered.vcf -i '%TYPE="snp" && %QUAL>=20 && MQ>=20' M01700/M01700.vcf
 tabix -p vcf M01700_filtered.vcf.gz
 bcftools merge -O v -o merge.vcf M01700_filtered.vcf.gz M01701_2_filtered.vcf.gz
