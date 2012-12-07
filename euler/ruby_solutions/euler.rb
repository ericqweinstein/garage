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
  (1..20).inject(1) { |res, n| res.lcm n }
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

# Very slow in 1.8.7; much faster in 1.9.3,
# but implementation is slightly different

# problem_seven ==> 104743

#####

# Problem 8: What is the greatest product of five
# consecutive digits in the below 1000-digit number?

def problem_eight
  big_number = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
  start, stop = 0, 5
  window = big_number[start, stop]
  largest_product = 0
  while stop < big_number.length
    current_product = window[0].to_i * window[1].to_i * window[2].to_i * window[3].to_i * window[4].to_i
    if current_product > largest_product
      largest_product = current_product
    end
    window = big_number[start += 1, stop += 1]
  end
  largest_product
end

# Works in 1.9.3, but not in 1.8.7 for some reason

# problem_eight ==> 40824

#####

# Problem 9: Find the product of the Pythagorean
# triple elements whose sum is 1,000.

def problem_nine(sum)
  (1..sum).each do |m|
    (1..sum).each do |n|
      # Thank you, Wikipedia:
      # http://en.wikipedia.org/wiki/Formulas_for_generating_Pythagorean_triples
      a = n**2 - m**2
      b = 2 * m * n
      c = n**2 + m**2
      return a, b, c if a + b + c == sum
    end
  end
end

# problem_nine ==> [375, 200, 425]
#
# The problem asks for the product, which
# is 31875000, but I was more interested
# in the actual elements of the triple

#####

# Problem 10: Find the sum of all
# prime numbers below two million.

# Let's try a 1.9.3-style solution

require 'prime'

def problem_ten
  Prime.each(2_000_000).inject(0) { |n, sum| n + sum }
end

# problem_ten ==> 142913828922
