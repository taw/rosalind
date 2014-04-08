#!/usr/bin/env ruby

require "pp"

class Array
  def longest_subseq
    # Indexed by last number
    subseqs = { -Float::INFINITY => [] }
    each do |c|
      cands = []
      subseqs.each do |u, ss|
        next if u >= c
        cands << ss + [c]
      end
      pp [:kurwa_empty, cands, subseqs, c, self] if cands.empty?
      subseqs[c] = cands.sort_by(&:length)[-1]
    end
    subseqs.values.sort_by(&:length)[-1]
  end
  def longest_rev_subseq
    map{|x| -x}.longest_subseq.map{|x| -x}
  end
end

perm = STDIN.read.split.map(&:to_i)[1..-1]
puts perm.longest_subseq.join(" ")
puts perm.longest_rev_subseq.join(" ")
