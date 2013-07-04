#!/usr/bin/env ruby

def daysIn month, year
	case month
	when 1, 3, 5, 7, 8, 10, 12
		return 31
	when 4, 6, 9, 11
		return 30
	when 2
		return 29 if year%400==0 # leap year
		return 28 if year%100==0
		return 29 if year%4==0 # leap year
		return 28
	end

	0
end

sundays = 0
whichDay = 1 # 1 Jan 1900 was a Monday
(1..12).each {|month| whichDay += daysIn month, 1900}

(1901..2000).each {|year|
	(1..12).each {|month|
		whichDay += daysIn month, year
		sundays += 1 if whichDay%7==0
	}
}

puts sundays
