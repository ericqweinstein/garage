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

#####

# Problem 3: What is the largest prime
# factor of the number 600851475143?

def problem_three
  def find_factors(number)
    return [] if number == 1
    factor = (2..number).find { |x| number % x == 0 }
    [factor] + find_factors(number / factor)
  end
  find_factors(600851475143).max
end

# problem_three ==> 6857
