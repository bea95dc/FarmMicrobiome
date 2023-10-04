#!/bin/bash

#SBATCH --job-name=kraken 
#SBATCH --partition=compute

python extract_kraken_reads.py -k $1 -s $2 --r /home/crk_w20039236/anno_farms/kraken/all_contigs_kraken2.report -o /home/crk_w20039236/anno_farms/virus_contigs.fasta -t 10239 --include-children
