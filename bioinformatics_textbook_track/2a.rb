#!/usr/bin/env ruby

require "./genetic_code"

gene = STDIN.readline.chomp

puts rna_to_protein(gene)
