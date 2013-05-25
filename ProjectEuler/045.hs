-- 045.hs
{-
 - Triangle, pentagonal, and hexagonal numbers are generated by the following
 - formulae:
 -
 - Triangle         Tn=n(n+1)/2         1, 3,  6, 10, 15, ...
 - Pentagonal       Pn=n(3n−1)/2        1, 5, 12, 22, 35, ...
 - Hexagonal        Hn=n(2n−1)          1, 6, 15, 28, 45, ...
 -
 - It can be verified that T(285) = P(165) = H(143) = 40755.
 -
 - Find the next triangle number that is also pentagonal and hexagonal.
 -}

intersection :: Ord a => [[a]] -> [a]
intersection = foldr1 imerge 
    where imerge (x:xs) (y:ys) | x < y  = imerge xs (y:ys)
                               | x > y  = imerge (x:xs) ys
                               | x == y = x:imerge xs ys

tri n = n*(n+1) `div` 2
pent n = n*(3*n-1) `div` 2
hex n = n*(2*n-1)

tns = map tri [1..]
pns = map pent [1..]
hns = map hex [1..]

-- observe that triangle numbers are a strict subset of hexagonal numbers
-- so we only need to look for hexagonal/pentagonal numbers
solveProblem = let ans = intersection [hns, pns]
               in ans !! 2

main = print solveProblem
