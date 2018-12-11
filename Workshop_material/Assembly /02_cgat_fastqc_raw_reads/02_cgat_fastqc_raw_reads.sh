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
#SBATCH --mem=55000
#SBATCH --err=02_fastqc.err



# FASTQC on raw illumina reads
for FILE in cgat_hiseq_SRR1513844_*.fastq.gz; do fastqc -f fastq -o -t 28 $FILE ; done


