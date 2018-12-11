#!/bin/bash
#
#SBATCH --job-name=CANUPAC
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=48:00:00
#SBATCH --mem=55000
#SBATCH --err=06b_cgat_canu_pacbio_assembly.err

canu -p cgat_canu_pacbio_assembly -d 06b_cgat_canu_pacbio_assembly \
maxMemory=55 \
maxThreads=28 \
genomeSize=17m \
minOverlapLength=1000 \
correctedErrorRate=0.12 \
corOutCoverage=100 \
gridOptions="--mem-per-cpu=4g --cpus-per-task=4" useGrid=false \
corOvlErrorRate=0.12 \
corMinCoverage=4 \
corMhapSensitivity=high \
-pacbio-raw cgat_pacbio_SRR5891540_1kb.fastq.gz


