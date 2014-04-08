#!/usr/bin/env ruby

require "./fasta"

class Array
  def cartesian(other)
    rv = []
    each do |a|
      other.each do |b|
        rv << yield(a, b)
      end
    end
    rv
  end

  def kmers(cnt)
    rv = [""]
    cnt.times do
      rv = self.cartesian(rv, &:+)
    end
    rv
  end
end

class String
  def all_indexes(key)
    rv = []
    i = 0
    while true
      j = index(key, i)
      return rv unless j
      i = j+1
      rv << j+1
    end
  end
  def count_indexes(key)
    all_indexes(key).size
  end
end

gene = FASTA.read_genes[0]

alphabet = ["A", "C", "G", "T"]
kmers = alphabet.kmers(4)
puts kmers.map{|k| gene.count_indexes(k) }.join(" ")
