#!/bin/sh

#SBATCH --job-name=eggnog
#SBATCH --partition=compute
#SBATCH --nodes=2

#This section is dedicated to functional annotation of pooled proteins from metagenomes using the mmseqs2 search algorithm

emapper.py -m diamond -i $1 --itype proteins \
--annotate_hits_table /home/crk_w20039236/virome_farms/annot_virus.tsv \
--temp_dir /home/crk_w20039236/temp -o /home/crk_w20039236/virome_farms/annot_virus \
--data_dir /home/crk_w20039236/eggnog-mapper-data/ --cpu 2
