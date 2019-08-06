#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr  1 13:57:16 2019
@author: cagood

Motivated by R being a pain, I'm writing this script for the purpose of building summary tables of expression and annotation data for the Dimensions project. 

This script takes 5 arguments:
    1. summary table of Kallisto data
    2. tophits from blastx vs. green UniProt
    3. transdecoder output file headers ## run grep ">" DC10_green_seq.fasta.transdecoder.pep > tdheaders.txt
    4. orthofinder output file
    5. species, "DC#0"

For 1-4, must include full path to file. Might be useful to gather these in one directory.
  
Note: input files are wildly specific to the tools I chose for this pipeline, so this is only useful for my particular dataset. 
"""

#%%
#Modules

import pandas as pd
import sys

#%%
#Expression data in as df: from summary file of Kallisto data
def exp_df(arg1):
    with open(arg1) as exp:
        exp_data = pd.read_csv(exp)

        #Formatting exp_data columns
        exp_data.drop(exp_data.columns[[0]], axis=1, inplace = True)                    #Drop artefact index column
        exp_data.drop(list(exp_data.filter(regex = '.ec')), axis = 1, inplace = True)   #Drop all columns containing ".ec"
        exp_data.rename(columns={exp_data.columns[0]:'NODE'}, inplace=True)             #Rename columns
    
    return exp_data
#%%
#Blast data in as df: tophits from blastx vs. green UniProt
def bla_df(arg2):
    with open(arg2) as bla:
        bla_data = pd.read_table(bla, sep='\t', header = None)

        #Formatting bla_data columns
        bla_data = bla_data.iloc[:, [0,2]]                              #Subset columns 0,2; NODE and blastID
        bla_data.columns = ['NODE', 'BlastID']                          #Rename columns
    
    return bla_data
#%%
#TransDecoder data in as df: transdecoded "green" data
def tdh_df(arg3):
    with open(arg3) as tdh:
        tdh_data = pd.read_table(tdh, sep='\s', header = None)

        #Formatting columns
        tdh_data = tdh_data.iloc[:, [0,4,6]]                                 #Subset columns 0,4,6; NODE, type, pfamID
        tdh_data.columns = ['NODE', 'Type','PfamID']                         #Rename columns

        #Formatting NODE
        tdh_data['NODE'] = tdh_data['NODE'].str.replace(r'>','')             #Remove ">" from NODE column
        tdh_data['NODE'] = tdh_data['NODE'].str.rsplit(r'.', 1).str[0]       #Split NODE col from right at first '.', return left half

        #Formatting PfamID
        tdh_data['PfamID'] = tdh_data['PfamID'].str.split(r',').str[2]       #Split PfamID at ',' and return 3rd field; highest scoring ID
    
    return tdh_data
#%%   
#OrthoFinder data in as df: from OrthoFinder '2nd_Run'
def otf_df(arg4, arg5):
    pep_col = arg5 + '_pep'
    with open(arg4) as otf:
        otf_data = pd.read_csv(otf, sep ='\t')

        #Formatting file
        otf_data.rename(columns={otf_data.columns[0]:'OG'}, inplace=True)       #Name unamed column
        otf_data[pep_col] = otf_data[pep_col].str.replace(r' ','')        #Remove whitespaces
        otf_data = otf_data.fillna('NA')                                        #swap nan for NA (F@#$ING float error!)

        #Explode by spec_pep column
        otf_expl = pd.DataFrame(otf_data[pep_col].str.split(',').tolist(), index=otf_data.OG).stack()    #KEY!!! Explodes species column, indexing with OG
        otf_expl = otf_expl.reset_index([0, 'OG'])                                                       #Reset index, set OG as column
        otf_expl.columns = ['OG', 'ID']                                                                  #Rename columns

    return otf_expl
#%%
#Build the final table
def build_PyRos(spec):
    #Merges - use outer joins to keep all NODEs present
    PyRos = bla_df.merge(tdh_df, on = 'NODE', how = 'outer')
    PyRos = PyRos.merge(exp_df, on = 'NODE', how = 'outer')

    # Define PyRos ID column w/ Species_Gene_Isotype from NODE
    PyRos['ID'] = PyRos['NODE'].str.split(r'_').str[6:]             #Split NODE, return fields 6 til 7 as ID
    PyRos['ID'] = PyRos['ID'].str.join('_')                         #Join entries with _
    PyRos['ID'] = spec + '_' + PyRos['ID'] + '.'                       #Add <species> to front, <.> to back

    # Merges - add OG data via left merge to PyRos, ignoring OGs not in species
    PyRos = PyRos.merge(otf_df, on = 'ID', how = 'left')

    # Replace nan with NA
    PyRos = PyRos.fillna('NA')
    
    return PyRos
#%%
#Run!
exp_df = exp_df(sys.argv[1])
bla_df = bla_df(sys.argv[2])
tdh_df = tdh_df(sys.argv[3])
otf_df = otf_df(sys.argv[4], sys.argv[5])
PyRos = build_PyRos(sys.argv[5])

PyRos.to_csv(sys.argv[5] + '_PyRos.csv', index = False)
