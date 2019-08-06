#!/bin/sh

for i in `ls -1 *_R1*.gz | sed 's/_R1_001.fastq.gz//'`
do

~/software/bbmap/bbduk.sh -Xmx1g in=$i\_R#_001.fastq.gz out=$i\_R#_001_tmp-clean.fastq ref=~/software/bbmap/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo

~/software/bbmap/bbduk.sh -Xmx1g in=$i\_R#_001_tmp-clean.fastq out=$i\_R#_001_clean.fastq qtrim=rl trimq=10

rm $i\_R*_001_tmp-clean.fastq

done
