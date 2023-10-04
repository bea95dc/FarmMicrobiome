#!/bin/bash

#SBATCH --job-name=prodigal
#SBATCH --partition=compute
#SBATCH --nodes=2

prodigal -i /home/crk_w20039236/virome_farms/derep_vir_contigs_uniq.fasta -o /home/crk_w20039236/virome_farms/viral_genes.gff -f gff -a /home/crk_w20039236/virome_farms/viral_prots.faa -p meta


