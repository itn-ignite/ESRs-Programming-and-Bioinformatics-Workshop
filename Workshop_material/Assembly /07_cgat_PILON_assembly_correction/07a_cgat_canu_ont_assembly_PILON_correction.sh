#!/bin/bash
#
#SBATCH --job-name=PILCANONT
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=48:00:00
#SBATCH --err=07a_cgat_canu_ont_assembly_PILON_correction.err
#SBATCH --mem=55000





## ROUND 1 PILON CORRECTION using SRR1513844 processed reads:

# hisat read mapping mapping:
hisat2-build cgat_canu_ont_assembly.contigs.fasta cgat_canu_ont_assembly.contigs

hisat2 -q --no-mixed --no-unal --threads 28 \
--summary-file cgat_canu_ont_assembly.contigs_hisat2_DNA_alignments_summary_SRR1513844.log \
-x cgat_canu_ont_assembly.contigs \
-1 cgat_hiseq_SRR1513844_1.trimmed.filteredq25.fastq.gz \
-2 cgat_hiseq_SRR1513844_2.trimmed.filteredq25.fastq.gz \
| samtools view -F 4 -T cgat_canu_ont_assembly.contigs.fasta -Sb - | samtools sort -@ 28 > cgat_canu_ont_assembly.contigs_hisat2_mapped_sorted_SRR1513844.bam

# pilon correction:
samtools index cgat_canu_ont_assembly.contigs_hisat2_mapped_sorted_SRR1513844.bam
java -jar /naslx/projects/pn69xe/di52zuy/ignite_tools_py3/bin/pilon-1.23.jar --genome cgat_canu_ont_assembly.contigs.fasta --frags cgat_canu_ont_assembly.contigs_hisat2_mapped_sorted_SRR1513844.bam --outdir /naslx/projects/pn69xe/di29vos2/IGNITE/workdir --output cgat_canu_ont_assembly.contigs_pilon --fix all --threads 24 > cgat_canu_ont_assembly.contigs_pilon.log



## final mapping of processed SRR1513844 reads to the corrected canu ont assembly :
hisat2-build cgat_canu_ont_assembly.contigs_pilon.fasta cgat_canu_ont_assembly.contigs_pilon

hisat2 -q --no-mixed --no-unal --threads 28 \
--summary-file cgat_canu_ont_assembly.contigs_pilon_hisat2_DNA_alignments_summary_SRR1513844.txt \
-x cgat_canu_ont_assembly.contigs_pilon \
-1 cgat_hiseq_SRR1513844_1.trimmed.filteredq25.fastq.gz \
-2 cgat_hiseq_SRR1513844_2.trimmed.filteredq25.fastq.gz \
| samtools view -F 4 -T cgat_canu_ont_assembly.contigs_pilon.fasta -Sb - | samtools sort -@ 28 > cgat_canu_ont_assembly.contigs_hisat2_mapped_sorted_SRR1513844_pilon.bam

