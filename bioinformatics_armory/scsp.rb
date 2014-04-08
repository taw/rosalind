#!/usr/bin/env ruby

@ss={}
def supersequence(a,b)
  @ss[[a,b]] ||= begin
    return a if b.empty?
    return b if a.empty?
    return a[0] + supersequence(a[1..-1], b[1..-1]) if a[0] == b[0]
    return supersequence(a[0..-2], b[0..-2]) + a[-1] if a[-1] == b[-1]

    v1 = a[0] + supersequence(a[1..-1], b)
    v2 = b[0] + supersequence(a, b[1..-1])
    [v1,v2].min_by(&:size)
  end
end

a, b = STDIN.readlines.map(&:chomp)
puts supersequence(a, b)
