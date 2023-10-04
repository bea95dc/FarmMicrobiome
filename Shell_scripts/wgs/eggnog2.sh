#!/bin/sh

#SBATCH --job-name=eggnog
#SBATCH --partition=compute
#SBATCH --nodes=2



#This section is dedicated to functional annotation of pooled proteins from metagenomes using the diamond search algorithm

emapper.py -m diamond -i $1 --itype proteins \
--annotate_hits_table /home/crk_w20039236/anno_farms/meta_annot_d.tsv \
--temp_dir /home/crk_w20039236/temp -o meta_annot_d \
--cpu 10 --data_dir /home/crk_w20039236/eggnog-mapper-data/
