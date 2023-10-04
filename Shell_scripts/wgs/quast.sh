#!/bin/bash

#SBATCH --job-name=quast
#SBATCH --partition=compute


for file in /home/crk_w20039236/wgs_farms/assembly_sensitive/Bea*/Bea*.contigs.fa
do
	base="$(basename ${file} .contigs.fa)"
	path=`dirname $(readlink -f $file)`
	quast $file -o ${path}/quast_${base}
done
