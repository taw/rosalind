#!/usr/bin/env ruby

require "pp"
require "open-uri"
require "moneta"

class Uniprot
  attr_reader :key
  def initialize(key)
    @key = key
  end
  def url
    "http://www.uniprot.org/uniprot/#{key}.fasta"
  end
  def cache
    Uniprot.cache
  end
  def data
    cache[key] ||= open(url).read
  end
  def gene
    data.split("\n")[1..-1].join
  end
  def self.cache
    @cache ||= Moneta.new(:File, :dir => 'uniprot')
  end
end

if __FILE__ == $0
  ARGV.each{|key|
    puts key
    puts Uniprot.new(key).gene
  }
end
