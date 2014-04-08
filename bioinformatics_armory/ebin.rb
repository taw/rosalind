#!/usr/bin/env ruby

n = STDIN.readline.to_i
pk = STDIN.readline.split.map(&:to_f)

puts pk.map{|p| n*p}.join(" ")
