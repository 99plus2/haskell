-- 015.hs
-- Project Euler problem 15
-- Find the number of paths from (0,0) to (a, b) moving only right and up
--     where a = b = 20

-- Note: The answer for (a,b) = binom (a+b) a = binom (a+b) b

-- Binom[n,k] = Fact[n]/(Fact[k]*Fact[n-k]) == (n*n-1*...*n-k+1)/(1*2*...*k)
binom n k | k <= n-k  = product [n-k+1..n] `div` product [1..k]
          | otherwise = binom n (n-k)


problem015 a b = binom (a+b) a

main = print ans where ans = problem015 20 20
