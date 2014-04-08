#!/usr/bin/env ruby

ary = STDIN.readlines[-1].split.map(&:to_i)

pivot = ary.shift
ary = ary.select{|x| x <= pivot} + [pivot] + ary.select{|x| x>pivot}
puts ary.join(" ")
