#!/usr/bin/env ruby

# The problem is looking for a, b, and c where
#    ( 10*a+b )/( 10*b+c ) == a/c
# Or,
#    10*a*b == 9*a*c + bc
# Also
#    a / c < 1
#
# The limitation on a, b, and c is
#    a, b, c in [1, 2, 3, 4, 5, 6, 7, 8, 9]

require "MyInteger"

factors = Hash.new(0)
(1..9).each {|a|
	(1..9).each {|b|
		(a+1..9).each {|c|
			if 10*a*b==9*a*c+b*c
				(10*b+c).primeFactorsAndMultiplicities.each {|prime, exp|
					factors[prime] += exp #denominator
				}
				(10*a+b).primeFactorsAndMultiplicities.each {|prime, exp|
					factors[prime] -= exp #numerator
				}
			end
		}
	}
}

num = 1
factors.each {|prime, exp| num *= prime**exp if exp>0}
puts num
