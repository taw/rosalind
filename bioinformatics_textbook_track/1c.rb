#!/usr/bin/env ruby

fragment, gene = STDIN.readlines.map(&:chomp)

puts (0...gene.size).to_a.select{|i|
  gene[i,fragment.size] == fragment
}.join(" ")

