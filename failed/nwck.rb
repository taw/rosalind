#!/usr/bin/env ruby

def parse_tree(tree)
  tree = tree.sub(/;\z/, "")

end

def tree_distance(tree, a, b)
  p [tree, a, b]
  0
end

input = STDIN.readlines.map(&:chomp).grep(/\S/)
rv = []
input.each_slice(2) do |tree, nodes|
  a, b = nodes.split
  tree = parse_tree(tree)
  rv << tree_distance(tree, a, b)
end
puts rv.join(" ")
