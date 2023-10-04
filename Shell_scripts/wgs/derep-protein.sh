#!/bin/bash

#SBATCH --job-name=cd-hit
#SBATCH --partition=compute
#SBATCH --nodes=2

#Input file is: predicted proteins from metagenome contigs

cd-hit -i $1 -o /home/crk_w20039236/anno_farms/derep_prots.fasta -T 10 


