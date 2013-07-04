#!/usr/bin/env ruby

require "MyInteger.rb"
require "TriangularNumber.rb"

TriangularNumber.list {|number|
	if number.factorsNumber>500
		puts number
		break
	end
}
