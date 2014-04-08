#!/usr/bin/env ruby

Match = {
# Proper
  %W[A U] => true,
  %W[U A] => true,
  %W[C G] => true,
  %W[G C] => true,
# Wobbly
  %W[G U] => true,
  %W[U G] => true,
}

Rnas = {}
def rnas(gene)
  Rnas[gene] ||= begin
    return 1 if gene.size < 2
    final = gene[-1]
    rest  = gene[0..-2]
    # No match
    sum = rnas(rest)
    # Matches
    (0..rest.size-4).each do |i|
      next unless Match[[final, rest[i]]]
      sum += rnas(rest[0...i]) * rnas(rest[i+1..-1])
    end
    sum
  end
end

gene = STDIN.read.chomp
# gene = "CGAUGCUAG" # -> 12
puts rnas(gene)
