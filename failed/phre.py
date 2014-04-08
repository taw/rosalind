#!/usr/bin/env python3.4

import sys
from Bio import SeqIO

# path = sys.argv[1]
path = "phre.txt"
fh = open(path)
threshold = int(fh.readline())

record = SeqIO.parse(fh, 'fastq')

print(threshold)
print(record)
# print(record.letter_annotations)
