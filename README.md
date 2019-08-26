## Miscellanious Scripts

A collection of selected bash, awk/sed, perl, python, and R scripts I've used in various bioinformatic processes and pipelines. A number of these are used in my other (better organized, but privately held until published) repositories. I wanted a place to allow free access to my code without compromising any of my proprietary research in progress. Here it is. Oneliners will be displayed, longer scripts will be linked.

### BASH/AWK/SED/PERL

Making a BLAST db from UniProt files
Unzip, concatenate to new file, zip
```
gunzip uniprot*.fasta.gz 
cat uniprot*.fasta > uniprot_custom_db.fasta 
gzip uniprot*.fasta
```

Convert uniprot_custom_db.fasta to BLAST db
```
makeblastdb -in uniprot_custom_db.fasta -dbtype prot
```

Start a blastx job
This was the command I used when blasting reference transcriptomes against my custom database
```
nohup nice blastx -db ~/Dimensions/Databases/green_and_non.fasta -query DC10_ref_transcripts.fasta -evalue 0.00001 -num_threads 16 -outfmt "7 qseqid qlen sseqid slen qstart qend sstart send evalue bitscore length pident gaps" -out Blastx_DC10_ref.out &
```

Assembling green/nongreen ID lists
```
# Pull header lines from "green" fasta data
grep '^>' green.fasta > green_heads.txt  

# Pull field 2, IDs, from green fasta headers
awk -F '[| ]' '/^>/ { print $2}' < green.fasta > green_IDs.txt  

# Pull field 3, Accession #s, from green fasta headers 
awk -F '[| ]' '/^>/ { print $3}' < green.fasta > green_accessions.txt
```

Some commands I used to follow progress of BLAST jobs
```
# Show number of unique headers in a fasta file 
grep -c '^>' DC10_transcripts.fasta  

# Pause and resume a background process 
KILL -STOP [pid] 
KILL -CONT [pid]  

# Count number of lines in a file 
wc -l file.txt

# Count number of entries in a fasta file
grep ">" file.fa | wc -l

#Pull the top hits from a BLAST output file
awk '!seen[$1]++' Blastx_DC10_ref.out > DC10_TopHits
```

Working with fasta and TSV files
```
# Convert standard multi-line fasta to linearized single-line fasta: 
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < file.fas | tail -n +2 > out.fasta  

# Print columns from tsv file (used to obtain green_fasta IDs, for example) 
awk '{print $1}' *.txt > collapsed_output.txt  

# Extract sequences from fasta by ID 
perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ids.file fasta.file
```

[Rosettamaker.sh](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Rosetta_maker.sh) - Serial calls of PyRosetta.py via shell script

### Python

[JSON_to_TXT.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/JSON_to_TXT.py) - converts nested JSON files to simple text files.  

[PyRosetta.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/PyRosetta.py) - Used in several of my analytical pipelines. Consolidates various differential gene expression analysis data into a single unified "Rosetta Stone" table. Input data includes assembly ID (RNAspades), annotation (BLAST, HMMER, var. databases), expression quantification (Kallisto), DE significance values (sleuth), common orthogroups (OrthoFinder), etc. Automated with [Rosettamaker.sh](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Rosetta_maker.sh). 

[contam_parser.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/contam_parser.py) - compare a BLAST output to a list of expected accession numbers, and create output files for matches and mismatches. 

[nuc_comp.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/nuc_comp.py) - Calculate nucleotide composition from a linearized fasta file (i.e. - single-line-per-sequence).

[dinuc_comp.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/dinuc_comp.py) - Calculate dinucleotide composition from a linearized fasta file.

[ratios_from_json.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/ratios_from_json.py) - plot differential expression ratios from a JSON file containing gene expression values (modified Kallisto output)




### R
