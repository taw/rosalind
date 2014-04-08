#!/usr/bin/env ruby

require "./fasta"
require "set"

class String
  def substrings(i)
    Set[*(0..size-i).map{|j|
      self[j,i]
    }]
  end
end

def find_lcms(data,i)
  data.map{|gene| gene.substrings(i)}.inject(&:&)
end

data = FASTA.read_genes

max_possible_size = data.map(&:size).min

(1..max_possible_size).each do |i|
  common = find_lcms(data,i).to_a
  puts common
  break if common.empty?
end
