#!/usr/bin/env ruby

sumOfSquares = 0
sum = 0
(1..100).each {|num|
	sum += num
	sumOfSquares += num*num
}
puts sum*sum-sumOfSquares
