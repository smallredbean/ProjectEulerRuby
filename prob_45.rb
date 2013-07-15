#!/usr/bin/env ruby

require "FigurateNumber"

indexT, numT = 1, FigurateNumber.triangleNumber(1)
indexP, numP = 1, FigurateNumber.pentagonalNumber(1)
indexH, numH = 1, FigurateNumber.hexagonalNumber(1)
found = 0

while true
	indexP, numP = indexP+1, FigurateNumber.pentagonalNumber(indexP+1) while numP<numT
	indexH, numH = indexH+1, FigurateNumber.hexagonalNumber(indexH+1) while numH<numT
	if numT==numP and numT==numH
		found += 1
		break if found==3
	end

	indexT, numT = indexT+1, FigurateNumber.triangleNumber(indexT+1)
end

puts numT
