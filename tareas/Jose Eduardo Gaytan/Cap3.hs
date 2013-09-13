-- para test es:
-- ghci -x lhs <archivo>
-- runTestTT - para correr las pruebas
-- se pone run allTest y lo pones al principio del archivo con el fin de probar las etiquetas
--tests = test (t1++t2++t3)
--funciones anonimas son las mentadas lamda

--ex1Copy :: [Num a] => [a] -> [a]
--ex1Copy :: [Int] -> [Int]

import Test.HUnit

t1 =  ["ex1Copy [2,3] lista con algo" ~: [2,3] ~=? (ex1Copy [2,3])
        ,"ex1Copy [1] lista con un elementa" ~: [1] ~=? (ex1Copy [1])]

ex1Copy :: [a] -> [a]
ex1Copy [] = []
ex1Copy (x:xs) = x: ex1Copy xs

t2 = ["ex2Reverse [(1,2),(3,4)]" ~: [(2,1),(4,3)] ~=? (ex2Reverse [(1,2),(3,4)])]

ex2Reverse :: [(a,b)] -> [(b,a)]
ex2Reverse [] = []
ex2Reverse ((x,y):xs) = (y,x) : ex2Reverse xs

t3 =  ["ex3Merge [2,4,6] [1,3,5]" ~: [1,2,3,4,5,6] ~=? (ex3Merge [2,4,6] [1,3,5])]

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (splitter:xs) =
	quicksort [y | y <- xs, y < splitter]
	++ [splitter]
	++ quicksort [y | y <- xs, y >= splitter]

ex3Merge :: Ord a => [a] -> [a] -> [a]
ex3Merge (xs) [] = xs
ex3Merge [] (ys) = ys
ex3Merge (x:xs) (y:ys) = quicksort (x:y:(ex3Merge xs ys))

--Excercise 4 PENDIENTE

t5 = ["ex5Lookup 5 [(1,2),(5,3)]" ~: Just 3 ~=? (ex5Lookup 5 [(1,2),(5,3)])
      , "ex5Lookup 6 [(1,2),(5,3)]" ~: Nothing ~=? (ex5Lookup 6 [(1,2),(5,3)])]

ex5Lookup :: Int -> [(Int,Int)] -> Maybe Int
ex5Lookup e [] = Nothing
ex5Lookup e ((a,b):as) = if a == e then Just b else ex5Lookup e as

t6 = ["ex6Count 2 [1,2,3,2,2,2]" ~: 4 ~=? (ex6Count 2 [1,2,3,2,2,2])]

ex6Count :: Int -> [Int] -> Int
ex6Count e [] = 0
ex6Count e (x:xs) = if e == x then (1 + ex6Count e xs) else ex6Count e xs

t7 = ["ex7Remove 2 [1,2,3,2,2,2]" ~: [1,3] ~=? (ex7Remove 2 [1,3])]

ex7Remove :: Eq a => a->[a]->[a]
ex7Remove e [] = []
ex7Remove e (x:xs) = if x == e then ex7Remove e xs else x:(ex7Remove e xs)

t8 = ["ex8RemoveEven True [1,2,3,4,5,6,7]" ~: [2,4,6] ~=? ex8RemoveEven True [1,2,3,4,5,6,7]
	,"ex8RemoveEven False [1,2,3,4,5,6,7]" ~: [1,3,5,7] ~=? ex8RemoveEven False [1,2,3,4,5,6,7]]

ex8RemoveEven :: Bool -> [Int] -> [Int]
ex8RemoveEven _ [] = []
ex8RemoveEven c (x:xs) = if c then (ex8RemoveEven False xs) else x:(ex8RemoveEven True xs)

t8_1 = ["ex8RemoveEven_1 [1,2,3,4,5,6,7]" ~: [2,4,6] ~=? ex8RemoveEven_1 [1,2,3,4,5,6,7]]

ex8RemoveEven_1 :: [Int] -> [Int]
ex8RemoveEven_1 [] = []
ex8RemoveEven_1 (x:xs) = aux xs

aux :: [Int] -> [Int]
aux [] = []
aux (y:ys) = y:ex8RemoveEven_1 ys

