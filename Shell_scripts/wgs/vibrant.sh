#!/bin/bash

#SBATCH --job-name=vibrant
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-67

#Input seqs = final contigs from megahit

file=$(ls /home/crk_w20039236/assembly_farms/eggnog/*_out/*.contigs.fa | sed -n ${SLURM_ARRAY_TASK_ID}p)
id=`echo $file | grep -o -P '(?<=/).*(?=.contigs.fa)'`
base="$(basename ${file} .contigs.fa)"

python3 /home/crk_w20039236/VIBRANT/VIBRANT_run.py -i $file -t 5 -folder /home/crk_w20039236/virome_farms/${base}_virus
