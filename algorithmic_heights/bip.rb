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

  def add_color(coloring, n, c)
    cc = 3-c
    return if coloring[n] == c
    raise "FAIL" if coloring[n] == cc
    coloring[n] = c
    nodes[n].each do |u|
      add_color(coloring, u, cc)
    end
  end

  def bipartite?
    coloring = Hash[(1..@size).map{|i| [i, nil]}]
    (1..@size).each do |n|
      next if coloring[n]
      begin
        add_color(coloring, n, 1)
      rescue
        return false
      end
    end
    true
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
puts graphs.map{|g| g.bipartite? ? 1 : -1}.join(' ')
