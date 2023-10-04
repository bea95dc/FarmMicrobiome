#!/bin/bash

#SBATCH --job-name=prokka
#SBATCH --partition=compute
#SBATCH --nodes=2

export TMPDIR=/home/crk_w20039236/temp

#Input seqs = bacterial and archaeal contigs from megahit for functional annotation

prokka $1 --kingdom Bacteria --outdir /home/crk_w20039236/anno_farms/prokka --prefix bac_anno --metagenome --cpus 10 --mincontiglen 500
