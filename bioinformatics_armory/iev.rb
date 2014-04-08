#!/usr/bin/env ruby

require "pp"

# AA-AA
# AA-Aa
# AA-aa
# Aa-Aa
# Aa-aa
# aa-aa

def mix!(cnt, ap, bp)
  @aa += cnt * ap * bp
  @ab += cnt * (1-ap) * bp
  @ab += cnt * ap * (1-bp)
  @bb += cnt * (1-ap) * (1-bp)
end

@aa, @ab, @bb = 0, 0, 0

counts = STDIN.read.split.map(&:to_i).map{|x| x*2}

mix! counts[0], 1.0, 1.0
mix! counts[1], 1.0, 0.5
mix! counts[2], 1.0, 0.0
mix! counts[3], 0.5, 0.5
mix! counts[4], 0.5, 0.0
mix! counts[5], 0.0, 0.0

puts @aa+@ab
