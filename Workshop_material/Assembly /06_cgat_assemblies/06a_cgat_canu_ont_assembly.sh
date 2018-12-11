#!/bin/bash
#
#SBATCH --job-name=CANUONT
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=24:00:00
#SBATCH --mem=55000
#SBATCH --err=06a_cgat_canu_ont_assembly.err


canu -p cgat_canu_ont_assembly -d 06a_cgat_canu_ont_assembly \
maxMemory=55 \
maxThreads=28 \
genomeSize=17m \
minOverlapLength=1000 \
correctedErrorRate=0.12 \
corOutCoverage=100 \
gridOptions="--mem-per-cpu=4g --cpus-per-task=4" useGrid=false \
corOvlErrorRate=0.15 \
corMinCoverage=4 \
obtErrorRate=0.15 \
-nanopore-raw cgat_ont_SRR6363418.porechopped_1kb.fastq.gz

