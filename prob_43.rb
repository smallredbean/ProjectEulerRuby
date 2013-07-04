#!/usr/bin/env ruby

def hasProperty data, property
	case property
	when 3
		return data[3].to_i%2==0
	when 4
		return data[2..4].join.to_i%3==0
	when 5
		return data[5].to_i%5==0
	when 6
		return data[4..6].join.to_i%7==0
	when 7
		return data[5..7].join.to_i%11==0
	when 8
		return data[6..8].join.to_i%13==0
	when 9
		return data[7..9].join.to_i%17==0
	end
	false
end

def hasProperties data, level
	(3..level).each {|property| return false if !hasProperty(data, property)}
	true
end

def permutate data, level, &code
	if level==data.length
		yield data.join
	else
		(level...data.length).each {|index|
			data[level], data[index] = data[index], data[level]
			permutate data, level+1, &code if hasProperties data, level
			data[level], data[index] = data[index], data[level]
		}
	end
end

array = []
(0..9).each {|num| array.push num.to_s}
sum = 0
permutate(array, 0) {|numInString| sum += numInString.to_i}
puts sum
