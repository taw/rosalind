#!/usr/bin/env ruby

require "./fasta"

@motz = {}
def motzkin(gene)
  @motz[gene] ||= begin
    return 1 if gene.size < 2
    finrev = gene[-1].tr("AUCG", "UAGC")
    # No match
    sum = motzkin(gene[0..-2])
    # Match
    (0..gene.size-2).each do |i|
      next if finrev != gene[i]
      # pp [:matching, gene, i, gene[0...i], gene[i+1..-2]]
      sum += motzkin(gene[0...i]) * motzkin(gene[i+1..-2])
    end
    sum
  end
end

gene = FASTA.read_genes[0]

puts motzkin(gene)
