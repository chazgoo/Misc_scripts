#!/bin/sh

# Using seqtk, randomly sample paired-end reads from DC10.R1T0_l1_1 and _2 
# Sample in decreasing 10% increments from 90%-10%
# seqtk tolerates zipped files
# Run this from the same directory as the trimmed.fq.gz files!

# -s42 sets seed at 42. Keep this consistent across sample pairs

~/software/seqtk/seqtk sample -s42 DC10.R1T0_l1_1.trimmed.fq.gz 0.90 > DC10.R1T0_l1_1_0.90.fq
~/software/seqtk/seqtk sample -s42 DC10.R1T0_l1_2.trimmed.fq.gz 0.90 > DC10.R1T0_l1_2_0.90.fq

~/software/seqtk/seqtk sample -s43 DC10.R1T0_l1_1.trimmed.fq.gz 0.80 > DC10.R1T0_l1_1_0.80.fq
~/software/seqtk/seqtk sample -s43 DC10.R1T0_l1_2.trimmed.fq.gz 0.80 > DC10.R1T0_l1_2_0.80.fq

~/software/seqtk/seqtk sample -s44 DC10.R1T0_l1_1.trimmed.fq.gz 0.70 > DC10.R1T0_l1_1_0.70.fq
~/software/seqtk/seqtk sample -s44 DC10.R1T0_l1_2.trimmed.fq.gz 0.70 > DC10.R1T0_l1_2_0.70.fq

~/software/seqtk/seqtk sample -s45 DC10.R1T0_l1_1.trimmed.fq.gz 0.60 > DC10.R1T0_l1_1_0.60.fq
~/software/seqtk/seqtk sample -s45 DC10.R1T0_l1_2.trimmed.fq.gz 0.60 > DC10.R1T0_l1_2_0.60.fq

~/software/seqtk/seqtk sample -s46 DC10.R1T0_l1_1.trimmed.fq.gz 0.50 > DC10.R1T0_l1_1_0.50.fq
~/software/seqtk/seqtk sample -s46 DC10.R1T0_l1_2.trimmed.fq.gz 0.50 > DC10.R1T0_l1_2_0.50.fq

~/software/seqtk/seqtk sample -s47 DC10.R1T0_l1_1.trimmed.fq.gz 0.40 > DC10.R1T0_l1_1_0.40.fq
~/software/seqtk/seqtk sample -s47 DC10.R1T0_l1_2.trimmed.fq.gz 0.40 > DC10.R1T0_l1_2_0.40.fq

~/software/seqtk/seqtk sample -s48 DC10.R1T0_l1_1.trimmed.fq.gz 0.30 > DC10.R1T0_l1_1_0.30.fq
~/software/seqtk/seqtk sample -s48 DC10.R1T0_l1_2.trimmed.fq.gz 0.30 > DC10.R1T0_l1_2_0.30.fq

~/software/seqtk/seqtk sample -s49 DC10.R1T0_l1_1.trimmed.fq.gz 0.20 > DC10.R1T0_l1_1_0.20.fq
~/software/seqtk/seqtk sample -s49 DC10.R1T0_l1_2.trimmed.fq.gz 0.20 > DC10.R1T0_l1_2_0.20.fq

~/software/seqtk/seqtk sample -s40 DC10.R1T0_l1_1.trimmed.fq.gz 0.10 > DC10.R1T0_l1_1_0.10.fq
~/software/seqtk/seqtk sample -s40 DC10.R1T0_l1_2.trimmed.fq.gz 0.10 > DC10.R1T0_l1_2_0.10.fq
