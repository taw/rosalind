#!/usr/bin/env ruby

require "./fasta"

def consensus_stats(data)
  rv = []
  (0...data[0].size).each do |i|
    rv[i] = Hash.new(0)
    data.each{|row|
      rv[i][row[i]] += 1
    }
  end
  rv
end

def most_likely(stats)
  stats.map{|x|
    x.map{|k,v| [-v,k]}.sort[0][1]
  }.join
end

data = FASTA.read.map{|k,v| v}
stats = consensus_stats(data)
puts most_likely(stats)
puts "A: " + stats.map{|x| x["A"]}.join(" ")
puts "C: " + stats.map{|x| x["C"]}.join(" ")
puts "G: " + stats.map{|x| x["G"]}.join(" ")
puts "T: " + stats.map{|x| x["T"]}.join(" ")
