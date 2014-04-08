#!/usr/bin/env ruby

require "pp"
require "set"

gene = STDIN.readline.chomp
k,l,t = STDIN.readline.chomp.split.map(&:to_i)

ht = {}
(0..gene.size-k).each do |i|
  f=gene[i,k]
  (ht[f] ||= []) << i
end

res = Set[]
ht.each do |f,is|
  (t-1...is.size).each do |j|
    s = is[j-t+1]
    e = is[j]
    d = e - s + k
    p f:f,s:s,e:e,d:d,cnt:gene[s,d].scan(f).size
    res << f if d <= l
  end
end

puts res.sort.join(" ")
