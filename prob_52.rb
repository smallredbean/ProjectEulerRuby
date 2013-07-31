#!/usr/bin/env ruby

num = 1
while true
	signature = num.to_s.chars.sort.join
	break if (2*num).to_s.chars.sort.join==signature and
			(3*num).to_s.chars.sort.join==signature and
			(4*num).to_s.chars.sort.join==signature and
			(5*num).to_s.chars.sort.join==signature and
			(6*num).to_s.chars.sort.join==signature
	num += 1
end

puts num
