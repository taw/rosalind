#!/usr/bin/env ruby

require "set"

graph = []

STDIN.readline
STDIN.each_line do |line|
  a,b = line.split.map(&:to_i)
  (graph[a] ||= Set[]) << b
  (graph[b] ||= Set[]) << a
end

puts graph[1..-1].map(&:size).join(" ")
