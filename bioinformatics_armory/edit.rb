#!/usr/bin/env ruby

require "./fasta"

@dist = {}
def edit_distance(a, b)
  @dist[[a,b]] ||= begin
    return 0 if a == b
    return edit_distance a[1..-1], b[1..-1] if a[0] == b[0]
    return edit_distance a[0..-2], b[0..-2] if a[-1] == b[-1]

    return b.size if a.empty?
    return a.size if b.empty?

    [
      edit_distance(a[0..-1], b[1..-1]),
      edit_distance(a[1..-1], b[0..-1]),
      edit_distance(a[1..-1], b[1..-1]),
    ].min + 1
  end
  # Well, that's absolute max at least, lol
  # a.size + b.size
end

a, b = FASTA.read_genes
puts edit_distance(a,b)

__END__
PLEASANT
 LEASANT
 MEASANT
 MEASAN
 MEA  N
