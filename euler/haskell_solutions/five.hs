-- Project Euler Problem Number Five:
--
-- What is the smallest number divisible
-- by each of the numbers one to twenty?

problemFive :: [Integer] -> Integer
problemFive xs =  foldr (lcm) 1 xs

-- problemFive [1..20] ==> 232792560
