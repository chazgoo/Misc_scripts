#!/bin/sh

# For each monoculture, run TransDecoder.LongOrfs to ID ORFs then run output through HMMER to ID PfamA matches.
# Next step is to run TransDecoder.Predict so only matches are retained.
# Goal is to shrink data by removing unmatched ORFs.

# C. Goodman
# 3.14.18

# This may be ran from anywhere!
# Must call :set fileformat=unix in vim to remove windows ^Ms

# TransDecoder.LongOrfs

# In context, DC10:
# ~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.LongOrfs -m 30 -t ~/Dimensions/Monocultures/01/DC10_green_sorted/DC10_green_seq.fasta
# Output is a transdecoder.dir 

##~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.LongOrfs -m 30 -t ~/Dimensions/Monocultures/02/DC20_green_seq.fasta
##~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.LongOrfs -m 30 -t ~/Dimensions/Monocultures/03/DC30_green_seq.fasta
##~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.LongOrfs -m 30 -t ~/Dimensions/Monocultures/04/DC40_green_seq.fasta
##~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.LongOrfs -m 30 -t ~/Dimensions/Monocultures/05/DC50_green_seq.fasta
##~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.LongOrfs -m 30 -t ~/Dimensions/Monocultures/06/DC60_green_seq.fasta
##~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.LongOrfs -m 30 -t ~/Dimensions/Monocultures/07/DC70_green_seq.fasta
##~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.LongOrfs -m 30 -t ~/Dimensions/Monocultures/08/DC80_green_seq.fasta


# HMMER step
# General form:
# hmmscan --cpu 8 --domtblout pfam.domtblout /path/to/Pfam-A.hmm transdecoder_dir/longest_orfs.pep

# In context, DC10:
# ~/software/hmmer-3.1b2-linux-intel-x86_64/binaries/hmmscan --cpu 8 --domtblout pfam.domtblout ~/Dimensions/Databases/Pfam/Pfam-A.hmm ~/Dimensions/Monocultures/01/DC10_green_seq.fasta.transdecoder_dir/longest_orfs.pep
# Output is a DC#0_pfam.domtblout file

##~/software/hmmer-3.1b2-linux-intel-x86_64/binaries/hmmscan --cpu 16 --domtblout DC20_pfam.domtblout ~/Dimensions/Databases/Pfam/Pfam-A.hmm ~/Dimensions/Monocultures/02/DC20_green_seq.fasta.transdecoder_dir/longest_orfs.pep
~/software/hmmer-3.1b2-linux-intel-x86_64/binaries/hmmscan --cpu 16 --domtblout DC30_pfam.domtblout ~/Dimensions/Databases/Pfam/Pfam-A.hmm ~/Dimensions/Monocultures/03/DC30_green_seq.fasta.transdecoder_dir/longest_orfs.pep
~/software/hmmer-3.1b2-linux-intel-x86_64/binaries/hmmscan --cpu 16 --domtblout DC40_pfam.domtblout ~/Dimensions/Databases/Pfam/Pfam-A.hmm ~/Dimensions/Monocultures/04/DC40_green_seq.fasta.transdecoder_dir/longest_orfs.pep
~/software/hmmer-3.1b2-linux-intel-x86_64/binaries/hmmscan --cpu 16 --domtblout DC50_pfam.domtblout ~/Dimensions/Databases/Pfam/Pfam-A.hmm ~/Dimensions/Monocultures/05/DC50_green_seq.fasta.transdecoder_dir/longest_orfs.pep
~/software/hmmer-3.1b2-linux-intel-x86_64/binaries/hmmscan --cpu 16 --domtblout DC60_pfam.domtblout ~/Dimensions/Databases/Pfam/Pfam-A.hmm ~/Dimensions/Monocultures/06/DC60_green_seq.fasta.transdecoder_dir/longest_orfs.pep
~/software/hmmer-3.1b2-linux-intel-x86_64/binaries/hmmscan --cpu 16 --domtblout DC70_pfam.domtblout ~/Dimensions/Databases/Pfam/Pfam-A.hmm ~/Dimensions/Monocultures/07/DC70_green_seq.fasta.transdecoder_dir/longest_orfs.pep
~/software/hmmer-3.1b2-linux-intel-x86_64/binaries/hmmscan --cpu 16 --domtblout DC80_pfam.domtblout ~/Dimensions/Databases/Pfam/Pfam-A.hmm ~/Dimensions/Monocultures/08/DC80_green_seq.fasta.transdecoder_dir/longest_orfs.pep
