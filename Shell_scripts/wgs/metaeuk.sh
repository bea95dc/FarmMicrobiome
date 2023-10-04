#!/bin/bash

#SBATCH --job-name=metaeuk 
#SBATCH --partition=compute
#SBATCH --nodes=2

#Input seqs = eukaryotic contigs from megahit for functional annotation

metaeuk easy-predict $1 /home/crk_w20039236/databases/NR_metaeuk /home/crk_w20039236/anno_farms/euk_contigs /home/crk_w20039236/temp
