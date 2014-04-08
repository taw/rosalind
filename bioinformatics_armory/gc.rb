#!/usr/bin/env ruby

require "pp"

def read_data
  rv = []
  STDIN.each_line do |line|
    line.chomp!
    if line =~ />(.*)/
      rv << [$1, ""]
    else
      rv[-1][-1] << line
    end
  end
  rv
end

perc, name = read_data.map{|name, nucl| [100.0 * nucl.scan(/[CG]/).size / nucl.size, name]}[-1]
puts "#{name}"
puts perc
