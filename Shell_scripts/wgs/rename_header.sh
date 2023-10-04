cut -d" " -f1 derep_viral_contigs.fasta | awk '/^>/{$0=$0"_"(++i)}1' > derep_vir_contigs_uniq.fasta
