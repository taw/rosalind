#!/usr/bin/env ruby

STDIN.readline
as = STDIN.readline.split.map(&:to_i)
STDIN.readline
bs = STDIN.readline.split.map(&:to_i)

def merge(as, bs)
  ai, bi = 0, 0
  rv = []
  while ai != as.size or bi != bs.size
    if ai == as.size
      rv << bs[bi]
      bi += 1
    elsif bi == bs.size
      rv << as[ai]
      ai += 1
    elsif as[ai] < bs[bi]
      rv << as[ai]
      ai += 1
    else
      rv << bs[bi]
      bi += 1
    end
  end
  rv
end

puts merge(as, bs).join(" ")
