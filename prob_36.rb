#!/usr/bin/env ruby

require "MyInteger"

sum = 0
(1...10**6).each {|n| sum += n if n.isPalindromic? and n.isPalindromic?(2)}
puts sum
