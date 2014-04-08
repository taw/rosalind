#!/usr/bin/env ruby

sz, *edges = STDIN.read.split.map(&:to_i)

puts sz - edges.size/2 - 1
