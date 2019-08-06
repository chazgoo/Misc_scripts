"""
cagood.10.2.3.py
Author: Charles Goodman
Date: 11.16.17

Versions:
Python v3.6
pandas v0.21.0

Input: As argument, input.fas [1]
Output: Dinucleotide composition and frequency by sequence and position 

!!!
Currently, positional data processing is commented out, only dinucleotide composition is returned. 
!!!

NOTE: Multi-lined fasta format must be pre-processed using the following command (which converts sequence to single lines per entry)

awk '/^>/ {printf("\n%s\n",$0;next; } { printf("%s",$0);} END {printf("\n");}' < file.fas | tail -n +2 > out.fasta
"""

import sys
import pandas as pd

"""
User-defined functions and global vars
"""

# Dinucleotide compositon for each line of fasta sequence is generated
# Input = line of fasta sequence as str(seq)
# For each index, str(nuc) is added to dict as {nuc, 1}, or value += 1
# Output = {Dinucleotide, count}
def nuc_count(seq):
    seq = seq.replace("-","")
    counts = {}
    for i in range(len(seq)-1):
        nuc = seq[i:i+2] 
        if nuc in counts:
            counts[nuc] += 1
        else:
            counts[nuc] = 1
    return counts

# Dinucleotides by position are identified for each line of fasta sequence
# Input = line of fasta sequence as str(seq)
# For each index, the str(nuc_pos) is added to dict as {index, nuc_pos}
# Gaps, "-", are skipped
# Output = {index, dinucleotide}
def pos_count(seq):
    positions = {}
    for i in range(len(seq)-1):   
        nuc_pos = seq[i:i+2]
        if "-" in nuc_pos:
            continue
        else:
            positions[i] = nuc_pos
    return positions

# Composition frequency is calculated for each sequence
# Input = dict produced by nuc_count(), as nuc_counts{}
# For each {dinucleotide, count} pair, key = nuc, val = count
# Frequency = val/total seq length
# Output = {dinucleotide, frequency}
def freq_count(nuc_counts):
    freqs = {}
    for key, val in nuc_counts.items():
        nuc = key
        freq = (val/(length - 1))
        freqs[nuc] = round(freq, 2)
    return freqs

#Global variables defined
fasta = open(sys.argv[1], "r")  # fasta defined as argv[1]
countlist = []                  # list of dicts produced by nuc_count
poslist = []                    # list of dicts produced by pos_count
freqlist = []                   # list of dicts produced by freq_count
indecies = []                   # list of seq header lines from fasta

"""
Script
"""

for line in fasta:
    if line[0] == ">":                              # Header lines: append seq name to indecies[]
        indecies.append(line.replace("\n",""))
        continue
    else:
        line = line.rstrip()                        # Sequence line is formatted
        length = len(line)                          # len(line) stored for frequency calculation
        countdict = nuc_count(line)                 # line is sent to nuc_count, returned as countdict
        countlist.append(countdict)                 # countdict is appended to countlist
        freqlist.append(freq_count(countdict))      # countdict is sent to freq_count, returned and appended to freqlist
       
        # Positional data processing

       ##  posdict = pos_count(line)                   # line is sent to pos_count, returned as posdict
       ##  poslist.append(posdict)                     # posdict is appended to poslist

"""
Dataframes
"""
# df is built from countlist, rows indexed by seq name
count_df = pd.DataFrame(countlist, index=[indecies], dtype=object)

# df is built from freqlist, rows indexed by seq name 
freq_df = pd.DataFrame(freqlist, index=[indecies], dtype=object)

# Positional data processing

# df is built from poslist, where pd.value_counts sums nucleotides at each index
# Column indexes are raised by 1 to reflect nucleotide position
## pos_df = pd.DataFrame(poslist, dtype=int).apply(pd.value_counts)
## pos_df.columns = pos_df.columns + 1

# df is built from pos_df
# frequencies calculated for value/col.total
## pos_freq_df = pos_df
## tot = pos_df.sum()
## pos_freq_df = pos_freq_df / tot

"""
Output
"""

#Print formatted dataframes
print("Input file: " + sys.argv[1] + "\n")
print("Alignment Length: " + str(length) + "\n")
print("Nucleotide composition:")
print(count_df.fillna("0"))
print("\n" + "Nucleotide composition frequency:")
print(freq_df.fillna("-"))

count_df.to_csv(sys.argv[1] + "_dinuc_count.tsv", sep='\t')
freq_df.to_csv(sys.argv[1] + "_dinuc_freq.tsv", sep='\t')

# Positional data processing

## print("\n" + "Nucleotides by position:")
## print(pos_df.fillna("0"))
## print("\n" + "Nucleotide frequency by position:")
## print(pos_freq_df.fillna("-"))

#Cleanup
fasta.close()
