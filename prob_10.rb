#!/usr/bin/env ruby

require "Prime"

sum = 0
Prime.upto(2000000) {|prime| sum += prime}
puts sum
