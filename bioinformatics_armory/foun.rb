#!/usr/bin/env ruby

require "pp"

module Enumerable
  def sum
    inject(0, &:+)
  end
  def prod
    inject(1, &:*)
  end
end

class Integer
  def x!
    (1..self).prod
  end
end

def choose(n,k)
  n.x!/k.x!/(n-k).x!
end

def log10(x)
  Math.log(x) / Math.log(10)
end

class Population
  attr_reader :n, :dist
  def initialize(n,m)
    @n = n
    @dist = (0..2*n).map{|i|
      i == m ? 1.0 : 0.0
    }
  end
  def at_least_recessive(k)
    (0..2*n-k).map{|i|
      @dist[i]
    }.sum
  end
  # Chance that m-population turns into k-population
  def magic(m,k)
    p2 = m/(2.0*n)
    choose(2*n,k) * p2**k * (1.0-p2)**(2*n-k)
  end
  def iterate!
    ndist = (0..2*n).map{ 0.0 }
    @dist.each_with_index{|p1,m|
      (0..2*n).each{|k|
        ndist[k] += p1*magic(m,k)
      }
    }
    @dist = ndist
  end
end

n, m = STDIN.readline.split.map(&:to_i)
as = STDIN.readline.split.map(&:to_i)
rv = (0...m).map{ [] }

as.each_with_index do |a,i|
  population = Population.new(n, a)
  m.times{|j|
    population.iterate!
    rv[j] << log10(population.dist[0])
  }
end

puts rv.map{|x| x.join(" ")}
