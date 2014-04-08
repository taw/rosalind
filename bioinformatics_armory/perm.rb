#!/usr/bin/env ruby

require "pp"

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

class Array
  def each_permutation
    if empty?
      yield []
    else
      a = self[0]
      self[1..-1].each_permutation do |sp|
        (0..sp.size).each do |j|
          pre = sp[0...j]
          post = sp[j..-1]
          yield pre + [a] + post
        end
      end
    end
  end
end

n = STDIN.read.to_i
puts n.x!
(1..n).to_a.each_permutation do |perm|
  puts perm.join(" ")
end
