#!/usr/bin/env ruby

# Find all n and k<10 where
#    floor( n*log10(k) )+1 == n

count = 0
n = 1
while (n*Math.log10(9)).floor==n-1
	(1..9).each {|k| count += 1 if (n*Math.log10(k)).floor==n-1}
	n += 1
end
puts count
