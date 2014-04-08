#!/usr/bin/env ruby

require "./fasta"

s1, s2 = FASTA.read_genes

ts, tv = 0, 0
(0...s1.size).each do |i|
  a = s1[i]
  b = s2[i]
  next if a == b
  if "#{a}#{b}" =~ /[AG][AG]|[CT][CT]/
    ts += 1
  else
    tv += 1
  end
end

puts(ts.to_f/tv)
