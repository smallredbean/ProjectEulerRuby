#!/usr/bin/env ruby


class MultipleOf
	def MultipleOf.isFactor? (num, *args)
		args.each {|factor| return true if num%factor==0}
		false
	end

	def MultipleOf.sum(startN, endN, *args)
		sum = 0
		(startN...endN).each {|num| sum += num if isFactor?(num, *args)}
		sum
	end
end

puts MultipleOf.sum(1, 1000, 3, 5)
