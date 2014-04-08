#!/usr/bin/env ruby

require "./fasta"

data = FASTA.read

data.each{|n1,d1|
  data.each{|n2,d2|
    next if n1 == n2
    next unless d1[-3..-1] == d2[0...3]
    puts [n1, n2].join(" ")
  }
}
