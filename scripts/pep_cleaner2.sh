#!/bin/sh

# Modifying TransDecoder .pep output headers
# This is not universally useful. 

infile=$1
outfile=$2
species=$3

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $infile | tail -n +2 > $outfile

awk '{print $1}' $outfile > tmp && mv tmp $outfile

awk -F "_" -v q="_" '{if ($0 ~ /^>/) { print $1q$7q$8 } else {print $0}}' $outfile > tmp && mv tmp $outfile

awk -F "." -v q="." '{if ($0 ~ /^>/) { print $1q } else {print $0}}' $outfile > tmp && mv tmp $outfile

sed -i "s/NODE/$3/g" $outfile
