#!/usr/bin/env ruby

require "./fasta"

class String
  def rest
    self[1..-1] || ""
  end
end

$cache = {}
def solution(a,b)
  $cache[[a,b]] ||= begin
    if a.empty?
      [b.size, 1]
    elsif b.empty?
      [a.size, 1]
    elsif a == b
      [0, 1]
    else
      possible = Hash.new(0)
      if a[0] == b[0]
        n,m = solution(a.rest, b.rest)
        possible[n] += m
      end

      # insert a
      n,m = solution(a, b.rest)
      possible[n+1] += m

      # insert b
      n,m = solution(a.rest, b)
      possible[n+1] += m

      # change
      n,m = solution(a.rest, b.rest)
      possible[n+1] += m

      possible.sort[0]
    end
  end
end

a,b = FASTA.read.map{|k,v| v}

n,m = solution(a,b)
puts n,m,m%134_217_727
