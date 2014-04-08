#!/usr/bin/env ruby

require "pp"

genes = STDIN.readlines.map(&:chomp)
graph = {}

genes[1..-1].each do |gene|
  graph[gene[0..-2]] = gene[-1]
end

# pp graph

rv = genes[0]
rsz = rv.size - 1

until graph.empty?
  nx = rv[-rsz..-1]
  g = graph.delete(nx)
  # pp [rv, nx, g]
  rv << g
end

puts rv[rsz..-1]
