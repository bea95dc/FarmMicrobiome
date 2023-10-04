#!/bin/bash

#SBATCH --job-name=kraken
#SBATCH --partition=compute
#SBATCH --nodes=2

#--classified-out ${base}_class#.fastq \
#--unclassified-out ${base}_unclass#.fastq \

for infile in /home/crk_w20039236/FEAST/fastq_sra/*1.fastq
do
	base="$(basename ${infile} _1.fastq)"
	kraken2 --db /home/crk_w20039236/databases/krakenPlusPF/ \
	--output ./kraken/${base}_kraken2.out --report ./kraken/${base}_kraken2.report \
    	--paired $infile /home/crk_w20039236/FEAST/fastq_sra/${base}_2.fastq \
	--threads 10
done
