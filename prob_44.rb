#!/usr/bin/env ruby

pentagonalTable = Hash.new
pentagonalInQuestion = Hash.new
n = 1
while true
	pk = n*(3*n-1)/2

	if pentagonalInQuestion.has_key?(pk)
		puts pentagonalInQuestion[pk][1]-pentagonalInQuestion[pk][0]
		break
	end

	pentagonalTable.each_key {|pj| pentagonalInQuestion[pk+pj] = [pj, pk] if pentagonalTable[pk-pj]}
	pentagonalTable[pk] = true
	n += 1
end
