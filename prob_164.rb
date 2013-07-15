#!/usr/bin/env ruby

# The idea is to build a legitimate 20-digit number by
# appending a valid digit to a legitimate 19-digit number
# so that the appended digit is the least significant digit.
#
# However, in stead of constructing a number "physically,"
#    the following algorithm does counts only.
# Specifically, a count table is maintained to keep
# how many legitimate numbers are endning in a pattern of two digits.
# For example,
#    countTable[xy] is n_0 where 0<=x, y<=9
# Then, for this particular record, we can infer that
# given a digit d such that x+y+d<=9,
# there are n_0 numbers ending in "yd" by
# appending the digit d to those numbers ending in "xy"

# initialization considering 2-digit numbers
count = Hash.new(0)
(1..9).each {|a|
	(0..(9-a)).each {|b|
		count[a*10+b] = 1
	}
}

# appending 18 digits
18.times {
	newCount = Hash.new(0)
	count.each {|num, count|
		(0..(9-num/10-num%10)).each {|n|
			newCount[num%10*10+n] += count
		}
	}
	count = newCount
}

sum = 0
count.each {|x, counts| sum += counts}
puts sum

