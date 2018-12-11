#!/bin/bash
#
#SBATCH --job-name=SPAHISEQ
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --err=06g_cgat_spades_hiseq_assembly.err
#SBATCH --time=24:00:00
#SBATCH --mem=55000
#SBATCH --err=06g_cgat_spades_hiseq_assembly.err

spades.py -t 28 -m 55 \
-o 06g_cgat_spades_hiseq_assembly \
-1 cgat_hiseq_SRR1513844_1.trimmed.filteredq25.fastq.gz \
-2 cgat_hiseq_SRR1513844_2.trimmed.filteredq25.fastq.gz \
--careful