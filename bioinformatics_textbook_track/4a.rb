#!/usr/bin/env ruby

k = STDIN.readline.to_i
gene = STDIN.readline.chomp

puts gene.split('').each_cons(k).map(&:join).sort
