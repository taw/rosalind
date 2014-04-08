#!/usr/bin/env ruby

require "./fasta"

def gluability(a,b)
  min_overlap = [(a.size+1)/2, (b.size+1)/2].max
  max_overlap = [a.size, b.size].min
  (min_overlap..max_overlap).to_a.reverse.each{|j|
    next unless a[-j..-1] == b[0, j]
    return j
  }
  return nil
end

def find_overlaps(data)
  rv = {}
  data.each_with_index do |a,ai|
    data.each_with_index do |b,bi|
      next if ai == bi
      ga = gluability(a,b)
      next unless ga
      warn "#{ai} already can be glued" if rv[ai]
      rv[ai] = [bi, ga]
    end
  end
  rv
end

def start_idx(data, overlaps)
  starts = (0...data.size).to_a - overlaps.map{|k,(o,l)| o}
  warn "#{starts.size} starts possible" unless starts.size == 1
  starts[0]
end

def reconstruct(data, overlaps)
  i = start_idx(data, overlaps)
  rv = data[i]
  while true
    # puts "Codon #{i} !"
    return rv unless overlaps[i]
    i, l = overlaps[i]
    rv += data[i][l..-1]
  end
  rv
end

data = FASTA.read_genes
overlaps = find_overlaps(data)

puts reconstruct(data, overlaps)
