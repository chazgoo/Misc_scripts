#!/bin/sh

# Written 7.11.18, formatted for use with UB_collab CA/CL data
# Prior to run, (from the directory holding the PE-read fastq files) cd ..; mkdir *_Kallistos.
# Generate an index in *_Trim, and pass that as the first argument!
## kallisto index -i <index name> <fasta file for indexing> 
# Run this from the directory holding the PE-read fastq files and index.

INDEX=$1

for i in `ls -1 C*_R1*.gz | sed 's/_R1_001_clean.fastq.gz//'`

do

	mkdir $i\_Kallisto

	~/software/kallisto_linux-v0.44.0/kallisto quant -i $INDEX -b 100 -o $i\_Kallisto $i\_R1_001_clean.fastq.gz $i\_R2_001_clean.fastq.gz

	mv $i\_Kallisto ../*_Kallistos

done
