#!/usr/bin/env ruby

require "./uniprot"

class String
  def all_indexes(key)
    rv = []
    i = 0
    while true
      j = index(key, i)
      return rv unless j
      i = j+1
      rv << j+1
    end
  end
end

data = STDIN.readlines.map(&:chomp)

data.each do |key|
  gene = Uniprot.new(key).gene
  idxs = gene.all_indexes(/N[^P][ST][^P]/)
  unless idxs.empty?
    puts key
    puts idxs.join(" ")
  end
end
