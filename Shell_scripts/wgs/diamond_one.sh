#!/bin/bash

#SBATCH --job-name=diamond
#SBATCH --partition=compute
#SBATCH --nodes=3


diamond blastx -d derep_prots -q $1 -o $2 --threads 10 -f 6
