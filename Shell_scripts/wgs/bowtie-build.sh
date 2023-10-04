#!/bin/bash

#SBATCH --job-name=bowtie-build
#SBATCH --partition=compute
#SBATCH --nodes=5

bowtie2-build animal_db.fna.gz contam_db
