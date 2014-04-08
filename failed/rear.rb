#!/usr/bin/env ruby

def convert_to_indexes(a, b)
  (0...a.size).map{|i|
    b.index(a[i])
  }
end

# v1
# def reversal_distance(a)
#   return reversal_distance(a[0..-2]) if a[-1] == a.size - 1
#   return reversal_distance(a[1..-1].map{|x|x-1}) if a[0] == 0
#   return 0 if a.empty?
#   i = a.index(0)
#   j = a.index(a.size-1)
#   x = reversal_distance(a[0..i].reverse + a[i+1..-1])
#   y = reversal_distance(a[0...j] + a[j..-1].reverse)
#   1 + [x,y].min
# end

# v2
# def each_reversal(q)
#   size = q.size
#   (0...size).each{|i|
#     (i+1...size).each{|j|
#       yield q[0...i] + q[i..j].reverse + q[j+1..-1]
#     }
#   }
# end

# def reversal_table(sz)
#   @reversal_table ||= {}
#   unless @reversal_table[sz]
#     ht = {}
#     base = (0...sz).to_a
#     ht[base] = 0
#     (1...sz).each do |i|
#       ht.dup.each do |q, j|
#         next unless j == i-1
#         each_reversal(q) do |q2|
#           p [:lol, j, q, q2]
#           ht[q2] ||= i
#         end
#       end
#     end
#     @reversal_table[sz] = ht
#   end
#   @reversal_table[sz]
# end

# def reversal_distance(a)
#   reversal_table(a.size)[a]
# end

input = STDIN.readlines.grep(/\S/).map(&:chomp).map(&:split).map{|x|x.map(&:to_i)}
distances = []
input.each_slice(2) do |a,b|
  i = convert_to_indexes(a, b)
  distances << reversal_distance(i).inspect
end

puts distances.join(" ")
