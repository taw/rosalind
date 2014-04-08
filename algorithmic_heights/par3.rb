#!/usr/bin/env ruby

ary = STDIN.readlines[-1].split.map(&:to_i)

pivot = ary[0]
ary = ary.select{|x| x < pivot} + ary.select{|x| x == pivot} + ary.select{|x| x>pivot}
puts ary.join(" ")
