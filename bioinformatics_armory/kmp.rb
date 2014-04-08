#!/usr/bin/env ruby

require "./fasta"
gene = FASTA.read_genes[0]

rv = [0]
(1...gene.size).each{|i|
  last = rv[-1]
  if last == 0
    if gene[i] == gene[0]
      rv << 1
    else
      rv << 0
    end
  elsif gene[i] == gene[last]
    rv << last + 1
  else
    # Complex case here
    best = 0
    (0..last).each do |z|
      best = z if  gene[0, z] == gene[(i-z+1)..i]
    end
    rv << best
  end
}
puts rv.join(" ")

# (0...gene.size).each{|i|
#   puts "#{i}: #{gene[i]} #{rv[i]}"
# }
