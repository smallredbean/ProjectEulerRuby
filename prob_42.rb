#!/usr/bin/env ruby

def isTriangleWord word
	value = 2*word.alphabeticalValue
	n = Math.sqrt(value).to_i
	return true if n*(n+1)==value
	false
end

require "MyString"
count = 0
File.open('words.txt', 'r').read.chomp.gsub(/"/, '').split(',').each {|word|
	count += 1 if isTriangleWord word
}
puts count
