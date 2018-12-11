#!/bin/bash
#
#SBATCH --job-name=BUSCANONT
#SBATCH --reservation=IGNITE
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=28
#SBATCH --mail-user=m.eitel@lmu.de
#SBATCH --mail-type=ALL
#SBATCH --clusters=mpp2
#SBATCH --time=48:00:00
#SBATCH --mem=55000
#SBATCH --err=11a_cgat_busco_canu_ont.err


export AUGUSTUS_CONFIG_PATH=/naslx/projects/pn69xe/di52zuy/ignite_tools_py3/config/


# run BUSCO3 against the full fungi_odb9 ortholog set:
run_BUSCO.py -c 28 \
-i cgat_canu_ont_assembly.contigs_pilon.fasta \
-o 11a_cgat_canu_ont_assembly.contigs_pilon_fungi \
-m genome \
-l /naslx/projects/pn69xe/di29vos2/IGNITE/workdir_results/busco_db/fungi_odb9


# run BUSCO3 against the full dikarya_odb9 ortholog set:
run_BUSCO.py -c 28 \
-i cgat_canu_ont_assembly.contigs_pilon.fasta \
-o 11a_cgat_canu_ont_assembly.contigs_pilon_dikarya \
-m genome \
-l /naslx/projects/pn69xe/di29vos2/IGNITE/workdir_results/busco_db/dikarya_odb9


# run BUSCO3 against the full basidiomycota_odb9 ortholog set:
run_BUSCO.py -c 28 \
-i cgat_canu_ont_assembly.contigs_pilon.fasta \
-o 11a_cgat_canu_ont_assembly.contigs_pilon_basidiomycota \
-m genome \
-l /naslx/projects/pn69xe/di29vos2/IGNITE/workdir_results/busco_db/basidiomycota_odb9




