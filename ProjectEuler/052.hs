-- 052.hs
{-
 - It can be seen that the number, 125874, and its double, 251748, contain
 - exactly the same digits, but in a different order.
 -
 - Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
 - contain the same digits.
 -}

import ProjectEuler.Math (integerDigits)
import Data.List (sort)

sols = [ x | x <- [1..]
           , let xdigits = sort $ integerDigits x
           , all (==xdigits) [ sort $ integerDigits (k*x) | k <- [2..6] ] ]

solveProblem = head sols

main = print solveProblem
