#!/bin/sh

# Written 4.3.19, formatted for use with Dimensions data - one species per run!

# Prior to run:
# 1.) mkdir ~/Dimensions/Rosettas, run this in there

for i in $( seq  1 8 )

do

        grep ">" ~/Dimensions/Monocultures/0$i\/DC$i\0_TransDecoder/DC$i\0_green_seq.fasta.transdecoder.pep > ./tdheaders

	python3 ~/scripts/PyRosetta.py ~/Dimensions/R_analyses/Monoculture_Expression_Data/ExpressionTables/DC$i\0_expression.csv ~/Dimensions/Monocultures/0$i\/DC$i\0_green_sorted/DC$i\0_green  tdheaders ~/Dimensions/OrthoFinder/2nd_run/Results_Mar27/Orthogroups.csv DC$i\0

done
