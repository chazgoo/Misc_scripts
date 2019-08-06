#!/bin/sh

# Written 10.16.18, formatted for use with Dimensions data - one species per run!

# Prior to run:
# 1.) mkdir ~/Dimensions/Kallistos/DC#
# 2.) Generate an index in directory from step 1, and pass that as the first argument! [kallisto index -i <index name> <fasta file for indexing>]
# Run this from ~/Dimensions/TrimmedReads
# Pass full path to INDEX as first argument, and DC# as second argument

INDEX=$1
DC=$2

for i in `ls -1 $DC.*_1.*.gz | sed 's/_1.trimmed.fq.gz//'`

do

	mkdir $i\_Kallisto

	~/software/kallisto_linux-v0.44.0/kallisto quant -i $INDEX -b 100 -o $i\_Kallisto $i\_1.trimmed.fq.gz $i\_2.trimmed.fq.gz

	mv $i\_Kallisto ../Kallistos

done
