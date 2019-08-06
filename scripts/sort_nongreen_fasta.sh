#!/bin/sh

# Obtain nongreen-sorted fasta data for all monocultures
# C. Goodman
# 4/2/18

# Must call :set fileformat=unix in vim to remove windows ^Ms

# Print ID column from DCN0_green tsv file, used to obtain green_fasta IDs as new file.
# Input is blast output data, sorted by green transcripts. Output is ID column, used to sort fasta data in next step
# General form: $ awk '{print $1}' *.txt > collapsed_output.txt

# From DC10_green
# awk '{print $1}' ~/Dimensions/Monocultures/01/DC10_green > ~/Dimensions/Monocultures/01/DC10_green_fasta_IDs # Done already!

awk '{print $1}' ~/Dimensions/Monocultures/02/DC20_nongreen_sorted/DC20_nongreen > ~/Dimensions/Monocultures/02/DC20_nongreen_sorted/DC20_nongreen_fasta_IDs

# Extract sequences from fasta file by ID
# Input is an ID file and the reference transcriptome for each monoculture, output is green fasta data as new file.
# General form: $ perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ids.file fasta.file

# From DC10_green
# $perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/01/DC10_green_fasta_IDs.txt DC10_ref-transcripts.fasta > ~/Dimensions/Monocultures/01/DC10_green_seq.fasta # Done already!

perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/02/DC20_nongreen_sorted/DC20_nongreen_fasta_IDs ~/Dimensions/Monocultures/02/DC20_ref-transcripts.fasta > ~/Dimensions/Monocultures/02/DC20_nongreen_sorted/DC20_nongreen_seq.fasta

# Convert .fasta output to oneline format

# From DC10_green
# $ awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < DC10_green_seq.fasta | tail -n +2 > DC10_green_seq_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/02/DC20_nongreen_sorted/DC20_nongreen_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/02/DC20_nongreen_sorted/DC20_nongreen_seq_oneline.fasta

# Repeat these steps for the remaining monoculture's nongreen data

# DC30
awk '{print $1}' ~/Dimensions/Monocultures/03/DC30_nongreen_sorted/DC30_nongreen > ~/Dimensions/Monocultures/03/DC30_nongreen_sorted/DC30_nongreen_fasta_IDs

perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/03/DC30_nongreen_sorted/DC30_nongreen_fasta_IDs ~/Dimensions/Monocultures/03/DC30_ref-transcripts.fasta > ~/Dimensions/Monocultures/03/DC30_nongreen_sorted/DC30_nongreen_seq.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/03/DC30_nongreen_sorted/DC30_nongreen_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/03/DC30_nongreen_sorted/DC30_nongreen_seq_oneline.fasta

# DC40
awk '{print $1}' ~/Dimensions/Monocultures/04/DC40_nongreen_sorted/DC40_nongreen > ~/Dimensions/Monocultures/04/DC40_nongreen_sorted/DC40_nongreen_fasta_IDs

perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/04/DC40_nongreen_sorted/DC40_nongreen_fasta_IDs ~/Dimensions/Monocultures/04/DC40_ref-transcripts.fasta > ~/Dimensions/Monocultures/04/DC40_nongreen_sorted/DC40_nongreen_seq.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/04/DC40_nongreen_sorted/DC40_nongreen_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/04/DC40_nongreen_sorted/DC40_nongreen_seq_oneline.fasta

# DC50
awk '{print $1}' ~/Dimensions/Monocultures/05/DC50_nongreen_sorted/DC50_nongreen > ~/Dimensions/Monocultures/05/DC50_nongreen_sorted/DC50_nongreen_fasta_IDs

perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/05/DC50_nongreen_sorted/DC50_nongreen_fasta_IDs ~/Dimensions/Monocultures/05/DC50_ref-transcripts.fasta > ~/Dimensions/Monocultures/05/DC50_nongreen_sorted/DC50_nongreen_seq.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/05/DC50_nongreen_sorted/DC50_nongreen_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/05/DC50_nongreen_sorted/DC50_nongreen_seq_oneline.fasta

# DC60
awk '{print $1}' ~/Dimensions/Monocultures/06/DC60_nongreen_sorted/DC60_nongreen > ~/Dimensions/Monocultures/06/DC60_nongreen_sorted/DC60_nongreen_fasta_IDs

perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/06/DC60_nongreen_sorted/DC60_nongreen_fasta_IDs ~/Dimensions/Monocultures/06/DC60_ref-transcripts.fasta > ~/Dimensions/Monocultures/06/DC60_nongreen_sorted/DC60_nongreen_seq.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/06/DC60_nongreen_sorted/DC60_nongreen_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/06/DC60_nongreen_sorted/DC60_nongreen_seq_oneline.fasta

# DC70
awk '{print $1}' ~/Dimensions/Monocultures/07/DC70_nongreen_sorted/DC70_nongreen > ~/Dimensions/Monocultures/07/DC70_nongreen_sorted/DC70_nongreen_fasta_IDs

perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/07/DC70_nongreen_sorted/DC70_nongreen_fasta_IDs ~/Dimensions/Monocultures/07/DC70_ref-transcripts.fasta > ~/Dimensions/Monocultures/07/DC70_nongreen_sorted/DC70_nongreen_seq.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/07/DC70_nongreen_sorted/DC70_nongreen_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/07/DC70_nongreen_sorted/DC70_nongreen_seq_oneline.fasta

# DC80
awk '{print $1}' ~/Dimensions/Monocultures/08/DC80_nongreen_sorted/DC80_nongreen > ~/Dimensions/Monocultures/08/DC80_nongreen_sorted/DC80_nongreen_fasta_IDs

perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ~/Dimensions/Monocultures/08/DC80_nongreen_sorted/DC80_nongreen_fasta_IDs ~/Dimensions/Monocultures/08/DC80_ref-transcripts.fasta > ~/Dimensions/Monocultures/08/DC80_nongreen_sorted/DC80_nongreen_seq.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/08/DC80_nongreen_sorted/DC80_nongreen_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/08/DC80_nongreen_sorted/DC80_nongreen_seq_oneline.fasta
