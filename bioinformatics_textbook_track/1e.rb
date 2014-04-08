#!/usr/bin/env ruby

require "pp"

gene = STDIN.read.chomp

skews = Hash.new{|ht,k| ht[k] = []}
skew = 0
(0...gene.size).each do |i|
  skew += 1 if gene[i] == "G"
  skew -= 1 if gene[i] == "C"
  skews[skew] << (i+1)
end

puts skews.sort_by{|k,v| v}[-1][1].join(" ")
