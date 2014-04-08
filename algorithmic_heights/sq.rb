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



  def has_square?
    (1...@size).each do |a|
      @nodes[a].each do |b|
        next if a == b
        @nodes[b].each do |c|
          next if a == c
          next if b == c
          @nodes[c].each do |d|
            next if a == d
            next if b == d
            next if c == d
            return true if @nodes[d].include?(a)
          end
        end
      end
    end
    false
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
puts graphs.map{|g| g.has_square? ? 1 : -1}.join(' ')
