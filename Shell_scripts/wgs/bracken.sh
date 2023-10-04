#!/bin/bash

#SBATCH --job-name=bracken
#SBATCH --partition=compute
#SBATCH --nodes=2

DB=/home/crk_w20039236/databases/kraken_bracken/
DIR=$1
OUT=$2

#Create directory in case it does not exit. Gives no error if it does
mkdir -p $OUT

for K2 in $DIR/*report
do
    sample=$(basename ${K2} _kraken2.report)
    echo "Re-estimating abundances with bracken for" $K2
    bracken \
        -d $DB \
        -i $K2 \
        -o ${OUT}/${sample}.bracken \
        -r 150 \
        -l S \
	-t 0
done
