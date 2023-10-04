#!/bin/bash

#SBATCH --job-name=rgi
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-67

file=$(ls /home/crk_w20039236/bowtie_farms/hr_fastq/*_hr_r1.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)
id=`echo $file | grep -o -P '(?<=/).*(?=_hr_r1.fastq)'`
id2="/${id}_hr_r2.fastq"
base="$(basename ${file} _hr_r1.fastq)"

#rgi clean --local

##Process canonical CARD database for metagenomic reads
#rgi load --card_json /home/crk_w20039236/databases/CARD/card.json --local
#rgi card_annotation -i /home/crk_w20039236/databases/CARD/card.json > card_annotation.log 2>&1
rgi load -i /home/crk_w20039236/databases/CARD/card.json --card_annotation card_database_v3.2.6.fasta --local

##Process wildCARD resistome and variants to include in the analysis of metagenomes. Not using this because the space in the disk is not enough.
#rgi wildcard_annotation -i /home/crk_w20039236/databases/wildcard --card_json /home/crk_w20039236/databases/CARD/card.json -v 4.0.0 > wildcard_annotation.log 2>&1
#rgi load --wildcard_annotation wildcard_database_v4.0.0.fasta --card_json /home/crk_w20039236/databases/CARD/card.json --wildcard_index /home/crk_w20039236/databases/wildcard/index-for-model-sequences.txt --card_annotation card_database_v3.2.6.fasta --local

#Run analysis
rgi bwt --read_one $file --read_two $id2 -n 10 --output_file ${base} --local


