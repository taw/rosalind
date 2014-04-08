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
end

alphabet, cnt = STDIN.readlines.map(&:chomp)

alphabet = alphabet.split
cnt = cnt.to_i

output = [""]

cnt.times do
  output = alphabet.cartesian(output, &:+)
end

puts output
