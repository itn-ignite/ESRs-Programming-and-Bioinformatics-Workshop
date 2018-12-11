#!/bin/bash
#
#SBATCH --job-name=porechop
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=4:00:00
#SBATCH --mem=50000
#SBATCH --err=03b_cgat_raw_read_processing_ont_SRR6363418.err


source activate /naslx/projects/pn69xe/di52zuy/ignite_tools_py2/


# chop off adaptors with PORECHOP
/naslx/projects/pn69xe/di29vos2/IGNITE/tools/Porechop/porechop-runner.py \
-i cgat_ont_SRR6363418.fastq.gz -t 28 2> cgat_ont_SRR6363418.porechop.log | gzip > cgat_ont_SRR6363418.porechopped.fastq.gz 

# filter ont reads to keep only >1kb reads:
gunzip -c cgat_ont_SRR6363418.porechopped.fastq.gz | sizecutter.py -n -a 1000 -i fastq -o fastq -p - 2> cgat_ont_SRR6363418.porechopped_1kb.fastq.stats \
| gzip > cgat_ont_SRR6363418.porechopped_1kb.fastq.gz


# convert fastq to fasta file (used later for masurca assembly):
gunzip -c cgat_ont_SRR6363418.porechopped_1kb.fastq.gz | sizecutter.py -i fastq -o fasta -p - > cgat_ont_SRR6363418.porechopped_1kb.fasta


source deactivate /naslx/projects/pn69xe/di52zuy/ignite_tools_py2/