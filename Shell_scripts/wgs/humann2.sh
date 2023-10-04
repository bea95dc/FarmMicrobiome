#!/bin/bash

#SBATCH --job-name=humann3
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-67

file=$(ls /home/crk_w20039236/cat_fastq_trim/*cat.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
base="$(basename ${file} _cat.fastq.gz)"

humann -i $file --output ./humann_farms/${base}_humann --metaphlan-options "--bowtie2db /home/crk_w20039236/humann3/lib/python3.7/site-packages/metaphlan/metaphlan_databases/" --threads 10

