-- Project Euler Problem Number Three:
--
-- What is the largest prime factor
-- of the number 600851475143?

problemThree :: Integer
problemThree = (m !! 0) `div` (m !! 1)
  -- +1 to the Haskell Wiki for this refactor
  where
    m = reverse $ takeWhile (<= n) (scanl1 (*) [x | x <- 1:[3, 5..], (n `mod` x) == 0])
    n = 600851475143

-- problemThree ==> 6857

