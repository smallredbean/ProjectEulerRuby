#!/usr/bin/env ruby

require "MyInteger"

totalCount = 1
primeCount = 0
num = 1
diff = 2


begin
	4.times {
		num += diff
		primeCount += 1 if num.isPrime?
		totalCount += 1
	}
	diff += 2
end while primeCount.to_f/totalCount.to_f>=0.1
puts diff-1
