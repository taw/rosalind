#!/usr/bin/env ruby

require "./fasta"

s,t = FASTA.read_genes

# Now find longest subsequence
Cache = {}
def ss(s,t)
  Cache[[s.size, t.size]] ||= if s.empty? or t.empty?
    ""
  elsif s[0] == t[0]
    s[0] + ss(s[1..-1], t[1..-1])
  else
    [
      ss(s, t[1..-1]),
      ss(s[1..-1], t)
    ].max_by(&:length)
  end
end

puts ss(s,t)
