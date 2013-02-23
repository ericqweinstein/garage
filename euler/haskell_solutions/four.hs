-- Project Euler Problem Number Four:
--
-- Find the largest palindrome made from
-- the product of two three-digit numbers.

problemFour :: Integer
problemFour = maximum [x | y <- [100..999], z <- [y..999], let x = y * z, let s = show x, s == reverse s]

-- problemFour ==> 906609

