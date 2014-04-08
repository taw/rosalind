#!/usr/bin/env ruby

require "pp"
require "set"

class Graph
  attr_reader :nodes, :edges, :size
  def initialize(io=STDIN)
    @size,k = io.readline.split.map(&:to_i)
    # node 0 does nothing
    @nodes = (0..@size).map{ {} }
    @edges = []
    io.each_line do |line|
      a,b,c = line.chomp.split.map(&:to_i)
      @edges << [a,b,c]
      @nodes[a][b] = c
    end
  end
end

def propagate(distance, a, b, c)
  return unless distance[a]
  nd = distance[a] + c
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
  g.edges.each do |a,b,c|
    changed = true if propagate(distance, a, b, c)
    changed = true if propagate(distance, b, a, c)
  end
  break unless changed
end

puts distance.sort.map{|k,v| v || 'x'}.join(" ")
