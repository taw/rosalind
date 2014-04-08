#!/usr/bin/env ruby

require "pp"

class Array
  def cartesian(other)
    rv = []
    each do |a|
      other.each do |b|
        rv << yield(a, b)
      end
    end
    rv
  end

  def kmers(cnt)
    rv = [""]
    cnt.times do
      rv = self.cartesian(rv, &:+)
    end
    rv
  end

  def kmers0(cnt)
    ["_", *self]
      .kmers(cnt)
      .map{|x|x.sub(/_+\z/, "")}
      .reject{|x| x =~ /_/ or x.size == 0}
  end
end

alphabet = STDIN.read.split
max = alphabet.pop.to_i

puts alphabet.kmers0(max)
