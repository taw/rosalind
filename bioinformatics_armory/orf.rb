#!/usr/bin/env ruby

require "set"
require "./genetic_code"
require "./fasta"

def orf(data)
  (0...data.size).each{|i|
    next unless data[i..-1] =~ /\A(AUG(?:...)*?)(UAA|UAG|UGA)/
    yield rna_to_protein($1)
  }
end

gene = FASTA.read_genes[0]
rv = Set[]
orf(gene.tr("ATCG", "UAGC").reverse) do |x|
  rv << x
end
orf(gene.tr("T", "U")) do |x|
  rv << x
end
puts *rv
