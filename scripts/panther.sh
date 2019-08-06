#!/bin/sh

# Sequentially run PANTHER on DCN0_greenORFs.fasta files

 ~/software/pantherScore2.1/pantherScore2.1.pl -l ~/Dimensions/Databases/PANTHER13.1/ -D B -V -i ~/Dimensions/Monocultures/01/DC10_TransDecoder/DC10_greenORFs.fasta -o ~/Dimensions/PANTHER/DC10_panther.out -n;

 ~/software/pantherScore2.1/pantherScore2.1.pl -l ~/Dimensions/Databases/PANTHER13.1/ -D B -V -i ~/Dimensions/Monocultures/02/DC20_TransDecoder/DC20_greenORFs.fasta -o ~/Dimensions/PANTHER/DC20_panther.out -n;

 ~/software/pantherScore2.1/pantherScore2.1.pl -l ~/Dimensions/Databases/PANTHER13.1/ -D B -V -i ~/Dimensions/Monocultures/03/DC30_TransDecoder/DC30_greenORFs.fasta -o ~/Dimensions/PANTHER/DC30_panther.out -n;

 ~/software/pantherScore2.1/pantherScore2.1.pl -l ~/Dimensions/Databases/PANTHER13.1/ -D B -V -i ~/Dimensions/Monocultures/04/DC40_TransDecoder/DC40_greenORFs.fasta -o ~/Dimensions/PANTHER/DC40_panther.out -n;

 ~/software/pantherScore2.1/pantherScore2.1.pl -l ~/Dimensions/Databases/PANTHER13.1/ -D B -V -i ~/Dimensions/Monocultures/05/DC50_TransDecoder/DC50_greenORFs.fasta -o ~/Dimensions/PANTHER/DC50_panther.out -n;

 ~/software/pantherScore2.1/pantherScore2.1.pl -l ~/Dimensions/Databases/PANTHER13.1/ -D B -V -i ~/Dimensions/Monocultures/06/DC60_TransDecoder/DC60_greenORFs.fasta -o ~/Dimensions/PANTHER/DC60_panther.out -n;

 ~/software/pantherScore2.1/pantherScore2.1.pl -l ~/Dimensions/Databases/PANTHER13.1/ -D B -V -i ~/Dimensions/Monocultures/07/DC70_TransDecoder/DC70_greenORFs.fasta -o ~/Dimensions/PANTHER/DC70_panther.out -n;

 ~/software/pantherScore2.1/pantherScore2.1.pl -l ~/Dimensions/Databases/PANTHER13.1/ -D B -V -i ~/Dimensions/Monocultures/08/DC80_TransDecoder/DC80_greenORFs.fasta -o ~/Dimensions/PANTHER/DC80_panther.out -n;
