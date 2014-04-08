#!/usr/bin/env ruby

require "pp"

def mix(u,v,ug,vg)
  @tot += u*v
  @aa += u*v*ug*vg
  @ab += u*v*ug*(1.0-vg)
  @ab += u*v*(1.0-ug)*vg
  @bb += u*v*(1.0-ug)*(1.0-vg)
end

aa,ab,bb = STDIN.read.split.map(&:to_i)
n = (aa+ab+bb)

@aa = 0
@ab = 0
@bb = 0
@tot = 0

mix(aa, aa-1, 1, 1)
mix(aa, ab, 1, 0.5)
mix(aa, bb, 1, 0)

mix(ab, aa, 0.5, 1)
mix(ab, ab-1, 0.5, 0.5)
mix(ab, bb, 0.5, 0)

mix(bb, aa, 0, 1)
mix(bb, ab, 0, 0.5)
mix(bb, bb-1, 0, 0)

pp (@aa+@ab) / @tot
