#!/usr/bin/env ruby

require "./fasta"

class Array
  def sum
    inject(0, &:+)
  end
  def avg
    sum.to_f/size
  end
end

def distance(a,b)
  (0...a.size).map{|i|
    a[i] == b[i] ? 0.0 : 1.0
  }.avg
end

genes = FASTA.read_genes

genes.each{|a|
  puts genes.map{|b| distance(a,b)}.join(" ")
}
