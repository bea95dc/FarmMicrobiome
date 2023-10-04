#!/bin/bash

#SBATCH --job-name=bowtie
#SBATCH --partition=compute
#SBATCH --nodes=2

bowtie2-build --large-index $1 $2

