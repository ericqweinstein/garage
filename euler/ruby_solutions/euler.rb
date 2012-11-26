# These will all live in one file, since several
# of the  problems lend themselves to code reuse.

# Problem 1: Add all the natural numbers below one
# thousand that are multiples of three or five.

def problem_one
  0.upto(999).inject do |sum, num|
    num % 3 == 0 || num % 5 == 0 ? sum + num : sum
  end
end

# problem_one ==> 233168

#####

# Problem 2: For terms in the Fibonacci sequence
# whose values do not exceed four million, find
# the sum of the even-valued terms.

def problem_two
  previous = 1
  current = 1
  total = 0
  next_up = 0

  while total < 4_000_000
    next_up = previous + current
    total += next_up if next_up.even?
    previous = current
    current = next_up
  end
  total
end

# problem_two ==> 4613732
