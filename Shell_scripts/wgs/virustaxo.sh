#!/bin/bash

#SBATCH --job-name=virustax
#SBATCH --partition=compute
#SBATCH --nodes=2

export TMPDIR=//home/crk_w20039236/temp

#!/bin/bash

python3 predict.py --model_path /home/crk_w20039236/VirusTaxo/vt_db_apr27_2022/vt_db_dna_virus_kmer_21.pkl --seq /home/crk_w20039236/virome_farms/derep_vir_contigs_uniq.fasta
