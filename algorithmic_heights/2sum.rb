#!/usr/bin/env ruby

require "pp"

class Array
  def two_sum
    ht={}
    each_with_index do |a,i|
      (ht[a] ||= []) << (i+1)
    end
    if ht[0] and ht[0].size >= 2
      return ht[0][0,2].sort
    end

    ht.each do |a,(idx,_)|
      next if a == 0
      rv_idx, = ht[-a]
      return [idx,rv_idx].sort if rv_idx
    end
    return [-1]
  end
end


STDIN.readline
arys = STDIN.readlines.map{|line| line.split.map(&:to_i)}

arys.each do |ary|
  puts ary.two_sum.join(" ")
end
