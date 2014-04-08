#!/usr/bin/env ruby

require "pp"

module FASTA
  def self.read(input=STDIN)
    rv = []
    input.each_line do |line|
      line.chomp!
      if line =~ />(.*)/
        rv << [$1, ""]
      else
        rv[-1][-1] << line
      end
    end
    rv
  end

  def self.read_genes(input=STDIN)
    read(input).map{|k,v| v}
  end
end

if __FILE__ == $0
  pp FASTA.read(STDIN)
end
