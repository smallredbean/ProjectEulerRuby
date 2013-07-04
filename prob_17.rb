#!/usr/bin/env ruby

# building the dictionary
$num2literal = Hash.new
File.open('prob_17.dat', 'r').each {|line|
	num, literal = line.chomp.split(' ')
	$num2literal[num.to_i] = literal
}

def convertNumberToLiteral number
	# Support from 1 upto 1,000
	return "" if number<1 or number>1000
	return "one"+"thousand" if number==1000
	
	result = ""
	if number>=100
		result += $num2literal[number/100]
		result += "hundred"
		number %= 100
		result += "and" if number!=0
	end
	return result if number==0

	if number<=20
		result += $num2literal[number]
	else
		result += $num2literal[number/10*10]
		number %= 10
		result += $num2literal[number] if number>0
	end

	result
end

length = 0
(1..1000).each {|num| length += convertNumberToLiteral(num).length}
puts length