t9 = ["ex9Extract [Just 3, Nothing, Just 7]" ~: [3,7] ~=? (ex9Extract [Just 3, Nothing, Just 7])]

ex9Extract :: [Maybe a] -> [a]
ex9Extract [] = []
ex9Extract (Nothing:xs) = ex9Extract xs
ex9Extract (Just x:xs) = x:ex9Extract xs

--t10 = ["ex10StringIndex \"abcde\" \"bc\"" ~: Just 1 ~=? (ex10StringIndex "abcde" "bc")
--	 , "ex10StringIndex \"abcde\" \"fg\"" ~: Nothing ~=? (ex10StringIndex "abcde" "fg")]



t11 = ["(ex11Foldrwith (\\p q acc -> p+q + acc ) 0 [1, 1] [2, 2])" ~: 6 ~=? (ex11Foldrwith (\p q acc -> p+q + acc ) 0 [1, 1] [2, 2])]

ex11Foldrwith :: (a -> b -> c -> c) -> c -> [a] -> [b] -> c
ex11Foldrwith f z [] [] = z
ex11Foldrwith f z (a:as) (b:bs) = f a b (ex11Foldrwith f z as bs) 

--t12 = [""]

t13 = ["ex13RemoveDuplcates [1,9,9,2,7,7,7,3]"~: [1,9,2,7,3] ~=? (ex13RemoveDuplcates [1,9,9,2,7,7,7,3])]

ex13RemoveDuplcates :: Eq a => [a] -> [a]
ex13RemoveDuplcates [] = []
ex13RemoveDuplcates (x:xs) = if (elem x xs) then ex13RemoveDuplcates xs else x:(ex13RemoveDuplcates xs)

t14 = ["ex14IsInList 2 [1,2,3,4]" ~: True ~=? (ex14IsInList 2 [1,2,3,4])
		, "ex14IsInList 5 [1,2,3,4]" ~: False ~=? (ex14IsInList 5 [1,2,3,4])]

ex14IsInList :: Int -> [Int] -> Bool
ex14IsInList e [] = False
ex14IsInList e (x:xs) = if (e == x) then True || ex14IsInList e xs else False || ex14IsInList e xs

t15 = ["(ex15Interseccion \"abcde\" \"defgh\")"~: ['d','e'] ~=? (ex15Interseccion "abcde" "defgh")]

ex15Interseccion :: Eq a => [a] -> [a] -> [a]
ex15Interseccion [] ys = []
ex15Interseccion xs [] = []
ex15Interseccion (x:xs) (y:ys) = if x == y then x:(ex15Interseccion xs ys) else (ex15Interseccion xs ys)

t16 = ["isSubset [2,4] [1,2,3,4,5]" ~: True ~=? (isSubset [2,4] [1,2,3,4,5])
	, "isSubset [6] [1,2,3,4,5]" ~: False ~=? (isSubset [6] [1,2,3,4,5])]

isSubset :: Eq a => [a] -> [a] -> Bool
isSubset [] (ys) = True
isSubset (x:xs) (ys) = if (xs == []) then elem x ys && isSubset xs ys else (elem x ys || isSubset xs ys)

t17 = ["ex17IsListSorted [1,3,2,4]" ~: False ~=? (ex17IsListSorted [1,3,2,4])
      , "ex17IsListSorted [1,2,3,4]" ~: True ~=? (ex17IsListSorted [1,2,3,4]) ]

ex17IsListSorted :: Ord a => [a] -> Bool
ex17IsListSorted [] = True
ex17IsListSorted (x:y:xs) = if x < y then True && ex17IsListSorted (y:xs) else False
ex17IsListSorted a = True

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing (Just a) = False

t18 

t19 = ["ex19Last [1,2,3] regresa " ~: Just 3 ~=? (ex19Last [1,2,3])]

ex19Last :: Eq a => [a] -> Maybe a
ex19Last [] = Nothing
ex19Last (x:xs) = if xs == [] then Just x else ex19Last xs

tests = test (t1++t2++t3++t5++t7++t8++t8_1++t9++t11++t13++t14++t15++t16++t17++t19)

--factors :: Int -> [Int]
--factors n = [x | x <- [2..s], n `mod` x == 0]
--	where s = floor (sqrt $ fromIntegral n)