#!/usr/bin/env ruby

count = Hash.new(0)

(1..1000).each{|a|
	(1..1000).each{|b|
		c = Math.hypot(a, b)
		count[a+b+c.to_i] += 1 if c.to_i==c and a+b+c.to_i<=1000
	}
}

maxKey, maxValue = 0, 0
count.each{|key, value| maxKey, maxValue = key, value if value>maxValue}
puts maxKey
