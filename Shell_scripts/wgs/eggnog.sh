#!/bin/sh

#SBATCH --job-name=eggnog
#SBATCH --partition=compute
#SBATCH --nodes=2
##SBATCH --array 1-7

#Input seqs = output from trimmomatic or after host removal

#file=$(ls /home/crk_w20039236/assembly_farms/eggnog/*_out/intermediate_contigs/k127.contigs.fa | sed -n ${SLURM_ARRAY_TASK_ID}p)
#base=`echo $file | grep -o -P '(?<=/eggnog/).*(?=_out/intermediate_contigs/k127.contigs.fa)'`

#emapper.py -i $file --itype metagenome --translate --annotate_hits_table /home/crk_w20039236/anno_farms/${base}_annotable.tsv --data_dir /home/crk_w20039236/eggnog-mapper-data/ --output_dir /home/crk_w20039236/anno_farms/ -o ${base} --decorate_gff yes --cpu 4

#This section is dedicated to functional annotation of pooled proteins from metagenomes using the mmseqs2 search algorithm

emapper.py -m mmseqs -i $1 --itype proteins \
--annotate_hits_table /home/crk_w20039236/anno_farms/meta_annot.tsv \
--mmseqs_db /home/crk_w20039236/databases/NR_metaeuk_db/NR_metaeuk --excel \
--temp_dir /home/crk_w20039236/temp -o meta_annot \
--data_dir /home/crk_w20039236/eggnog-mapper-data/
