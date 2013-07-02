#!/usr/bin/env ruby

require "MyInteger"

sum = 0
(1...1000).each {|num| sum += num if 3.isFactorOf?(num) or 5.isFactorOf?(num)}
puts sum
