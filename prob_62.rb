#!/usr/bin/env ruby

count = Hash.new()

num = 1
while 
	key = (num*num*num).to_s.chars.sort.join
	if count[key]==nil
		count[key] = [1, num*num*num]
	else
		count[key][0] += 1
	end

	if count[key][0]==5
		puts count[key][1]
		break
	end
	num += 1
end
