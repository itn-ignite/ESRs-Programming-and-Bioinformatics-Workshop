#!/bin/bash
#
#SBATCH --job-name=HISATREF
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=48:00:00
#SBATCH --mem=55000
#SBATCH --err=09a_cgat_hisat2_DNA_mapping_reference.err

# generate hisat2 INDEX of merged masurca contigs:
hisat2-build Cryptococcus_gattii_VGII_R265_WGS_GCA_002954075.1.fasta Cryptococcus_gattii_VGII_R265_WGS_GCA_002954075.1

# run HISAT v. 2.1.0 with non-stranded option on merged masurca contigs:
# we start the mapping using fastq inpu (-q) and only keep reads that map (--no-unal) and where both reads of a pair map closeby (--no-mixed)
# and we run it on 28 cores (-t 28)
hisat2 -q --no-mixed --no-unal --threads 28 \
# we print the stats of the mapping to a .txt output file
--summary-file Cryptococcus_gattii_VGII_R265_WGS_GCA_002954075.1_DNA_hisat2_alignments_summary_SRR1513844.txt \
# we specify the indexed assembly (-x)
-x Cryptococcus_gattii_VGII_R265_WGS_GCA_002954075.1 \
# we call the trimmed and filtered Illumina HiSeq reads
-1 cgat_hiseq_SRR1513844_1.trimmed.filteredq25.fastq.gz \
-2 cgat_hiseq_SRR1513844_2.trimmed.filteredq25.fastq.gz \
# hisat2 by default produces a .sam file as output which we pipe into samtools view that will output a bam file (smaller size than the sam)
# than we pipe (pass) the bam to samtools sort to sort the bam (bring the chromosomes and the aligned reads in order)
| samtools view -F 4 -T Cryptococcus_gattii_VGII_R265_WGS_GCA_002954075.1.fasta -Sb - | samtools sort -@ 28 > Cryptococcus_gattii_VGII_R265_WGS_GCA_002954075.1_hisat2_mapped_sorted_SRR1513844.bam
