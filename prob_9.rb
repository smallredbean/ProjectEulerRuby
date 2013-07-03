#!/usr/bin/env ruby

found = false

(1...1000).each {|a|
	break if found

	(a+1...1000).each{ |b|
		break if found

		c = 1000-a-b
		break if c<=b
		if a*a+b*b==c*c
			puts a*b*c
			found = true
		end
	}
}
