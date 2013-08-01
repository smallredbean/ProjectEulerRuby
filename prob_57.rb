#!/usr/bin/env ruby

count = 0
lastN = 0 # numerator
lastD = 1 # denominator

1000.times {
	fractionN = lastD
	fractionD = 2*lastD+lastN
	count += 1 if (fractionN+fractionD).to_s.length>fractionD.to_s.length

	lastD = fractionD
	lastN = fractionN
}
puts count
