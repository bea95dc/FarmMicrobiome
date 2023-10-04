#!/bin/bash

#SBATCH --job-name=diamond
#SBATCH --partition=compute


for file in /home/crk_w20039236/wgs_farms/merged_fastq/*merged.fastq
do
	base="$(basename ${file} _merged.fastq)"	
	diamond blastx -d nr -q $file -o ${base}_merged.daa -f 100 --threads 20
done
