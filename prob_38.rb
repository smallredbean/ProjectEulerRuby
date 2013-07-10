#!/usr/bin/env ruby

require "MyString"

max = 0
(1...10**4).each {|n|
	string = ""
	(1..9).each {|multiplier|
		string += (n*multiplier).to_s
		break if string.length>=9
	}

	next if string.length!=9
	max = string.to_i if string.match(/0/)==nil and !string.hasCharacterInDuplicate and
		string.to_i>max
}
puts max
