#!/usr/bin/env ruby

def firstNonzeroProduct array, counts
	startIndex = 0
	begin
		last = 1
		(startIndex...startIndex+counts).each{|index|
			last *= array[index]
			if last==0
				startIndex = index+1
				break
			end
		}
	end while last==0 and startIndex+counts<=array.length
	
	[startIndex, last]
end

def maxArrayProduct array, counts
	# `array` has length of at least `counts`
	# `array` may have 0's

	# find the very first non-zero product
	startIndex, last = firstNonzeroProduct array, counts
	max = last

	# count product by dividing the last and multiplying the newest
	# need to handle possible 0's
	while startIndex+counts<array.length
		last /= array[startIndex]
		last *= array[startIndex+counts]

		if last==0
			startIndex += counts
			indexShift, last = firstNonzeroProduct array[startIndex..-1], counts
			startIndex += indexShift
		end
		startIndex += 1

		max = last if last>max
	end

	max
end

data = []
File.open('prob_11.dat', 'r').each {|line|
	data.push []
	line.chomp.split(' ').each {|number| data.last.push number.to_i}
}

max = 1
# left <-> right
data.each {|array| max = [maxArrayProduct(array, 4), max].max}
# up <-> down
(0...data[0].length).each {|colIndex|
	array = []
	(0...data.length).each {|rowIndex| array.push data[rowIndex][colIndex]}
	max = [maxArrayProduct(array, 4), max].max
}
# \ diagonal
rowIndex = 0
(0...data[0].length-3).each {|colIndex|
	array = []
	(0...data.length-colIndex).each {|shift| array.push data[rowIndex+shift][colIndex+shift]}
	max = [maxArrayProduct(array, 4), max].max
}
colIndex = 0
(1...data.length-3).each {|rowIndex|
	array = []
	(0...data.length-rowIndex).each {|shift| array.push data[rowIndex+shift][colIndex+shift]}
	max = [maxArrayProduct(array, 4), max].max
}
# / diagonal
rowIndex = 0
(3...data[0].length).each {|colIndex|
	array = []
	(0..colIndex).each {|shift| array.push data[rowIndex+shift][colIndex-shift]}
	max = [maxArrayProduct(array, 4), max].max
}
colIndex = data[0].length-1
(1...data.length-3).each{|rowIndex|
	array = []
	(0...data.length-rowIndex).each {|shift| array.push data[rowIndex+shift][colIndex-shift]}
	max = [maxArrayProduct(array, 4), max].max
}
puts max
