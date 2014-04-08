#!/usr/bin/env ruby

require "./fasta"
require "./genetic_code"

base, *introns = FASTA.read_genes

introns.each do |intron|
  base = base.sub(intron, "")
end

puts dna_to_protein(base)
