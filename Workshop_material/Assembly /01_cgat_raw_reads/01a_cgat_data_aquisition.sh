#!/bin/bash

# summary information was downloaded for illumina, ont and pacbio reads from ncbi. Summary files were screened for Cryptococcus gattii strain VGII R265:
grep "Cryptococcus gattii VGII" Fungi_Illumina_SraRunInfo.csv | grep -v "Cryptococcus gattii VGIII" | grep "R265" > Fungi_Illumina_taget_species_Cryptococcus_gattii_VGII_R265.csv

grep "Cryptococcus gattii VGII" Fungi_ONT_SraRunInfo.csv | grep -v "Cryptococcus gattii VGIII" | grep "R265" > Fungi_ONT_taget_species_Cryptococcus_gattii_VGII_R265.csv

grep "Cryptococcus gattii VGII" Fungi_PacBio_SraRunInfo.csv | grep -v "Cryptococcus gattii VGIII" | grep "R265" > Fungi_PacBio_taget_species_Cryptococcus_gattii_VGII_R265.csv
