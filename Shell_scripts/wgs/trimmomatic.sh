#!/bin/sh

#SBATCH --job-name=trimmomatic
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --array 1-67

file=$(ls /home/crk_w20039236/cat_fastq/*R1_001.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
id=`echo $file | grep -o -P '(?<=/).*(?=_R1_001.fastq.gz)'`
id2="${id}_R2_001.fastq.gz"
base="$(basename ${file} _R1_001.fastq.gz)"

trimmomatic PE -threads 10 -phred33 ${file} /${id2} \
	${base}_1.trim.fastq.gz ${base}_1un.trim.fastq.gz \
	${base}_2.trim.fastq.gz ${base}_2un.trim.fastq.gz \
	SLIDINGWINDOW:4:20 MINLEN:100 ILLUMINACLIP:/home/crk_w20039236/.conda/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic-0.39-2/adapters/NexteraPE-PE.fa:2:40:15 
