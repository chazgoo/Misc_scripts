### Some useful BASH, PERL, & AWK commands

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

#Pull the top hits from a BLAST output file
awk '!seen[$1]++' Blastx_DC10_ref.out > DC10_TopHits
```

Working with fasta and TSV files
```
# Convert oneline fasta to multi-line: 
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < file.fas | tail -n +2 > out.fasta  

# Print columns from tsv file (used to obtain green_fasta IDs, for example) 
awk '{print $1}' *.txt > collapsed_output.txt  

# Extract sequences from fasta by ID 
perl -ne 'if(/^>(\S+)/){$c=$i{$1}}$c?print:chomp;$i{$_}=1 if @ARGV' ids.file fasta.file
```
