#!/bin/bash

#SBATCH --job-name=bowtie
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-67
#SBATCH --output=/home/crk_w20039236/slurms/%j.out

TMPDIR=/home/crk_w20039236/temp

file=$(ls /home/crk_w20039236/trimmomatic_farms/trimmed/*_ME_L001_1.trim.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
base="$(basename ${file} _ME_L001_1.trim.fastq.gz)"
id2="/home/crk_w20039236/trimmomatic_farms/trimmed/${base}_ME_L001_2.trim.fastq.gz"

bowtie2 -x /home/crk_w20039236/databases/bowtie_genes/assembl_genes -1 $file -2 $id2 -S /home/crk_w20039236/anno_farms/sam/${base}.sam
