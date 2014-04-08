#!/usr/bin/env ruby

require "set"

n,k = STDIN.readline.split.map(&:to_i)
graph = (0...n).map{ Set[] }

STDIN.each_line do |line|
  a,b = line.split.map(&:to_i)
  a = a-1
  b = b-1
  graph[a] << b
  graph[b] << a
end

puts graph.map{|s| s.map{|i| graph[i].size}.inject(0, &:+) }.join(" ")
