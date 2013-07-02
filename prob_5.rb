#!/usr/bin/env ruby

require "MyInteger"

numFactors = Hash.new(0)
(1..20).each {|num|
	num.primeFactorsAndMultiplicities.each {|factor, multiplicity|
		numFactors[factor] = multiplicity if numFactors[factor]<multiplicity
	}
}
num = 1
numFactors.each {|factor, multiplicity| multiplicity.times {num *= factor}}
puts num

