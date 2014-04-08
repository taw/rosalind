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

n,k = STDIN.read.split.map(&:to_i)

puts(choose(n,k) * k.x! % 1_000_000)
