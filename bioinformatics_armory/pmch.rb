#!/usr/bin/env ruby

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

require "pp"
require "./fasta"

rna = FASTA.read_genes[0]

a = rna.scan("A").size
c = rna.scan("C").size

puts a.x! * c.x!
