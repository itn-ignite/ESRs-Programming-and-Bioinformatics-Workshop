#!/bin/bash
#
#SBATCH --job-name=PROCESS
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=8:00:00
#SBATCH --mem=55000
#SBATCH --err=03a_cgat_raw_read_processing_hiseq_SRR1513844.err


# header renaming:
gunzip -c cgat_hiseq_SRR1513844_1.fastq.gz > cgat_hiseq_SRR1513844_1.fastq
gunzip -c cgat_hiseq_SRR1513844_2.fastq.gz > cgat_hiseq_SRR1513844_2.fastq



# : low quality end & adapter trimming:
trimmomatic PE -threads 28 -phred33 \
cgat_hiseq_SRR1513844_1.fastq \
cgat_hiseq_SRR1513844_2.fastq \
cgat_hiseq_SRR1513844_1.trimmed.fastq \
cgat_hiseq_SRR1513844_1.trimmed.singleton.fastq \
cgat_hiseq_SRR1513844_2.trimmed.fastq \
cgat_hiseq_SRR1513844_2.trimmed.singleton.fastq \
ILLUMINACLIP:/naslx/projects/pn69xe/di29vos2/IGNITE/01_cgat_raw_reads/illumina/adapters/TruSeq3-PE-2.fa:3:30:10 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:6:20 \
MINLEN:50 \
2> cgat_hiseq_SRR1513844_trimmomatic.log


##available adpater sets in TRIMMOMATIC:
##NexteraPE-PE.fa
##TruSeq2-PE.fa
##TruSeq2-SE.fa
##TruSeq3-PE-2.fa
##TruSeq3-PE.fa
##TruSeq3-SE.fa



# BIOLITE: low quality filtering:
bl-filter-illumina -a -b -q 20 -t 33 \
-i cgat_hiseq_SRR1513844_1.trimmed.fastq \
-i cgat_hiseq_SRR1513844_2.trimmed.fastq \
-o cgat_hiseq_SRR1513844_1.trimmed.filteredq25.fastq \
-o cgat_hiseq_SRR1513844_2.trimmed.filteredq25.fastq \
2> cgat_hiseq_SRR1513844_trimmomatic_filtering.log

rm *singleton*
gzip *trimmed.fastq
gzip *.filteredq25.fastq
gzip cgat_hiseq_SRR1513844_1.fastq
gzip cgat_hiseq_SRR1513844_2.fastq



