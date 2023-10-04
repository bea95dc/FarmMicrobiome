!#/bin/bash

for file in *fasta
do
	sed -i "s/^>/>${f}_/" "${f%.*}"
done


