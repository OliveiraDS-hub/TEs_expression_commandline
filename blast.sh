#!/bin/bash

set -e

direc="/home/stagiaire/oliveira/santa_maria/full_length"
blastn="/home/stagiaire/softwares/ncbi-blast-2.10.0+/bin/blastn"
db_rosette="/home/stagiaire/oliveira/santa_maria/full_length/rosette"

# BLASTn: Assembled transcripts against TEs insertions

##The same code was used to both "TE and genes expression" and "TE transcripts analysis"

for transcripts in "$direc/"*.fasta; do
	name="${transcripts%.*}"
	output="${name}"blast_result.ods
	$blastn -query "$transcripts" -db "$db_rosette/"tes_insertions -max_target_seqs 1 -outfmt 6 -out "$output"
done
	
mkdir blast_results

mv "$direc/"*.ods blast_results/

#Recover only the higher bitscore per transcript

for blast in "$direc/"blast_results/*.ods; do
	name="${blast%.*}"
	output="${name}"_filter.ods
	sort -k1,1 -k12,12gr -k11,11g -k3,3gr "$blast" | sort -u -k1,1 --merge > "$output"
done
