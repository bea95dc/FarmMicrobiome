#!/bin/bash

#SBATCH --job-name=megahit
#SBATCH --partition=compute

virsorter run -i $1 -w $2 --min-length 1500 -j 4 all
