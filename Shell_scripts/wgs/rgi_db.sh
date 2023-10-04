#!/bin/bash

#SBATCH --job-name=rgi_db
#SBATCH --partition=compute
#SBATCH --nodes=2

#rgi clean --local

#Process canonical CARD database for metagenomic reads
#rgi load --card_json /home/crk_w20039236/databases/CARD/card.json --local
#rgi card_annotation -i /home/crk_w20039236/databases/CARD/card.json > card_annotation.log 2>&1
rgi load -i /home/crk_w20039236/databases/CARD/card.json --card_annotation card_database_v3.2.6.fasta --local

#Process wildCARD resistome and variants to include in the analysis of metagenomes
#rgi wildcard_annotation -i /home/crk_w20039236/databases/wildcard --card_json /home/crk_w20039236/databases/CARD/card.json -v 4.0.0 > wildcard_annotation.log 2>&1
#rgi load --wildcard_annotation wildcard_database_v4.0.0.fasta --card_json /home/crk_w20039236/databases/CARD/card.json --wildcard_index /home/crk_w20039236/databases/wildcard/index-for-model-sequences.txt --card_annotation card_database_v3.2.6.fasta --local



