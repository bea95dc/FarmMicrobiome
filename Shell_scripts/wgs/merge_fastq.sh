#!/bin/bash

#SBATCH --job-name=join
#SBATCH --partition=compute
#SBATCH --nodes=8


for file in /home/crk_w20039236/wgs_farms/bowtie/clean_fastq/*r1.fastq
do
	path=`dirname $(readlink -f $file)`
        base="$(basename ${file} r1.fastq)"
	fastq-join $file ${path}/${base}r2.fastq -o ./${base}_%.fastq
done


