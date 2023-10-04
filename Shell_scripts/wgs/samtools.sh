#!/bin/bash

#SBATCH --job-name=samtools
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-67
#SBATCH --output=/home/crk_w20039236/slurms/%j.out

TMPDIR=/home/crk_w20039236/temp

file=$(ls /home/crk_w20039236/anno_farms/sam/*sam | sed -n ${SLURM_ARRAY_TASK_ID}p)
base="$(basename ${file} .sam)"

samtools view -S -b $file > /home/crk_w20039236/anno_farms/bam/${base}.bam



