#!/bin/sh

# Written 10.16.18, to automate Kallisto for DC20-DC80

cd ~/Dimensions/Kallistos/Indices;
~/software/kallisto_linux-v0.44.0/kallisto index -i DC20_kal_indx ~/Dimensions/Monocultures/02/DC20_transcripts.fasta;
~/software/kallisto_linux-v0.44.0/kallisto index -i DC30_kal_indx ~/Dimensions/Monocultures/03/DC30_transcripts.fasta;
~/software/kallisto_linux-v0.44.0/kallisto index -i DC40_kal_indx ~/Dimensions/Monocultures/04/DC40_transcripts.fasta;
~/software/kallisto_linux-v0.44.0/kallisto index -i DC50_kal_indx ~/Dimensions/Monocultures/05/DC50_transcripts.fasta;
~/software/kallisto_linux-v0.44.0/kallisto index -i DC60_kal_indx ~/Dimensions/Monocultures/06/DC60_transcripts.fasta;
~/software/kallisto_linux-v0.44.0/kallisto index -i DC70_kal_indx ~/Dimensions/Monocultures/07/DC70_transcripts.fasta;
~/software/kallisto_linux-v0.44.0/kallisto index -i DC80_kal_indx ~/Dimensions/Monocultures/08/DC80_transcripts.fasta;

cd ~/Dimensions/TrimmedReads;
~/scripts/kallistorunner.sh ~/Dimensions/Kallistos/Indices/DC20_kal_indx DC20;
~/scripts/kallistorunner.sh ~/Dimensions/Kallistos/Indices/DC30_kal_indx DC30;
~/scripts/kallistorunner.sh ~/Dimensions/Kallistos/Indices/DC40_kal_indx DC40;
~/scripts/kallistorunner.sh ~/Dimensions/Kallistos/Indices/DC50_kal_indx DC50;
~/scripts/kallistorunner.sh ~/Dimensions/Kallistos/Indices/DC60_kal_indx DC60;
~/scripts/kallistorunner.sh ~/Dimensions/Kallistos/Indices/DC70_kal_indx DC70;
~/scripts/kallistorunner.sh ~/Dimensions/Kallistos/Indices/DC80_kal_indx DC80;
