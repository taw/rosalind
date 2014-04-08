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
      [b.size, "-" * b.size, b]
    elsif b.empty?
      [a.size, a, "-" * a.size]
    elsif a == b
      [0, a, b]
    elsif a[0] == b[0]
      n,ax,bx = solution(a.rest, b.rest)
      [n, a[0] + ax, b[0] + bx]
    else
      possible = []
      # insert a
      n,ax,bx = solution(a, b.rest)
      possible << [n+1, "-#{ax}", "#{b[0]}#{bx}"]

      # insert b
      n,ax,bx = solution(a.rest, b)
      possible << [n+1, "#{a[0]}#{ax}", "-#{bx}"]

      # change
      n,ax,bx = solution(a.rest, b.rest)
      possible << [n+1, "#{a[0]}#{ax}", "#{b[0]}#{bx}"]

      possible.min_by{|n,ax,bx| n}
    end
  end
end

a,b = FASTA.read.map{|k,v| v}

n,ax,bx = solution(a,b)
puts n,ax,bx
