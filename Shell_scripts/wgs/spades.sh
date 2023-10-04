#!/bin/bash

#SBATCH --job-name=spades
#SBATCH --partition=compute

for file in /home/crk_w20039236/wgs_farms/bowtie/clean_fastq/*r1.fastq
do
  	path=`dirname $(readlink -f $file)`
        base="$(basename ${file} r1.fastq)"
	spades.py -1 $file -2 ${path}/${base}r2.fastq -o ./spades_${base} -t 10
done
