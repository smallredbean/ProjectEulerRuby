#!/usr/bin/env ruby

presence = Hash.new
(2..100).each{|a|
	(2..100).each{|b|
		presence[a**b] = true
	}
}
puts presence.size
