#!/usr/bin/env ruby

class Integer
	def hasIrrationalSquareRoot
		root = Math.sqrt self
		return root!=root.to_i
	end
end

def findSquareRootPeriod number
	#numerator = 1
	denominator = Math.sqrt(number).to_i

	n, d = 1, denominator
	stepCount = 0
	while true
		stepCount += 1
		_n = (number-d**2)/n
		_q = ((Math.sqrt(number)+d)/_n).to_i
		_d = _q*_n-d

		break if [_n, _d]==[1, denominator]
		n, d = _n, _d
	end
	return stepCount
end


count = 0
1.upto(10000) {|n|
	if n.hasIrrationalSquareRoot
		count += 1 if findSquareRootPeriod(n)%2==1
	end
}
puts count
