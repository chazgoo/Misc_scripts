# -*- coding: utf-8 -*-
"""
Created on Wed May 16 10:50:43 2018

@author: Charles
"""

# Parse a simple nested JSON file to a txt file
# Takes two arguments, [1] = file in (existing JSON), [2] = file out (new txt)
# Written for Python 3.6

import json
import sys

file_in = sys.argv[1]
file_out = sys.argv[2]

outfile = open(file_out,'w')

with open(file_in) as infile:
    array = json.load(infile)

for key in array:
    
    linetowrite = str(key)+','+str(array[key])+'\n'
    outfile.write(linetowrite)

outfile.close()

