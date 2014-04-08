#!/usr/bin/env ruby

def motif_locations(dna, motif)
  (0...dna.size).map{|i| dna[i,motif.size] == motif ? i+1 : nil}.compact
end

dna, motif = STDIN.readlines.map(&:chomp)

puts motif_locations(dna, motif).join(" ")
