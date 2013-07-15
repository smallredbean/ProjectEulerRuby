#!/usr/bin/env ruby

require "MyInteger"

puts (1...10000).count {|num| num.isLychrelUnderIterations? 50}
