#!/bin/bash

for file in /home/crk_w20039236/trimmomatic_farms/trimmed/*1.trim.fastq.gz
do
	id=`echo $file | grep -o -P '(?<=/).*(?=1.trim.fastq.gz)'`
	base="$(basename $file _1.trim.fastq.gz)"
	cat $file ${id}2.trim.fastq.gz > ./cat_fastq_trim/${base}_cat.fastq.gz
done
