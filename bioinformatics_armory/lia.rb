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

def choose(n,k)
  n.x!/k.x!/(n-k).x!
end

def bin(n,k,p)
  choose(n,k) * p**k * (1-p)**(n-k)
end

k, n = STDIN.read.split.map(&:to_i)

# Each gene comes from Aa Bb individual eventually
# So for absolutely everyone:
# p_Aa = 0.5
# p_Bb = 0.5
# p_Aa_Bb = 0.25

u = 2**k
pmf = (0..u).map{|j| bin(u, j, 0.25) }

puts pmf[n..-1].sum
