#!/usr/bin/env ruby

require "./graph"

g = Graph.new

component = Hash[(1..g.size).map{|i| [i,i]}]

while true
  changed = false
  g.edges.each do |a,b|
    next if component[b] == component[a]
    component[b] = component[a] = [component[a], component[b]].min
    changed = true
  end
  break unless changed
end

pp component.values.uniq.size
