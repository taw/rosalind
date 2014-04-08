#!/usr/bin/env ruby

require "./graph"

def propagate(distance, a, b)
  return unless distance[a]
  nd = distance[a] + 1
  if not distance[b] or distance[b] > nd
    distance[b] = nd
    true
  else
    false
  end
end

g = Graph.new

distance = Hash[(1..g.size).map{|i| [i,nil]}]
distance[1] = 0

while true
  changed = false
  g.edges.each do |a,b|
    changed = true if propagate(distance, a, b)
  end
  break unless changed
end

puts distance.sort.map{|k,v| v || -1}.join(" ")
