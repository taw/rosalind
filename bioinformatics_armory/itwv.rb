#!/usr/bin/env ruby

$cache = {}

class String
  def is_interweave?(a,b)
    unless $cache.has_key?([self,a,b])
      $cache[[self,a,b]] = begin
        return self == b if a.empty?
        return self == a if b.empty?
        (a[0] == self[0] and rest.is_interweave?(a.rest, b)) or
        (b[0] == self[0] and rest.is_interweave?(a, b.rest))
      end
    end
    $cache[[self,a,b]]
  end
  def contains_interweave?(a,b)
    sz = a.size + b.size
    (0..size-sz).each do |i|
      return true if self[i, sz].is_interweave?(a,b)
    end
    false
  end
  def rest
    self[1..-1] || ""
  end
end

total, *fragments = STDIN.readlines.map(&:chomp)

fragments.each do |a|
  puts fragments.map{|b|
    total.contains_interweave?(a,b) ? 1 : 0
  }.join(" ")
end
