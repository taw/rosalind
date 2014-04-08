#!/usr/bin/env ruby

require "set"

def add!(gene)
  @graph << [gene[0..-2], gene[1..-1]]
end

input = STDIN.readlines.map(&:chomp)

@graph = Set[]

input.each do |gene|
  add! gene
  add! gene.reverse.tr("ATCG", "TAGC")
end

@graph.each do |a,b|
  puts "(#{a}, #{b})"
end
