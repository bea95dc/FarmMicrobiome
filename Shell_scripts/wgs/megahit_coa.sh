#!/bin/bash

#SBATCH --job-name=megahit
#SBATCH --partition=compute


path="/home/crk_w20039236/wgs_farms/bowtie/clean_fastq"
megahit -1 ${path}/BeaA1_S15_L001_hr_r1.fastq,${path}/BeaB6_S17_L001_hr_r1.fastq -2 ${path}/BeaA1_S15_L001_hr_r2.fastq,${path}/BeaB6_S17_L001_hr_r2.fastq -o ./coassebly_out --presets meta-large --min-contig-len 1000 -t 10
