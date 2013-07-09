#!/usr/bin/env ruby

def getRecurringCycleLength numerator, denominator
	positionOf = Hash.new
	position = 0

	begin
		numerator %= denominator
		return 0 if numerator==0
		return position-positionOf[numerator] if positionOf[numerator]!=nil

		positionOf[numerator] = position
		position += 1
		numerator *= 10
	end while true
end

maxNum, maxLen=1, 0
(2..1000).each{|num|
	len = getRecurringCycleLength(1, num)
	maxNum, maxLen = num, len if len>maxLen
}
puts maxNum
