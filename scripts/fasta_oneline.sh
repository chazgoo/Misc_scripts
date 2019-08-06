#!/bin/sh

# fasta_oneline.sh
# Converts multi-line fasta data to oneline, for use with nuc_count.py
# C. Goodman
# 4/2/18

# I apologize for not using regular expressions!

# Must call :set fileformat=unix in vim to remove windows ^Ms

# DCN0_green_seq.fasta files
# awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/01/DC10_green_sorted/DC10_green_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/01/DC10_green_sorted/DC10_green_seq_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/02/DC20_green_sorted/DC20_green_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/02/DC20_green_sorted/DC20_green_seq_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/03/DC30_green_sorted/DC30_green_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/03/DC30_green_sorted/DC30_green_seq_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/04/DC40_green_sorted/DC40_green_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/04/DC40_green_sorted/DC40_green_seq_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/05/DC50_green_sorted/DC50_green_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/05/DC50_green_sorted/DC50_green_seq_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/06/DC60_green_sorted/DC60_green_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/06/DC60_green_sorted/DC60_green_seq_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/07/DC70_green_sorted/DC70_green_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/07/DC70_green_sorted/DC70_green_seq_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/08/DC80_green_sorted/DC80_green_seq.fasta | tail -n +2 > ~/Dimensions/Monocultures/08/DC80_green_sorted/DC80_green_seq_oneline.fasta

# DCN0_ref-transcripts.fasta files
# awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/01/DC10_ref-transcripts.fasta | tail -n +2 > ~/Dimensions/Monocultures/01/DC10_ref-transcripts.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/02/DC20_transcripts.fasta | tail -n +2 > ~/Dimensions/Monocultures/02/DC20_transcripts_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/03/DC30_transcripts.fasta | tail -n +2 > ~/Dimensions/Monocultures/03/DC30_transcripts_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/04/DC40_transcripts.fasta | tail -n +2 > ~/Dimensions/Monocultures/04/DC40_transcripts_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/05/DC50_transcripts.fasta | tail -n +2 > ~/Dimensions/Monocultures/05/DC50_transcripts_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/06/DC60_transcripts.fasta | tail -n +2 > ~/Dimensions/Monocultures/06/DC60_transcripts_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/07/DC70_transcripts.fasta | tail -n +2 > ~/Dimensions/Monocultures/07/DC70_transcripts_oneline.fasta

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < ~/Dimensions/Monocultures/08/DC80_transcripts.fasta | tail -n +2 > ~/Dimensions/Monocultures/08/DC80_transcripts_oneline.fasta
