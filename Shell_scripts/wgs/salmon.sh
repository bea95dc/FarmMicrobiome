#!/bin/bash

#SBATCH --job-name=salmon
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-67
#SBATCH --output=/home/crk_w20039236/slurms/%j.out

TMPDIR=/home/crk_w20039236/temp

file=$(ls /home/crk_w20039236/anno_farms/bam/*bam | sed -n ${SLURM_ARRAY_TASK_ID}p)
base="$(basename ${file} .bam)"

salmon quant -t /home/crk_w20039236/anno_farms/derep_genes.fasta -l IU -a $file -o /home/crk_w20039236/anno_farms/${base}.quant



