#!/bin/sh

#Using TransDecoder.longOrfs and HMMER/PfamA output DCN0_pfam.domtblout, run TransDecoder.predict to identify longest ORF for every transcript, filtered by match to PfamA db (previously filtered by custom BLAST db). 

# C. Goodman
# 4.2.18

# Run this from 'scratch', sort output upon completion.
# Must call :set fileformat=unix in vim to remove windows ^Ms

# TransDecoder.Predict

cd ~/Dimensions/Monocultures/02/DC20_TransDecoder

~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.Predict -t ~/Dimensions/Monocultures/02/DC20_green_sorted/DC20_green_seq.fasta --retain_pfam_hits ~/Dimensions/Monocultures/02/DC20_TransDecoder/DC20_pfam.domtblout

cd ~/Dimensions/Monocultures/03/DC30_TransDecoder

~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.Predict -t ~/Dimensions/Monocultures/03/DC30_green_sorted/DC30_green_seq.fasta --retain_pfam_hits ~/Dimensions/Monocultures/03/DC30_TransDecoder/DC30_pfam.domtblout 

cd ~/Dimensions/Monocultures/04/DC40_TransDecoder

~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.Predict -t ~/Dimensions/Monocultures/04/DC40_green_sorted/DC40_green_seq.fasta --retain_pfam_hits ~/Dimensions/Monocultures/04/DC40_TransDecoder/DC40_pfam.domtblout 

cd ~/Dimensions/Monocultures/05/DC50_TransDecoder

~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.Predict -t ~/Dimensions/Monocultures/05/DC50_green_sorted/DC50_green_seq.fasta --retain_pfam_hits ~/Dimensions/Monocultures/05/DC50_TransDecoder/DC50_pfam.domtblout 

cd ~/Dimensions/Monocultures/06/DC60_TransDecoder

~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.Predict -t ~/Dimensions/Monocultures/06/DC60_green_sorted/DC60_green_seq.fasta --retain_pfam_hits ~/Dimensions/Monocultures/06/DC60_TransDecoder/DC60_pfam.domtblout 

cd ~/Dimensions/Monocultures/07/DC70_TransDecoder

~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.Predict -t ~/Dimensions/Monocultures/07/DC70_green_sorted/DC70_green_seq.fasta --retain_pfam_hits ~/Dimensions/Monocultures/07/DC70_TransDecoder/DC70_pfam.domtblout 

cd ~/Dimensions/Monocultures/08/DC80_TransDecoder

~/software/TransDecoder-TransDecoder-v5.0.2/TransDecoder.Predict -t ~/Dimensions/Monocultures/08/DC80_green_sorted/DC80_green_seq.fasta --retain_pfam_hits ~/Dimensions/Monocultures/08/DC80_TransDecoder/DC80_pfam.domtblout  
