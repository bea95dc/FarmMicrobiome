#!/bin/bash

#SBATCH --job-name=bbmap
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-67

file=$(ls /home/crk_w20039236/bowtie_farms/hr_fastq/*_hr_r1.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)
id=`echo $file | grep -o -P '(?<=/).*(?=_hr_r1.fastq)'`
id2="${id}_hr_r2.fastq"
base="$(basename ${file} _hr_r1.fastq)"
db=

bbmapskimmer.sh in=$file in2=$id2 ref=$db out=${base}.bam rpkm=${base}_count.txt covstats=${base}_cov.txt



