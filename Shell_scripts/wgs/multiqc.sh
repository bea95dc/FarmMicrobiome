#!/bin/bash

#SBATCH --job-name=multiqc
#SBATCH --partition=compute

multiqc $1 -o $2
