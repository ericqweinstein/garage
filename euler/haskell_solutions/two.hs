-- Project Euler Problem Number Two:
--
-- Find the sum of the even-valued terms of
-- the Fibonacci sequence below four million.

problemTwo :: Integer
problemTwo = sum $ filter (even) $ takeWhile (< 4000000) fib

-- The go-to Haskell Fibonacci function
fib = 0 : 1 : zipWith (+) fib (tail fib)

-- problemTwo ==> 4613732
