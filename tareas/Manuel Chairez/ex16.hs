bitAnd :: Int -> Int -> Int
bitAnd 1 1 = 1
bitAnd x y = 0

bitwiseAnd::[Int]->[Int]->[Int]
bitwiseAnd a b = zipWith (bitAnd) a b