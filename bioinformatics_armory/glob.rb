#!/usr/bin/env ruby

require "./fasta"
require "./blosum62"

class String
  def rest
    self[1..-1] || ""
  end
end

$cache = {}
def solution(a,b)
  $cache[[a,b]] ||= begin
    if a.empty?
      -5*b.size
    elsif b.empty?
      -5*a.size
    elsif a[0] == b[0]
      n = solution(a.rest, b.rest)
      Blosum[a[0]][b[0]] + n
    else
      possible = []
      # insert a
      possible << solution(a, b.rest)-5

      # insert b
      possible << solution(a.rest, b)-5

      # change
      possible << solution(a.rest, b.rest) + Blosum[a[0]][b[0]]

      possible.max
    end
  end
end

a,b = FASTA.read.map{|k,v| v}

puts solution(a,b)
