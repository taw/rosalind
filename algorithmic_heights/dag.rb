#!/usr/bin/env ruby

require "set"
require "pp"

class Graph
  attr_reader :size, :edges, :nodes
  def initialize(size, edges)
    @size = size
    @edges = edges
    @nodes = Hash[(1..@size).map{|i| [i, Set[]]}]
    @edges.each do |a,b|
      @nodes[a] << b
      @nodes[b] << a
    end
  end



  def acyclic?
    reachable = Hash[(1..@size).map{|i| [i, Set[]]}]
    while true
      changed = false
      @edges.each do |a,b|
        nr = reachable[b] | Set[a] | reachable[a]
        next if nr == reachable[b]
        reachable[b] = nr
        return false if reachable[b].include?(b)
      end
      break unless changed
    end
    return true
  end
end

def read_graphs(path)
  data = open(path).read.split(/\s+/).map(&:to_i)
  data << nil
  rv = (0...data.shift).map{
    n = data.shift
    k = data.shift
    Graph.new(n, (0...k).map{ [data.shift, data.shift] })
  }
  raise "WTF #{data.inspect}" unless data == [nil]
  rv
end

graphs = read_graphs(ARGV[0])
puts graphs.map{|g| g.acyclic? ? 1 : -1}.join(' ')
