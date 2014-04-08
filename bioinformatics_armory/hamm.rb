#!/usr/bin/env ruby

def hamm(a,b)
  (0...a.size).map{|i| a[i] == b[i] ? 0 : 1}.inject(0, &:+)
end

lines = STDIN.readlines.map(&:chomp)
puts hamm(lines[0], lines[1])
