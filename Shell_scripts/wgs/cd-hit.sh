#!/bin/bash

#SBATCH --job-name=cd-hit
#SBATCH --partition=compute
#SBATCH --nodes=2

cd-hit-est -i $1 -o $2 -c 0.90 -T 10 -aL 0.7 -aS 0.7 -g 1 -n 9

 
