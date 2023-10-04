#!/bin/sh

#SBATCH --job-name=megan
#SBATCH --partition=compute

daa-meganizer -i $1 -mdb /home/crk_w20039236/megan-map-Jan2021.db -t 20
