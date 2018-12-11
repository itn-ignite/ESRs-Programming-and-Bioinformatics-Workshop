#!/bin/bash
#
#SBATCH --job-name=KATproc
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=12:00:00
#SBATCH --mem=50000
#SBATCH --err=05_KAT_illumina_processed_reads_statistics.err




# generating 'precessed read clouds':
## combine reads:
cat cgat_hiseq_SRR1513844_*.trimmed.filteredq25.fastq.gz > cgat_hiseq_SRR1513844_combined_processed.fastq.gz


## generate clouds:
kat gcp -t 28 -o cgat_hiseq_SRR1513844_combined_processed_gcp cgat_hiseq_SRR1513844_combined_processed.fastq.gz

