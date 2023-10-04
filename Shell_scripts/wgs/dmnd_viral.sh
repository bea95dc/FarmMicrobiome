#!/bin/bash

#SBATCH --job-name=diamond
#SBATCH --partition=compute
#SBATCH --nodes=2

diamond blastp -d /home/crk_w20039236/databases/viral_refseq_v216 -q $1 \
-o /home/crk_w20039236/virome_farms/viral_match.tsv --evalue 1-e5 \
--query-cover 50 --subject-cover 50 -k 2000 \
-f 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore staxids skingdoms sphylums sscinames \
--tmpdir /home/crk_w20039236/temp --threads 10


