#!/usr/bin/env ruby

require "./fasta"

data = FASTA.read_genes[0].scan(/./)

(4..12).each do |l|
  data.each_cons(l).with_index do |s,i|
    s = s.join
    sr = s.reverse.tr("ATCG", "TAGC")
    next unless s == sr
    puts "#{i+1} #{l}"
  end
end
