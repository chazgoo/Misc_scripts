## Miscellanious Scripts

### [Full list](https://github.com/chazgoo/Misc_scripts/tree/master/scripts)

A collection of selected bash, awk/sed, perl, python, and R scripts I've used in various bioinformatic processes and pipelines. A number of these are used in my other (better organized, but privately held until published) repositories. I wanted a place to allow free access to my code without compromising any of my proprietary research in progress. Here it is. Oneliners will be displayed, longer scripts and workflows will be linked. 

### BASH/AWK/SED/PERL

* Making a BLAST db from UniProt files
Unzip, concatenate to new file, zip
```
gunzip uniprot*.fasta.gz 
cat uniprot*.fasta > uniprot_custom_db.fasta 
gzip uniprot*.fasta
```

* Convert uniprot_custom_db.fasta to BLAST db
```
makeblastdb -in uniprot_custom_db.fasta -dbtype prot
```

* Start a blastx job
This was the command I used when blasting reference transcriptomes against my custom database
```
nohup nice blastx -db ~/Dimensions/Databases/green_and_non.fasta -query DC10_ref_transcripts.fasta -evalue 0.00001 -num_threads 16 -outfmt "7 qseqid qlen sseqid slen qstart qend sstart send evalue bitscore length pident gaps" -out Blastx_DC10_ref.out &
```

* Assembling green/nongreen ID lists
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

* [Rosettamaker.sh](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Rosetta_maker.sh) - Serial calls of PyRosetta.py (below) via shell script. My "Rosetta" tables are basically large dataframes which link key data from all steps of my differential expression analysis pipeline. [Here,](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Stringent_RosettaMaker.sh) see similar implimentation on a stringently filtered dataset. 

* TransDecoder - credit to [Patrick Douglas](https://github.com/TransDecoder/TransDecoder/wiki). This software takes in a nucleotide fasta file, and outputs a translated protein fasta file, and operates in several steps. First, we [detect](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/TrDec_%26_HMMER.sh) the longest open reading frame, using an optional step of leveraging outputs against the complete PANTHER HMM database, returning only ORFs that score well against known HMMs. Second, we [predict](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/TrDec_predict.sh) the most likely coding regions. 

* [Fasta2Phylip.pl](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Fasta2Phylip.pl) - Convert fasta format to phylip format. Credit to [Yu Wei](http://yuweibioinfo.blogspot.com/2009/01/fasta-to-phylip-converter.html). 

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/bbduk_cleaner.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/clustalos)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/count_fasta.pl)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/fasta_oneline.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/kallisto_monos.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/kallistorunner.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/UB_kallisto.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/pep_cleaner.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/pep_cleaner2.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/seqtk.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/subset_spades.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/sort_green_fasta.sh)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/sort_nongreen_fasta.sh)

### Python

* [JSON_to_TXT.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/JSON_to_TXT.py) - converts nested JSON files to simple text files.  

* [PyRosetta.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/PyRosetta.py) - Used in several of my analytical pipelines. Consolidates various differential gene expression analysis data into a single unified "Rosetta Stone" table. Input data includes assembly ID (RNAspades), annotation (BLAST, HMMER, var. databases), expression quantification (Kallisto), DE significance values (sleuth), common orthogroups (OrthoFinder), etc. Automated with [Rosettamaker.sh](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Rosetta_maker.sh).  

* [contam_parser.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/contam_parser.py) - compare a BLAST output to a list of expected accession numbers, and create output files for matches and mismatches.  

* [nuc_comp.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/nuc_comp.py) - Calculate nucleotide composition from a linearized fasta file (i.e. - single-line-per-sequence).  

* [dinuc_comp.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/dinuc_comp.py) - Calculate dinucleotide composition from a linearized fasta file.  

* [ratios_from_json.py](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/ratios_from_json.py) - plot differential expression ratios from a JSON file containing gene expression values (modified Kallisto output).  

### R

* [8x8_RBH_analysis.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/8x8_RBH_analysis.Rmd) - Plotting basic data from and 8x8 reciprocal best blast hit analysis of my DIMENSIONS species.  

* [Biculture_Expression_Data_Extraction.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Biculture_Expression_Data_Extraction.Rmd) - A kludgy method of extracting relevant gene expression data from Kallisto runs on DIMENSIONS biculture RNAseq.  

* [CG_CpG.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/CG_CpG.Rmd) - Calculating and plotting CG/CpG content for the DIMENSIONS transcriptomes.  

* [Common_Orthogroups.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Common_Orthogroups.Rmd) - Identifying and outputting common gene orthogroups detected with OrthoFinder, from my DIMENSIONS analysis.  

[DEseq2_exploring_pt-i.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/DEseq2_exploring_pt-i.Rmd) - Differential gene expression analysis via DESeq2, exploring, part 1 of 3. [Part 2](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/DEseq2_exploring_pt-ii.Rmd). [Part 3](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/DEseq2_exploring_pt-iii.Rmd).

[DEseq2_pairwise-timepoints.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/DEseq2_pairwise-timepoints.Rmd) - Continued exploration with DESeq2. For timecourse expression analysis, individual tests for consecutive pairs of timepoints, rather than generating a single model for all timepoints.  

[LDEs.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/LDEs.Rmd) - Calculating "Log Difference in Expression" of biculture data in the DIMENSIONS analysis. Ultimately decided to use log ratios of expression, but keeping this here for posterity. 

[Mono_exp_data.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Mono_exp_data.Rmd) - In the DIMENSIONS pipeline: Assembly (RNAspades) -> Annotation -> Read-mapping/quantification (Kallisto) -> DE analysis (Sleuth). This script is used to consolidate multiple timepoibnts of expression data into a single table for each species. 

[Mono_Rosettas_exploring.sleuth.analysis.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Mono_Rosettas_exploring.sleuth.analysis.Rmd) - In the DIMENSIONS pipeline: Assembly (RNAspades) -> Annotation -> Read-mapping/quantification (Kallisto) -> DE analysis (Sleuth). Here, I'm playing with sleuth output data, basic plots. 

[Mono_growth_curves.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Mono_growth_curves.Rmd) - Plotting logistic growth curves for DIMENSIONS monocultures

[Redundancies.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Redundancies.Rmd) - Testing the effect of removing redundant or repeated transcripts from the dataset. 

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Sleuth_exploring.rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Sleuth_exploring_monos.pairwise.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Sleuth_exploring_pt-ii.rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Sleuth_monos.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Stringent_DC10_DE.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Stringent_PyRos_Cleanup.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Stringent_timecourse_analyses.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/WGCNA_myData_pt1.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/WGCNA_myData_pt2.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/WGCNA_myData_pt3.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/aa_over_time_pt.i.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/aa_over_time_pt.ii.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/final_aa_over_time.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/allGenes_Venns.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/commonOG_Venns.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/baseRsubsetting.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/commonOG_volcanos.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/contam.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/exploring_timecourse_data.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/loop_in_and_multiplot.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/stringentRefTs.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/timecourse_monos.Rmd)

[](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/upsets.Rmd)

