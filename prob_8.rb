#!/usr/bin/env ruby

def maxDigitProduct string, digits
	# `string` has no "0"
	# `string` has length of at least `digits`
	max = 0

	# product of the first `digits` digits
	last = 1
	(0...digits).each {|index| last *= string[index, 1].to_i}
	
	# count the next product by dividing the leftmost digit and multiplying the right most digit
	(digits...string.length).each {|index|
		last /= string[index-digits, 1].to_i
		last *= string[index, 1].to_i
		max = last if last>max
	}
	max
end

strings = File.open('prob_8.dat', 'r').read.chomp!.split('0').delete_if {|string| string.length<5}
max = 0
strings.each {|string| max = [maxDigitProduct(string, 5), max].max}
puts max

