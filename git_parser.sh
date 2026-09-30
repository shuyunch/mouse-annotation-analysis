#!/bin/bash

gtf=Mus_musculus.GRCm38.75_chr1.gtf

# Question 1a: How many genes are annotated?
grep -v "^#" "$gtf" | awk -F"\t" '$3=="gene"' | wc -l

# Question 1b: Break the genes down by biotype
grep -v "^#" "$gtf" \
  | awk -F"\t" '$3=="gene"' \
  | sed 's/.*gene_biotype "\([^"]*\)".*/\1/' \
  | sort | uniq -c | sort -nr
