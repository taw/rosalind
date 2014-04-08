#!/usr/bin/env ruby

require "rational"
require "pp"

seta, setb = STDIN.readlines

seta = seta.split.map{|x| Rational(x)}
setb = setb.split.map{|x| Rational(x)}

rv = Hash.new(0)
seta.each{|a|
  setb.each{|b|
    rv[(a-b).abs] += 1
  }
}

r, n = rv.sort_by{|ht,k| [k,ht]}[-1]
puts n, r.to_f
