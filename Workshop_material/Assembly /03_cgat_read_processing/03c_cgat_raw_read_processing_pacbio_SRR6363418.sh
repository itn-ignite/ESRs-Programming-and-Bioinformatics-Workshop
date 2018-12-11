#!/bin/bash
#
#SBATCH --job-name=processing
#SBATCH --ntasks=1
#SBATCH --reservation=IGNITE
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=m.eitel@lmu.de
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=4:00:00
#SBATCH --mem=50000
#SBATCH --err=03c_cgat_raw_read_processing_pacbio_SRR6363418.err

source activate /naslx/projects/pn69xe/di52zuy/ignite_tools_py2/


# filter pacbio reads to keep only >1kb reads:
gunzip -c cgat_pacbio_SRR5891540.fastq.gz | sizecutter.py -n -a 1000 -i fastq -o fastq -p - \
2> cgat_pacbio_SRR5891540.porechopped_1kb.fastq.stats | gzip > cgat_pacbio_SRR5891540_1kb.fastq.gz

# convert fastq to fasta file (used later for masurca assembly):
gunzip -c cgat_pacbio_SRR5891540_1kb.fastq.gz | sizecutter.py -i fastq -o fasta -p - > cgat_pacbio_SRR5891540_1kb.fasta



source deactivate /naslx/projects/pn69xe/di52zuy/ignite_tools_py2/