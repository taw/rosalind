#!/usr/bin/env ruby

require "pp"

class Array
  def sum
    inject(0, &:+)
  end
end

n,m = STDIN.read.split.map(&:to_i)

rpop = [1]
puts "#{rpop.sum} #{rpop.inspect}"
(1...n).each{|i|
  rpop = [rpop[1..-1].sum] + rpop[0, m-1]
  puts "#{i+1} #{rpop.sum}" # { }" #{rpop.inspect}"
}
