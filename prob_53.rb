#!/usr/bin/env ruby

# Use Pascal's Triangle

UPPERBOUND = 1000000+1
lastRow = [1] #C(1, 1)
count = 0

(2..101).each {|row|
	thisRow = Array.new(row, 1)
	(1...(thisRow.size-1)).each {|col|
		thisRow[col] = lastRow[col-1]+lastRow[col]
		thisRow[col] = UPPERBOUND if thisRow[col]>UPPERBOUND
	}
	count += thisRow.count {|value| value==UPPERBOUND}

	lastRow = thisRow
}

puts count
