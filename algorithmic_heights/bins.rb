#!/usr/bin/env ruby

k=STDIN.readline.to_i
n=STDIN.readline.to_i
a=STDIN.readline.chomp.split.map(&:to_i)
b=STDIN.readline.chomp.split.map(&:to_i)

puts b.map{|i| j=a.index(i); j ? j+1 : -1}.join(" ")


