#!/bin/sh

# Obtain green-sorted fasta data for all monocultures
# C. Goodman
# 3/7/18

# Print ID column from DC*0_green tsv file, used to obtain green_fasta IDs as new file.
# Input is blast output data, sorted by green transcripts. Output is ID column, used to sort fasta data in next step
# General form: $ awk '{print $1}' *.txt > collapsed_output.txt

# awk '{print $1}' ~/Dimensions/Monocultures/01/DC10_green > ~/Dimensions/Monocultures/01/DC10_green_fasta_IDs # Done already!

awk '{print $1}' ~/Dimensions/Monocultures/02/DC20_green > ~/Dimensions/Monocultures/02/DC20_green_fasta_IDs
awk '{print $1}' ~/Dimensions/Monocultures/03/DC30_green > ~/Dimensions/Monocultures/03/DC30_green_fasta_IDs
awk '{print $1}' ~/Dimensions/Monocultures/04/DC40_green > ~/Dimensions/Monocultures/04/DC40_green_fasta_IDs
awk '{print $1}' ~/Dimensions/Monocultures/05/DC50_green > ~/Dimensions/Monocultures/05/DC50_green_fasta_IDs
awk '{print $1}' ~/Dimensions/Monocultures/06/DC60_green > ~/Dimensions/Monocultures/06/DC60_green_fasta_IDs
awk '{print $1}' ~/Dimensions/Monocultures/07/DC70_green > ~/Dimensions/Monocultures/07/DC70_green_fasta_IDs
awk '{print $1}' ~/Dimensions/Monocultures/08/DC80_green > ~/Dimensions/Monocultures/08/DC80_green_fasta_IDs

# Extract sequences from fasta file by ID
# Input is an ID file and the reference transcriptome for each monoculture, output is green fasta data as new file.
# General form: $ perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ids.file fasta.file

# $perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/01/DC10_green_fasta_IDs.txt DC10_ref-transcripts.fasta > ~/Dimensions/Monocultures/01/DC10_green_seq.fasta # Done already!

perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/02/DC20_green_fasta_IDs ~/Dimensions/Monocultures/02/DC20_ref-transcripts.fasta > ~/Dimensions/Monocultures/02/DC20_green_seq.fasta
perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/03/DC30_green_fasta_IDs ~/Dimensions/Monocultures/03/DC30_ref-transcripts.fasta > ~/Dimensions/Monocultures/03/DC30_green_seq.fasta
perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/04/DC40_green_fasta_IDs ~/Dimensions/Monocultures/04/DC40_ref-transcripts.fasta > ~/Dimensions/Monocultures/04/DC40_green_seq.fasta
perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/05/DC50_green_fasta_IDs ~/Dimensions/Monocultures/05/DC50_ref-transcripts.fasta > ~/Dimensions/Monocultures/05/DC50_green_seq.fasta
perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/06/DC60_green_fasta_IDs ~/Dimensions/Monocultures/06/DC60_ref-transcripts.fasta > ~/Dimensions/Monocultures/06/DC60_green_seq.fasta
perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/07/DC70_green_fasta_IDs ~/Dimensions/Monocultures/07/DC70_ref-transcripts.fasta > ~/Dimensions/Monocultures/07/DC70_green_seq.fasta
perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/08/DC80_green_fasta_IDs ~/Dimensions/Monocultures/08/DC80_ref-transcripts.fasta > ~/Dimensions/Monocultures/08/DC80_green_seq.fasta
