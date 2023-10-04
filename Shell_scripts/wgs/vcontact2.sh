#!/bin/bash

#SBATCH --job-name=vcontact
#SBATCH --partition=compute
#SBATCH --nodes=2

vcontact2 --raw-proteins $1 --proteins-fp $2 --db 'ProkaryoticViralRefSeq94-Merged' --pcs-mode MCL --vcs-mode ClusterONE --output-dir /home/crk_w20039236/virome_farms/vcontact


