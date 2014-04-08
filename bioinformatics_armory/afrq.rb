#!/usr/bin/env ruby

puts STDIN.read.split.map(&:to_f).map{|p2|
  p = Math.sqrt(p2)
  p*(2-p)
}.join(" ")
