#!/usr/bin/env ruby

# This actually computes maximum non-overlapping matching

require "./fasta"

Cache = {}
class String
  def each_possible_final_cut(&blk)
    final = self[-1]
    final_complement = final.tr("AUCG", "UAGC")
    # n = Hash.new(0)
    (0..size-2).each do |i|
      c = self[i]
      if c == final_complement # && n["A"] == n["U"] && n["C"] == n["G"]
        yield self[0...i], self[i+1..size-2]
      end
      # n[c] += 1
    end
  end
  # RV: [bonds_count, combinations_count]
  def count_secondary_structures
    Cache[self] ||= compute_count_secondary_structures
  end
  def compute_count_secondary_structures
    # pp [:testing, self]
    return [0, 1] if size < 2
    rv = Hash.new(0)
    rv[0] = 1
    each_possible_final_cut do |a, b|
      # p [:maybe_cut, a, b]
      ai, ac = a.count_secondary_structures
      bi, bc = b.count_secondary_structures
      rv[ai+bi+1] += ac*bc
    end
    ci, cc = self[0..-2].count_secondary_structures
    rv[ci] += cc
    # pp [self, rv]
    rv.max
  end
end

rna = FASTA.read_genes[0]

pp rna.count_secondary_structures
