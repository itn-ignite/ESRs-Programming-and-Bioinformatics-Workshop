#!/bin/bash
#
#SBATCH --job-name=MININANO
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=24:00:00
#SBATCH --mem=55000
#SBATCH --err=06c_cgat_miniasm_ont_assembly.err


# All-against-all overlap with minimap2 -t 28:
minimap2 -t 28 -x ava-ont cgat_ont_SRR6363418.porechopped_1kb.fastq.gz cgat_ont_SRR6363418.porechopped_1kb.fastq.gz 2> cgat_ont_minimap2.log | gzip -1 > cgat_ont_minimap2.paf.gz


# Assembly with miniasm:
miniasm -f cgat_ont_SRR6363418.porechopped_1kb.fastq.gz cgat_ont_minimap2.paf.gz > cgat_ont_miniasm_raw_assembly.gfa 2> cgat_ont_miniasm_raw_assembly.log


# convert GFA file into fasta:
awk '/^S/{print ">"$2"\n"$3}' cgat_ont_miniasm_raw_assembly.gfa | fold > cgat_ont_miniasm_raw_assembly.fasta


# Correction with minimap2 -t 28 & racon, round 1:
minimap2 -t 28 cgat_ont_miniasm_raw_assembly.fasta cgat_ont_SRR6363418.porechopped_1kb.fastq.gz > cgat_ont_miniasm_raw_assembly.reads_mapped_round1.paf 2> cgat_ont_miniasm_raw_assembly.reads_mapped_round1.log
racon -t 28 cgat_ont_SRR6363418.porechopped_1kb.fastq.gz cgat_ont_miniasm_raw_assembly.reads_mapped_round1.paf cgat_ont_miniasm_raw_assembly.fasta > cgat_ont_miniasm_racon_assembly_1.fasta 2> cgat_ont_miniasm_racon_assembly_1.log

# Correction with minimap2 -t 28 & racon, round 2:
minimap2 -t 28 cgat_ont_miniasm_racon_assembly_1.fasta cgat_ont_SRR6363418.porechopped_1kb.fastq.gz > cgat_ont_miniasm_raw_assembly.reads_mapped_round2.paf 2> cgat_ont_miniasm_raw_assembly.reads_mapped_round2.log
racon -t 28 cgat_ont_SRR6363418.porechopped_1kb.fastq.gz cgat_ont_miniasm_raw_assembly.reads_mapped_round2.paf cgat_ont_miniasm_racon_assembly_1.fasta > cgat_ont_miniasm_racon_assembly_2.fasta 2> cgat_ont_miniasm_racon_assembly_2.log


