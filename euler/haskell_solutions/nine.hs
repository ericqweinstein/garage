-- Project Euler Problem Number Nine:
--
-- Find the product of the Pythagorean
-- triple elements whose sum is 1,000.

problemNine :: [(Integer, Integer, Integer)]
problemNine = [(a, b, c) | a <- [1..500], b <- [1..500], c <- [1..500], a^2 + b^2 == c^2, a + b + c == 1000]

-- problemNine ==> [(200,375,425),(375,200,425)]
--
-- The product is 31875000, but I'm more interested in the triple itself.
-- This program works, but is too slow—it takes several minutes to run.

