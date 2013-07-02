#!/usr/bin/env ruby

require "MyInteger"

max = 0
600851475143.primeFactors.each {|num| max = num}
puts max

