#!/usr/bin/env ruby

def digitInPosition index
	return nil if index<=0

	d = 0
	@amountInDigits.each_with_index {|amount, digits|
		if index<=amount
			d = digits
			break
		end
		index -= amount
	}
	number = 10**(d-1)-1+(index.to_f/d).ceil
	return number.to_s[d-1, 1].to_i if index%d==0
	number.to_s[index%d-1, 1].to_i
end

@amountInDigits=Array.new(1, 0)
digit = 0
accumu = 0
begin
	digit += 1
	amount = digit*9*(10**(digit-1))
	@amountInDigits.push(amount)
	accumu += amount
end while accumu<=10**6

base = 1
product = digitInPosition base
6.times {
	base *= 10
	product *= digitInPosition base
}
puts product
