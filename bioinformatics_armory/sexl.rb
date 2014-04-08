#!/usr/bin/env ruby

puts STDIN.read.split.map(&:to_f).map{|p|
  2*p*(1-p)
}.join(" ")
