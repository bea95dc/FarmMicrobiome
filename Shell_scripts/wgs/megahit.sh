#!/bin/bash

#SBATCH --job-name=megahit
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-7

#Input seqs = output from trimmomatic or after host removal

file=$(ls /home/crk_w20039236/bowtie_farms/hr_fastq/re-assemb/*_hr_r1.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)
id=`echo $file | grep -o -P '(?<=/).*(?=_hr_r1.fastq)'`
id2="${id}_hr_r2.fastq"
base="$(basename ${file} _hr_r1.fastq)"

megahit -1 ${file} -2 /${id2} --out-prefix ${base} -o ./${base}_out --presets meta-large --min-contig-len 1000 -t 10


