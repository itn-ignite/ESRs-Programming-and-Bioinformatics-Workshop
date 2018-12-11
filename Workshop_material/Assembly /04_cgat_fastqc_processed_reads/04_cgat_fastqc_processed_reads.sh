#!/bin/bash
#
#SBATCH --job-name=fastqc
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=4:00:00
#SBATCH --mem=40000
#SBATCH --err=04_cgat_fastqc_processed_reads.err


# FASTQC on raw illumina reads
for FILE in *trimmed.filteredq25.fastq.gz; do fastqc -f fastq -t 28 $FILE ; done


