## Miscellanious Scripts

### [Full list](https://github.com/chazgoo/Misc_scripts/tree/master/scripts)

A collection of selected bash, awk/sed, perl, python, and R scripts I've used in various bioinformatic processes and pipelines. A number of these are used in my other (better organized, but privately held until published) repositories. I wanted a place to allow free access to my code without compromising any of my proprietary research in progress. Here it is, in no particular order. Oneliners will be displayed, longer scripts and workflows will be linked. 

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

* Some commands I used to follow progress of BLAST jobs
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

* Working with fasta and TSV files
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

* [bbduk_cleaner.sh](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/bbduk_cleaner.sh) - Scripted use of bbduk, a trimming tool within the [bbmap](https://sourceforge.net/projects/bbmap/) suite. Here I trimmed raw paired-end reads of low quality and artefact adapter sequence. Implementation is specific to the namimg schema for my project, but the idea is sound. 

* [clustalos](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/clustalos) - Scripted terminal-operation of [clustal omega](http://www.clustal.org/omega/), a multiple sequence alignment algorithm.

* [count_fasta.pl](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/count_fasta.pl) - Credit to Joseph Fass & Brad Sickler. Calculate N25/50/75 of assembly data in fasta format. 

* [fasta_oneline.sh](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/fasta_oneline.sh) - Copypasta serial runs of an awk line to linearize a series of fasta files. 

* Kallisto - Credit to [Lior Pachter et al.](https://pachterlab.github.io/kallisto/), this algorithm is a method of quantifying gene expression with RNAseq data. Comparable to RSEM, edgeR, limma, Salmon, etc... This one is new, fast, and bootstrappable; used extensively in my transcriptomics pipelines. A [kludgy](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/kallisto_monos.sh) copypasta version, and a more elegant [loop](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/kallistorunner.sh) version. Both are tailored to my specific name schema, but the latter is easily adjusted for other datasets, as seen [here](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/UB_kallisto.sh).

* [pep_cleaner.sh](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/pep_cleaner.sh) - A series of awk calls I used to modify the output headers from TransDecoder. Another version [here](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/pep_cleaner2.sh). These might be useful for review if trying to remember how to use awk, but were otherwise written to be wildly specific to my needs. 

* [seqtk.sh](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/seqtk.sh) - I wanted to see how coverage affected transcriptome completeness. I used [seqtk](https://github.com/lh3/seqtk) to randomly sample paired-end reads from the total dataset. The random subsets (10%, 20%, ...100% of reads) were then assembled with [RNAspades](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/subset_spades.sh). This was pretty cool, and worked better than expected. The program itself has a number of useful tools for parsing/processing fasta and fastq data. 

* [Sorting by ID](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/sort_green_fasta.sh) - here I used an awk line to pull fasta headers, and sorted them with a perl line based on whether the ID showed up in a list. [Here](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/sort_nongreen_fasta.sh) is an alternate implementation. 

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

* [Common_Orthogroups.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Common_Orthogroups.Rmd) - Identifying and outputting common gene orthogroups detected with [OrthoFinder](https://github.com/davidemms/OrthoFinder), from my DIMENSIONS analysis.  

* [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) - Software for differential gene expression analysis, credit to Love, Anders, and Huber. This program takes quant data from Kallisto (or other read-mapping software) via [tximport](http://bioconductor.org/packages/release/bioc/html/tximport.html), estimates variance-mean dependence in count data from high-throughput sequencing assays, and tests for differential expression based on a model using the negative binomial distribution. Comparable to the kallisto-specific sleuth. I performed a series of exploratory tests on my data: [Part 1](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/DEseq2_exploring_pt-i.Rmd), [Part 2](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/DEseq2_exploring_pt-ii.Rmd), [Part 3](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/DEseq2_exploring_pt-iii.Rmd). My data are a time series (4 timepoints), and here I've treated time as a continuous variable, estimating a single model for the entire timecourse. I also wanted to test consecutive pairs of timepoints, in more of a control/test structure - where each pair of timepoints has an associated model. That effort can be seen [here](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/DEseq2_pairwise-timepoints.Rmd). 

* [Sleuth](https://github.com/pachterlab/sleuth) - Credit to Lior Pachter et al. Sleuth is an alternative to DESeq2, for determining significance in DE analysis. Specifically built for Kallisto output, and able to leverage Kallisto's bootstrap data in estimating FELV models. In contrast to DESeq2's negative binomial dist, Kallisto estimates a linear model.
  - [Exploring](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Sleuth_exploring.rmd), T1 vs T3 comparison
  - [Exploring pt 2](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Sleuth_exploring_pt-ii.rmd), full timecourse model, using day-of-sequencing as parameter
  - [Pairwise timepoints](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Sleuth_exploring_monos.pairwise.Rmd), rather than a single model for all timepoints, generating a model for each consecutive pair of timepoints
  - [All monocultures](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Sleuth_monos.Rmd), analyses of all 8 monocultures, rather than a single example
  - [Final Timecourse](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/timecourse_monos.Rmd), generating a timecourse model for each monoculture
  - [Final pairwise](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Stringent_DC10_DE.Rmd), how I approached analyses, with DC10 as an example. The other species are available in the DIMENSIONS repository (currently private
  - [Mono_Rosettas_exploring.sleuth.analysis.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Mono_Rosettas_exploring.sleuth.analysis.Rmd), here, I'm playing with sleuth output data, basic plots. 
  - [exploring_timecourse_data.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/exploring_timecourse_data.Rmd)

* [LDEs.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/LDEs.Rmd) - Calculating "Log Difference in Expression" of biculture data in the DIMENSIONS analysis. Ultimately decided to use log ratios of expression, but keeping this here for posterity. 

* [Mono_exp_data.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Mono_exp_data.Rmd) - In the DIMENSIONS pipeline: Assembly (RNAspades) -> Annotation -> Read-mapping/quantification (Kallisto) -> DE analysis (Sleuth). This script is used to consolidate multiple timepoints of expression data into a single table for each species. 

* [Mono_growth_curves.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Mono_growth_curves.Rmd) - Plotting logistic growth curves for DIMENSIONS monocultures with [GrowthCurver](https://cran.r-project.org/web/packages/growthcurver/vignettes/Growthcurver-vignette.html)

* [Redundancies.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Redundancies.Rmd) - Testing the effect of removing redundant or repeated transcripts from the dataset. 

* [Stringent_PyRos_Cleanup.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/Stringent_PyRos_Cleanup.Rmd) - Removing NA rows from summary tables. This could have been done in any number of ways. 

* [WGCNA](https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/Rpackages/WGCNA/) - Playing with "Weighted Gene Cluster Network Analysis", unsupervised machine learning/clustering of gene coexpression networks. The dataset I have on hand isn't quite appropriate for this technique (too few repeats), but it was an interesting exercise. 
  - [Part 1](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/WGCNA_myData_pt1.Rmd)
  - [Part 2](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/WGCNA_myData_pt2.Rmd)
  - [Part 3](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/WGCNA_myData_pt3.Rmd)

* Amino acid usage over time - Less interesting than I'd hoped, but still useful
  - [Part 1](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/aa_over_time_pt.i.Rmd)
  - [Part 2](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/aa_over_time_pt.ii.Rmd)
  - [Part 3](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/final_aa_over_time.Rmd)

* Venn Diagrams - using the aptly-named [VennDiagram](https://cran.r-project.org/web/packages/VennDiagram/index.html)
  - [all genes](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/allGenes_Venns.Rmd)
  - [common orthogroups](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/commonOG_Venns.Rmd)
  
* [Upset plots](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/upsets.Rmd) - for when Venn diagrams are too unweildy - i.e. more than 4 groups. Works really nicely!

* [Subsetting](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/baseRsubsetting.Rmd) in base R

* [Volcano plots](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/commonOG_volcanos.Rmd) representing differential gene expression across pairs of time points

* [Contamination](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/contam.Rmd) - looking at GC content in assembly data to determine whether multiple species are present

* [loop_in_and_multiplot.Rmd](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/loop_in_and_multiplot.Rmd) - very useful method of using a loop to read in multiple files of the same type. Multiplot allows multiple plots to be displayed in a single output. 

* [Filtering reference transcriptomes](https://github.com/chazgoo/Misc_scripts/blob/master/scripts/stringentRefTs.Rmd) - applying various filters to my Rosetta tables. 


