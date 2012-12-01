# These will all live in one file, since I figure
# the solutions will lend themselves to code reuse.

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
  find_factors(600_851_475_143).max
end

# problem_three ==> 6857

#####

# Problem 4: Find the largest palindrome
# made from the product of two 3-digit numbers.

def problem_four
  def palindrome?(n)
    n.to_s == n.to_s.reverse ? true : false
  end
  max = 0
  100.upto(999).each do |a|
    a.upto(999).each do |b|
      max = a * b if palindrome?(a * b) && (a * b) > max
    end
  end
  max
end

# problem_four ==> 906609

#####

# Problem 5: What is the smallest positive number
# evenly divisible by all the numbers 1 - 20?

require 'rational'

def problem_five
  answer = (1..20).inject(1) { |res, n| res.lcm n }
end

# problem_five ==> 232792560

#####

# Problem 6: Find the difference between the
# sum of the squares of the first one hundred
# natural numbers and the square of the sum.

def problem_six
  (1.upto(100).inject(:+))**2 - (1.upto(100).map { |n| n**2 }).inject { |sum, n| sum + n }
end

# problem_six ==> 25164150

#####

# Problem 7: What is the 10,001st prime number?

require 'mathn'

def problem_seven
  primes = Prime.new
  10_000.times { primes.next }
  primes.next
end

# problem_seven ==> 104743
