f27 :: [Maybe Char] -> Maybe Char
f27 cs = foldl (\acc c -> c) Nothing cs 