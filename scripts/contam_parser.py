# -*- coding: utf-8 -*-
"""
Created on Mon Jan 29 09:37:50 2018
Python v3.6

@author: Charles Goodman

BLAST parser for DIMENSIONS analysis - step 1, contaminant isolation

BLAST ouput files are compared to a list of accession numbers to determine matches

This script: 
    1. Read in subject_accessions.txt (argv[1]) and BLAST_output.fasta (argv[2])
    2. Create output files for matches (argv[3]) and mismatches (argv[4])
    2. Add accessions from subject_accessions.txt* to subject_dict{}
    3. Iterate lines of BLAST_output.fasta and compare IDs to subject_dict{}
        a. Header lines (#) are skipped
        b. Matching ID writes line to matches
        c. Non-matching ID writes line to mismatches
        
*Prior to running, subject_accessions.txt can be generated externally using AWK:
awk -F '[| ]' '/^>/ { print $2}' < subject_database.fasta > subject_accessions.txt
"""
import sys

# define globals
subjects = open(sys.argv[1], "r")   # Read in subject_accessions.txt file, as arg 1
BLAST_out = open(sys.argv[2], "r")  # Read in BLAST_output.fasta file, as arg 2
matches = open(sys.argv[3], "w")    # Name a new file for match output, as arg 3 
mismatches = open(sys.argv[4], "w") # Name a new file for mismatch output, as arg 4
subject_list = []                   # 'subject_list' is used to format subject_accessions from arg 1
subject_dict = {}                   # 'subject_dict' holds accession numbers as keys

# checkmatch() extracts an accession number for each line of BLAST output
# accession number is checked against 'subject_dict' - returns True if present, False if not
def checkmatch(line):
    field = line.rstrip().split("\t")
    fullID = field[2]
    IDsplit = fullID.split("|")
    accession = str(IDsplit[1])
    if accession in subject_dict:
        ismatch = True
    else:
        ismatch = False
    return(ismatch)

# 'subjects' is formatted and each accession added to 'subject_dict' as a key
for line in subjects:
    line = line.strip()
    subject_list.append(line)
    
subject_dict = subject_dict.fromkeys(subject_list)

# For each line in 'BLAST_out', check against 'subject_dict'
# If 'BLAST_out' accession is found in 'subject_dict', write line to 'matches'
# Otherwise, write line to 'mismatches'
for BLASTline in BLAST_out:   
    if BLASTline[0] == "#":
        continue
    else: 
        match = checkmatch(BLASTline)
        if match == True:
            matches.write(BLASTline)
        else:
            mismatches.write(BLASTline)
            
# Cleanup
subjects.close()
BLAST_out.close()
matches.close()
mismatches.close()