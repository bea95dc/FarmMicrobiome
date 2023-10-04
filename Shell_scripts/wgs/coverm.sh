#!/bin/bash

#SBATCH --job-name=coverm
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-67
#SBATCH --output=/home/crk_w20039236/slurms/%j.out

TMPDIR=/home/crk_w20039236/temp

#The contig-end-exlcusion flag will only be applied when aligning to predicted genes as to avoid information

file=$(ls /home/crk_w20039236/trimmomatic_farms/trimmed/*_ME_L001_1.trim.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
base="$(basename ${file} _ME_L001_1.trim.fastq.gz)"
id2="/home/crk_w20039236/trimmomatic_farms/trimmed/${base}_ME_L001_2.trim.fastq.gz"

coverm contig -1 ${file} -2 ${id2} -r /home/crk_w20039236/anno_farms/derep_genes_uniq.fasta --methods mean count length rpkm --contig-end-exclusion 0 -t 10 -o /home/crk_w20039236/anno_farms/${base}_genecov.txt

