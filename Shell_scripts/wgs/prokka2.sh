#!/bin/bash

#SBATCH --job-name=prokka
#SBATCH --partition=compute
#SBATCH --nodes=2

export TMPDIR=/home/crk_w20039236/temp

#Input seqs = bacterial, archaeal or viral contigs from megahit for functional annotation

prokka $1 --kingdom $2 --outdir /home/crk_w20039236/anno_farms/${2}_prokka --prefix ${2}_anno --metagenome --cpus 10 --mincontiglen 500
