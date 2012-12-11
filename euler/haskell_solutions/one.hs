-- Project Euler Problem Number One:
--
-- Add all the natural numbers below
-- 1000 that are multiples of 3 or 5.

problemOne :: Integer -> Integer
problemOne x = sum [n | n <- [1..x-1] , n `mod` 3 == 0 || n `mod` 5 == 0]

-- problemOne(1000) ==> 233168
