-- 011.hs
-- Find the largest product of 4 adjacent numbers in the grid in 011.in
-- "Adjacent" here means 8-adjacent, not 4-adjacent

flatten = foldl (++) []

-- horizontal = --------- = [(i,j), (i,j+1), (i,j+2), ..., (i,j+d-1)]
--
--           |
--           |
--           |
--vertical = |            = [(i,j), (i+1,j), (i+2,j), ..., (i+d-1,j)]
--           |
--           |
--
--           \
-- falldiag = \           = [(i,j), (i+1,j+1), (i+2,j+2), ..., (i+d-1,j+d-1)]
--             \
--              \
--               \
--
--              /
--             /
-- risediag = /           = [(i,j), (i-1,j+1), ..., (i-d+1,j+d-1)]
--           /
--          /
--
adjacentLocations n d =
    horizontals ++ verticals ++ falldiag ++ risediag
    where
        horizontals = flatten [[[(i,j+k)  |k<-[0..d-1]]|j<-[0..n-d]]|i<-[0..n-1]]
        verticals   = flatten [[[(i+k,j)  |k<-[0..d-1]]|j<-[0..n-1]]|i<-[0..n-d]]
        falldiag    = flatten [[[(i+k,j+k)|k<-[0..d-1]]|j<-[0..n-d]]|i<-[0..n-d]]
        risediag    = flatten [[[(i-k,j+k)|k<-[0..d-1]]|j<-[0..n-d]]|i<-[d-1..n-1]]

indicesToElements grid idxTup = [ grid !! fst index !! snd index | index <- idxTup]

-- Read in a file, then generate the indices to grab,
-- then generate all the lists from the indices,
-- then compare all the generated products
problem011 filename = do
    grid <- readGrid filename
    let k = length grid
        indices = adjacentLocations k 4
        elements = [ l | idxTup <- indices,
                         let l = indicesToElements grid idxTup ]
        products = map product elements
    return $ maximum products

readGrid filename = do
    text <- readFile filename
    return [ [read num | num <- words line] | line <- lines text ]

main = do
    ans <- problem011 "011.in"
    print ans
