#!/usr/bin/env ruby

def triangleNumber index
	index*(index+1)/2
end
def pentagonalNumber index
	index*(3*index-1)/2
end
def hexagonalNumber index
	index*(2*index-1)
end

indexT, numT = 1, triangleNumber(1)
indexP, numP = 1, pentagonalNumber(1)
indexH, numH = 1, hexagonalNumber(1)
found = 0

while true
	indexP, numP = indexP+1, pentagonalNumber(indexP+1) while numP<numT
	indexH, numH = indexH+1, hexagonalNumber(indexH+1) while numH<numT
	if numT==numP and numT==numH
		found += 1
		break if found==3
	end

	indexT, numT = indexT+1, triangleNumber(indexT+1)
end

puts numT
