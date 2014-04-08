#!/usr/bin/env ruby

def probability(n, gene, p_gc)
  n_gc = gene.scan(/[GC]/).count
  n_at = gene.scan(/[AT]/).count

  # Expected number, assume independence, foolishly
  p_loc = (p_gc/2)**n_gc * ((1-p_gc)/2)**n_at

  (n-gene.size+1) * p_loc
end

n, gene, *ps = STDIN.read.split
n = n.to_i
ps = ps.map(&:to_f)

puts ps.map{|pr|  "%.20f" % probability(n, gene, pr) }.join(" ")
