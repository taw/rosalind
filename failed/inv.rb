#!/usr/bin/env ruby

ary = STDIN.readlines[-1].split.map(&:to_i)
cnt = 0
(0...ary.size).each do |i|
  (i+1...ary.size).each do |j|
    cnt += 1 if ary[i] > ary[j]
  end
end
p cnt
