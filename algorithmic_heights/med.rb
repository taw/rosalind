#!/usr/bin/env ruby

require "pp"

class Array
  def median(k)
    raise "WTF" if k >= size
    pivot, = sample(1)
    a = select{|x| x<pivot}
    return a.median(k) if k < a.size

    k -= a.size
    bsz = count{|x| x==pivot}
    return pivot if k < bsz

    k -= bsz
    c = select{|x| x>pivot}
    c.median(k)
  end
end

open(ARGV[0]) do |fh|
  n   = fh.readline.to_i
  ary = fh.readline.split.map(&:to_i)
  k   = fh.readline.to_i
  p ary.median(k-1)
end
