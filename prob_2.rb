#!/usr/bin/env ruby

require "Fibonacci"
require "MyInteger"

sum = 0
Fibonacci.upto(4000000) {|num| sum += num if num.isEven?}
puts sum
