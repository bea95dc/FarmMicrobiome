#!/bin/bash

#SBATCH --job-name=cd-hit
#SBATCH --partition=compute
#SBATCH --nodes=2

#Change headers from predicted genes by having only the contigs name and adding their predicted kingdom

#awk -F '|' '/^>/ { print ">"$2; next } 1' euk_contigs.codon.fas > euk_contigs.clean.fna

#for f in *.fna
#do
#	sed -i "s/^>/>${f%.fna}_/g" "${f}"
#done

#cat *fna > final_genes.fasta

cd-hit-est -i final_genes.fasta -o derep_genes.fasta -c 0.90 -T 10 -aL 0.7 -aS 0.7 -g 1 -n 9 -M 2474
