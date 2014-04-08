#!/usr/bin/env ruby

require "./fasta"

class Array
  def sum
    inject(0, &:+)
  end
end

class String
  def reverse_complement
    reverse.tr("ATCG", "TAGC")
  end
end

def hamming(a,b)
  (0...a.size).map{|i| a[i] == b[i] ? 0 : 1}.sum
end

genes = FASTA.read_genes

counts = Hash.new(0)
genes.each{|g|
  # Canonical form
  g = [g, g.reverse_complement].min
  counts[g] += 1
}
correct = counts.map{|g,c| c > 1 ? [g, g.reverse_complement] : []
}.flatten

genes.each do |g|
  next if counts[g] > 1
  next if counts[g.reverse_complement] > 1
  correct.each do |g2|
    if hamming(g, g2) == 1
      puts "#{g}->#{g2}"
      break
    end
  end
end
