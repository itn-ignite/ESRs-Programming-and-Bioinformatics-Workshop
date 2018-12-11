#!/bin/bash
#
#SBATCH --job-name=QUACANONT
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=48:00:00
#SBATCH --mem=55000
#SBATCH --err=10a_cgat_quast_canu_ont_ref.err


source activate /naslx/projects/pn69xe/di52zuy/ignite_tools_py3/

quast.py \
# specify reference assembly from NCBI
-r Cryptococcus_gattii_VGII_R265_WGS_GCA_002954075.1.fasta \
# specify output dir with -o
-o 10a_cgat_quast_canu_ont_ref \
# specify short reads
-1 cgat_hiseq_SRR1513844_1.trimmed.filteredq25.fastq.gz \
-2 cgat_hiseq_SRR1513844_2.trimmed.filteredq25.fastq.gz \
# pre-produced mapping bam file of illumina reads to the refercne genome assembly
--ref-bam Cryptococcus_gattii_VGII_R265_WGS_GCA_002954075.1_hisat2_mapped_sorted_SRR1513844.bam \
# pre-produced mapping bam file of illumina reads to our assembly of interest (canu ont pilon)
--bam cgat_canu_ont_assembly.contigs_hisat2_mapped_sorted_SRR1513844_pilon.bam \
# specify nanopore reads that will be mapped by quast
--nanopore cgat_ont_SRR6363418.porechopped_1kb.fastq.gz \
# specify nanopore reads that will be mapped by quast
--pacbio cgat_pacbio_SRR5891540_1kb.fastq.gz \
# number of threads/cores
-t 28 \
# specify the fasta of the genome of interest
cgat_canu_ont_assembly.contigs_pilon.fasta


source deactivate /naslx/projects/pn69xe/di52zuy/ignite_tools_py3/

