#!/usr/bin/env ruby

require "moneta"
require "./fasta"

Cache = {}

class String
  def each_possible_final_cut
    final = self[-1]
    final_complement = final.tr("AUCG", "UAGC")
    n = Hash.new(0)
    (0..size-2).each do |i|
      c = self[i]
      # puts "Investigating cut of #{self} at #{i} #{n.inspect}"
      if c == final_complement && n["A"] == n["U"] && n["C"] == n["G"]
        # puts "Cut at #{i}"
        yield self[0...i], self[i+1..size-2]
      end
      n[c] += 1
    end
  end
  def count_secondary_structures
    # pp [:css, self]
    return 1 if self == ""
    unless Cache[self]
      rv = 0
      each_possible_final_cut do |a, b|
        rv += a.count_secondary_structures *
              b.count_secondary_structures
      end
      Cache[self] = rv
    end
    Cache[self]
  end
end

rna = FASTA.read_genes[0]

# pp rna

puts rna.count_secondary_structures % 1_000_000
