convertidor :: Int -> Bool
convertidor num | num == 1 = True
	       		| num == 0 = False

ex6 :: [Int] -> [Bool]
ex6 lista = map (convertidor) lista