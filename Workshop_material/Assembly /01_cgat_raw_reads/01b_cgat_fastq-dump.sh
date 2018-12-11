#!/bin/bash

# PacBio
fastq-dump --accession SRR5891540 --gzip --minReadLen 1000 --outdir /home/meitel/data/IGNITE/data/Cryptococcus_gattii/pacbio

# Oxford Nanopore
# fastq-dump not woorking on SRR6363418:
wget https://sra-download.ncbi.nlm.nih.gov/traces/sra58/SRR/006214/SRR6363418
vdb-dump -f fastq SRR6363418 > cgat_ont_SRR6363418.fastq
sizecutter.py -n -a 1000 -i fastq -o fastq -p cgat_ont_SRR6363418.fastq 2> cgat_ont_SRR6363418.fastq.stats | gzip > cgat_ont_SRR6363418.fastq.gz
rm SRR6363418
rm cgat_ont_SRR6363418.fastq

# Illumina
## HiSeq
fastq-dump --accession SRR5574076 --split-files --gzip --outdir /home/meitel/data/IGNITE/data/Cryptococcus_gattii/illumina/hiseq
fastq-dump --accession SRR1513844 --split-files --gzip --outdir /home/meitel/data/IGNITE/data/Cryptococcus_gattii/illumina/hiseq
fastq-dump --accession SRR643936 --split-files --gzip --outdir /home/meitel/data/IGNITE/data/Cryptococcus_gattii/illumina/hiseq


