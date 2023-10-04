#!/bin/bash

#SBATCH --job-name=cat_contigs
#SBATCH --partition=compute

for f in /home/crk_w20039236/assembly_farms/*out/*contigs.fa
do 
	base="$(basename ${f} .contigs.fa)"
	sed "s/^>/>${base}_/g" "${f}"
done > /home/crk_w20039236/anno_farms/all_contigs.fa
