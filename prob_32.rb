#!/usr/bin/env ruby

# Let D(a) be the # digits of a
#    e.g., D(100) = 3, D(999) = 3, D(2) = 1
#
# Here are the requirements by the problem
# 1. a * b == c
# 2. D(a) + D(b) + D(c) == 9
#
# From 1. we can derive that D(c) is either D(a)+D(b) or D(a)+D(b)-1
# Hence, we know that D(a)+D(b) must be 5, which limits the searching range
# That is, [D(a), D(b)] is [1, 4] or [2, 3]


