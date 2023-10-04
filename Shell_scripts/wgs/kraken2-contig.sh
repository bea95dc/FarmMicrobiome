#!/bin/bash

#SBATCH --job-name=kraken
#SBATCH --partition=compute
#SBATCH --nodes=2
##SBATCH --array 1-59
#SBATCH --output=/home/crk_w20039236/slurms/%j.out

export TMPDIR=//home/crk_w20039236/temp

#Input seqs = assembled contigs from k127 to search for proteins

#file=$(ls /home/crk_w20039236/assembly_farms/*out/intermediate_contigs/k127.contigs.fa | sed -n ${SLURM_ARRAY_TASK_ID}p)
#base=`echo $file | grep -o -P '(?<=/assembly_farms/).*(?=_out/intermediate_contigs/k127.contigs.fa)'`


kraken2 --db /home/crk_w20039236/databases/krakenPlusPF --quick --output /home/crk_w20039236/anno_farms/kraken/all_contigs_kraken2.out --report /home/crk_w20039236/anno_farms/kraken/all_contigs_kraken2.report --threads 10  /home/crk_w20039236/anno_farms/all_contigs.fa 
