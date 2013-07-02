#!/usr/bin/env ruby

require "MyInteger"

max = 0
(100..999).each {|n1|
	(100..999).each{|n2|
		max = n1*n2 if n1*n2>max and (n1*n2).isPalindromic?
	}
}
puts max 

