foldrm f z [] = z
foldrm f z (x:xs) = f x (foldrm f z xs)

{-
foldr max 0 [1,5,3]

max 1 (max 5 (max 3 0))
max 1 (max 5 3)
max 1 5
5

foldl max 0 [1,5,3]
(max (max (max 0 1) 5) 3)
(max (max (1) 5) 3)
(max (5) 3)
5
-}