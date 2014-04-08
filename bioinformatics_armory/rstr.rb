#!/usr/bin/env ruby

n, x, s = STDIN.read.split
n = n.to_i
x = x.to_f

n_gc = s.scan(/[GC]/).size
n_at = s.scan(/[AT]/).size

# p [n, x, s, n_gc, n_at]

p_s = (x/2)**n_gc * ((1-x)/2)**n_at
p_fail = 1-(1-p_s)**n

puts p_fail
