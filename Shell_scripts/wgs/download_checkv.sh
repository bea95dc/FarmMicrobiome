#!/bin/bash

#SBATCH --job-name=checkv
#SBATCH --partition=compute
#SBATCH --nodes=2

checkv download_database ./databases
