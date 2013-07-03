class Prime
	def Prime.within from, to, priorPrimes=[]
		if from>2 and priorPrimes==[]
			priorPrimes = Prime.within 2, from-1
		end

		# update the table with previous prime
		table = Hash.new(true)
		priorPrimes.each {|prime|
			newFrom = [(from/prime.to_f).ceil*prime, prime*prime].max
			newFrom.step(to, prime) {|num| table[num] = false}
		}

		# generate primes in [from, to]
		primes = []
		prime = from
		while true
			prime += 1 until table[prime]==true
			break if prime>to

			primes.push prime
			table[prime] = false
			(prime*prime).step(to, prime) {|num| table[num] = false}
		end

		primes
	end

	def Prime.upto max
		(Prime.within 2, max).each {|prime| yield prime}
	end
end
