#!/usr/bin/env ruby

AA = Hash[*%W[
  A   71.03711
  C   103.00919
  D   115.02694
  E   129.04259
  F   147.06841
  G   57.02146
  H   137.05891
  I   113.08406
  K   128.09496
  L   113.08406
  M   131.04049
  N   114.04293
  P   97.05276
  Q   128.05858
  R   156.10111
  S   87.03203
  T   101.04768
  V   99.06841
  W   186.07931
  Y   163.06333
]]
AA.each{|k,v| AA[k]=v.to_f}

input = STDIN.readlines.map(&:to_f)

rv = ""
input.each_cons(2) do |a,b|
  w = b-a
  aa = AA.sort_by{|k,v| (v-w).abs}[0][0]
  rv << aa
end
puts rv
