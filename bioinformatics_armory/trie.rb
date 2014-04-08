#!/usr/bin/env ruby

require "pp"

class Trie
  def initialize
    @root = {}
  end

  def <<(str)
    n = @root
    str.split(//).each{|c|
      n[c] ||= {}
      n = n[c]
    }
  end

  def print!(node=@root, label=1)
    x = label
    node.each{|k,subnode|
      x += 1
      puts "#{label} #{x} #{k}"
      x = print!(subnode, x)
    }
    x
  end
end

genes = STDIN.readlines.map(&:chomp)
trie = Trie.new
genes.each{|g| trie << g}
trie.print!


