#!/usr/bin/env ruby

module Enumerable
  def sum
    inject(0, &:+)
  end
  def prod
    inject(1, &:*)
  end
end

def log10(x)
  Math.log(x) / Math.log(10)
end

class Integer
  def x!
    (1..self).prod
  end
end

def choose(n,k)
  n.x!/k.x!/(n-k).x!
end

def solution(i, n)
  c = (i..n).map{|j| choose(n,j)}.sum
  log10(c/2.0**n)
end

n = ARGV[0].to_i*2

puts (1..n).map{|i| solution(i,n).round(3)}.join(" ")
