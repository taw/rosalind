#!/usr/bin/env ruby

def isort(ary)
  steps = 0
  (1...ary.size).each do |i|
    k = i
    while k > 0 and ary[k] < ary[k-1]
      ary[k-1], ary[k] = ary[k], ary[k-1]
      k -= 1
      steps += 1
    end
  end
  steps
end

STDIN.readline
ary = STDIN.readline.split.map(&:to_i)

p isort(ary)
