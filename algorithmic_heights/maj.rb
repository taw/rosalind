#!/usr/bin/env ruby

require "pp"

n,k = STDIN.readline.split.map(&:to_i)
arys = STDIN.readlines.map{|l| l.chomp.split.map(&:to_i)}

puts arys.map{|ary|
  ary.sort!
  e = ary[ary.size/2]
  if ary.count(e) > ary.size*0.5
    e
  else
    -1
  end
}.join(" ")
