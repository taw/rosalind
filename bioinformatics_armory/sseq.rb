#!/usr/bin/env ruby

require "./fasta"

s,t = FASTA.read_genes

i = 0
rv = []
t.split(//).each{|c|
  j = s.index(c, i)
  rv << j+1
  i = j + 1
}
puts rv.join(" ")
