#!/usr/bin/env ruby

require "pp"

gene = STDIN.readline.chomp
k = STDIN.readline.to_i

ht = Hash.new(0)
(0..gene.size-k).each do |i|
  ht[gene[i,k]] += 1
end

t = ht.values.max
puts ht.keys.select{|k| ht[k] == t}.sort.join(" ")
