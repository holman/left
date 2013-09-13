removeChar :: Char -> String -> String
removeChar c = foldr (\ x acc -> if x == c then acc else x:acc) []