#!/usr/bin/env ruby

require "set"


input = STDIN.readlines.map(&:chomp)
s = (1..input[0].to_i).to_a
a = input[1].scan(/\d+/).map(&:to_i)
b = input[2].scan(/\d+/).map(&:to_i)

[
  a | b,
  a & b,
  a - b,
  b - a,
  s - a,
  s - b,
].each do |x|
  puts "{" + x.join(", ") +  "}"
end
