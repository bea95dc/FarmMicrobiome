#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --partition=compute
#SBATCH --nodes=2

fastqc ./trimmomatic_farms/trimmed/*gz -o ./fastqc2_farms --threads 10
