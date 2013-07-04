#!/usr/bin/env ruby

def getNameValue name
	base = ?a-1
	value = 0
	name.downcase.each_byte {|ascii| value += ascii-base}
	value
end

sum = 0
File.open('names.txt', 'r').read.chomp.gsub(/"/, '').split(',').sort.each_with_index{|name, index|
	sum += getNameValue(name)*(index+1)
}
puts sum
