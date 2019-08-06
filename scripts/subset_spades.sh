#!/bin/sh

# Assembling DC10_R1T0 subsets
# Run from directory containing .fq files, output to directories for each pair.

~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_0.10.fq --pe1-2 DC10.R1T0_l1_2_0.10.fq -o 0.10
~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_0.10.fq --pe1-2 DC10.R1T0_l1_2_0.10.fq -o 0.10
~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_0.20.fq --pe1-2 DC10.R1T0_l1_2_0.20.fq -o 0.20
~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_0.30.fq --pe1-2 DC10.R1T0_l1_2_0.30.fq -o 0.30
~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_0.40.fq --pe1-2 DC10.R1T0_l1_2_0.40.fq -o 0.40
~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_0.50.fq --pe1-2 DC10.R1T0_l1_2_0.50.fq -o 0.50
~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_0.60.fq --pe1-2 DC10.R1T0_l1_2_0.60.fq -o 0.60
~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_0.70.fq --pe1-2 DC10.R1T0_l1_2_0.70.fq -o 0.70
~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_0.80.fq --pe1-2 DC10.R1T0_l1_2_0.80.fq -o 0.80
~/software/SPAdes-3.11.1-Linux/bin/spades.py --rna --pe1-1 DC10.R1T0_l1_1_1.fq --pe1-2 DC10.R1T0_l1_2_1.fq -o 1.00
