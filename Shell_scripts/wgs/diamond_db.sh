#!/bin/bash

#SBATCH --job-name=diamonddb
#SBATCH --partition=compute
#SBATCH --nodes=8

diamond makedb --in $1 --db $2
