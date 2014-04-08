#!/usr/bin/env ruby

frag = STDIN.readline.chomp
gene = STDIN.readline.chomp
max_diff = STDIN.readline.to_i

locs = []
(0..gene.size-frag.size).each do |i|
  gf = gene[i, frag.size]
  diff_count = frag.split('').zip(gf.split('')).count{|a,b| a != b}
  locs << i if diff_count <= max_diff
end

puts locs.join(" ")
