#!/usr/bin/env ruby

require "MyString"

sum = 0
File.open('names.txt', 'r').read.chomp.gsub(/"/, '').split(',').sort.each_with_index{|name, index|
	sum += name.alphabeticalValue*(index+1)
}
puts sum
