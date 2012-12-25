-- Project Euler Problem Number Six:
--
-- What is the difference between the
-- sum of the squares and the square
-- of the sums for the numbers 1 - 100?

problemSix :: Integer
problemSix = ((sum [1..100])^2) - (sum $ map (^2) [1..100])

-- problemSix ==> 25164150
