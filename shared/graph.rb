#!/usr/bin/env ruby

require "pp"
require "set"

class Graph
  attr_reader :nodes, :edges, :size
  def initialize(io=STDIN)
    @size,k = io.readline.split.map(&:to_i)
    # node 0 does nothing
    @nodes = (0..@size).map{ Set[] }
    @edges = []
    io.each_line do |line|
      a,b = line.chomp.split.map(&:to_i)
      @edges << [a,b]
      @nodes[a] << b
      @nodes[b] << a
    end
  end
end
