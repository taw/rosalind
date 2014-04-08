#!/usr/bin/env ruby

require "./genetic_code"

gene, prot = STDIN.readlines.map(&:chomp)

gene.split(//).each_cons(3*prot.size) do |f|
  f = f.join
  next unless dna_to_protein(f) == prot or dna_to_protein(f.reverse.tr("ATCG", "TAGC")) == prot
  puts f
end

