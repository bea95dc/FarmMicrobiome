#!/bin/bash

#SBATCH --job-name=bowtie
#SBATCH --partition=compute
#SBATCH --nodes=2

#Script should be run in the output folder and source the input files remotely
#The hr tag in the final files mean "host removed"

for infile in /home/crk_w20039236/trimmomatic_farms/trimmed/*_1.trim.fastq.gz
do
	path=`dirname $(readlink -f $infile)`
	base="$(basename ${infile} _ME_L001_1.trim.fastq.gz)"
	bowtie2 -x /home/crk_w20039236/databases/bowtie/contam_db -1 ${infile} -2 ${path}/${base}_ME_L001_2.trim.fastq.gz -S ${base}_all.sam --threads 10
	samtools view -bS ${base}_all.sam > ${base}_all.bam
	samtools view -b -f 12 -F 256 ${base}_all.bam > ${base}_bothEndsUnmapped.bam
	samtools sort ${base}_bothEndsUnmapped.bam -o ${base}_bothEndsUnmapped_sorted.bam
	bedtools bamtofastq -i ${base}_bothEndsUnmapped_sorted.bam -fq ${base}_hr_r1.fastq -fq2 ${base}_hr_r2.fastq
done




