#!/bin/bash

#SBATCH --job-name=checkv
#SBATCH --partition=compute
##SBATCH --nodes=2
##SBATCH --array 1-67

#file=$(ls /home/crk_w20039236/virome_farms/*_virus/VIBRANT*.contigs/VIBRANT_phages*.contigs/*.contigs.phages_combined.fna | sed -n ${SLURM_ARRAY_TASK_ID}p)
#base="$(basename ${file} .contigs.phages_combined.fna)"

#checkv end_to_end $file /home/crk_w20039236/virome_farms/${base}_checkv -t 10

checkv end_to_end /home/crk_w20039236/virome_farms/derep_vir_contigs_uniq.fasta /home/crk_w20039236/virome_farms/derep_checkv -t 10
