#!/usr/bin/env ruby

require "./fasta"

module Enumerable
  def sum
    inject(0, &:+)
  end
  def prod
    inject(1, &:*)
  end
end

class Integer
  def x!
    (1..self).prod
  end
end

def choose(n,k)
  n.x!/k.x!/(n-k).x!
end

rna = FASTA.read_genes[0]

a = rna.scan("A").size
c = rna.scan("C").size
g = rna.scan("G").size
u = rna.scan("U").size

a, u = [a,u].max, [a,u].min
c, g = [c,g].max, [c,g].min

puts choose(a,u) * u.x! * choose(c, g) * g.x!
