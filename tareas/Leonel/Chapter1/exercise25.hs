f25 :: [Char] -> Char -> [Char]
f25 cs c = foldr (\x acc -> if x /= c then x:acc else acc) [] cs

