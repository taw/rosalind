#!/usr/bin/env ruby

require "pp"

def log_gc_chance(gc, n_at, n_cg)
  Math.log10((1-gc)/2.0) * n_at +
  Math.log10(gc/2.0) * n_cg
end

gene, *ary = STDIN.read.split
ary = ary.map(&:to_f)
n_at = gene.scan(/[AT]/).size
n_cg = gene.scan(/[CG]/).size

# pp [n_at, n_cg, ary]

puts ary.map{|gc|
  log_gc_chance(gc, n_at, n_cg)
}.join(" ")
