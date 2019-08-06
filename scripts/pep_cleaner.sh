#!/bin/sh

# Modifying TransDecoder .pep output headers
# This is VERY LIKELY not universally useful. 

infile=$1
outfile=$2

awk '{print $1, $6}' $infile > tmp && mv tmp $outfile

awk '{gsub(/_/," ",$1)}1' $outfile > tmp && mv tmp $outfile

awk '{print $1, $2, $9}' $outfile > tmp && mv tmp $outfile

sed -i 's/,/ /g' $outfile

awk '{print $1, $2, $5}' $outfile > tmp && mv tmp $outfile

awk '/^>/{sub(/^>/,">DC10 ");}1' $outfile > tmp && mv tmp $outfile
