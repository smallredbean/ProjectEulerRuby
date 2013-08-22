#!/usr/bin/env ruby

def getSquareRoot2 nth=1
	denominator = 1
	numerator = 0
	nth.downto(2) {|term|
		e = 1
		e = 2*term/3 if term%3==0

		#denominator, numerator = e*denominator+numerator, denominator
		#tmpN = e.to_i*denominator+numerator
		tmpN = numerator
		e.downto(1) {|x| tmpN += denominator}

		numerator = denominator
		denominator = tmpN
	}
	numerator += denominator+denominator
	return numerator, denominator
end

numerator, denominator = getSquareRoot2 100
sum = 0
numerator.to_s.each_char {|ch| sum += ch.to_i}
puts sum

