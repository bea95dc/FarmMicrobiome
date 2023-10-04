#!/bin/bash

#SBATCH --job-name=virsorter
#SBATCH --partition=compute

virsorter run -i 25_S1.contigs.fa -w 25_S1.out --min-length 1200 -j 5 all
