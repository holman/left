

import Test.HUnit

t1 =  ["f21 [2,3] lista con algo" ~: [2,3] ~=? (ex1 [2,3])
       ,"f21 [1] lista con un elementa" ~: [1] ~=? (ex1 [1])]
ex1 :: [a] -> [a]
ex1 [] = []
ex1 (x:xs) = [x] ++ ex1 xs


t2 = ["inverse [(1,2),(3,4)]" ~: [(2,1),(4,3)] ~=? (ex2 [(1,2),(3,4)])]
ex2 :: [(a,a)] -> [(a,a)]
ex2 [] = []
ex2 (x:xs) = [(snd x, fst x)] ++ ex2 xs 


t3 =  ["merge [2,4.6] [1,3,5]" ~: [1,2,3,4,5,6] ~=? (ex3 [2,4,6] [1,3,5])]
ex3 :: Ord a => [a] -> [a] -> [a]
ex3 l1 [] = l1
ex3 [] l2 = l2
ex3 (x:xs) (y:ys) = if x < y 
					then [x] ++ ex3 xs (y:ys)  
					else [y] ++ ex3 ys (x:xs)  


t4 = ["Excercise 4" ~: "[1,2,3]!!0" ~: Just 1 ~=? (ex4 0 [1,2,3]),  "[1,2,3]!!2" ~: Just 3 ~=? (ex4 2 [1,2,3]),  "[1,2,3]!!5" ~: Nothing ~=? (ex4 5 [1,2,3])]
ex4 :: Int -> [a] -> Maybe a
ex4  x [] = Nothing
ex4 0 (y:ys) = Just y
ex4 x (y:ys) = ex4 (x-1) ys 

t5 = ["clookup 5 [(1,2),(5,3)]" ~: Just 3 ~=? (ex5 5 [(1,2),(5,3)]), "clookup 6 [(1,2),(5,3)]" ~: Nothing ~=? (ex5 6 [(1,2),(5,3)])]
ex5 :: Eq a => a -> [(a,a)] -> Maybe a
ex5  x [] = Nothing
ex5  x ((y1,y2):ys) = if y1 == x 
					then Just y2
					else ex5 x ys


t6 = ["f6 2 [1,2,3,2,2,2]" ~: 4 ~=? (ex6 2 [1,2,3,2,2,2])]
ex6 :: Eq a => a -> [a] -> Int
ex6 x [] = 0
ex6 x (y:ys) = if x == y 
				then 1 + ex6 x ys
				else 0 + ex6 x ys

t7 = ["f7 2 [1,2,3,2,2,2]" ~: [1,3] ~=? (ex7 2 [1,3])]
ex7 :: Eq e => e -> [e] -> [e]
ex7 x [] = []
ex7 x (y:ys) = if x == y 
				then ex7 x ys 
				else y : ex7 x ys


t8 = ["f8 [1,2,3,4,5,6,7]" ~: [2,4,6] ~=? (ex8 [1,2,3,4,5,6,7])]
ex8 :: [b] -> [b]
ex8 [] = []
ex8 (x:xs) = ex8_1 xs
ex8_1 :: [a] -> [a]
ex8_1 [] = []
ex8_1 (x:xs) = x:ex8 xs



t9 = ["extract [Just 3, Nothing, Just 7]" ~: [3,7] ~=? (ex9 [Just 3, Nothing, Just 7])]
ex9 :: [Maybe a] -> [a]
ex9 [] = []
ex9 ((Nothing):xs) = ex9 xs 
ex9 ((Just x):xs) = [x] ++ ex9 xs


t10 = ["f10 \"abcde\" \"bc\"" ~: Just 1 ~=? (ex10 "abcde" "bc"), "f10 \"abcde\" \"fg\"" ~: Nothing ~=? (ex10 "abcde" "fg")]
ex10 :: String -> String -> Maybe Int
ex10 x y = loop x y 0

loop :: String -> String -> Int -> Maybe Int
loop [] s2 n = Nothing
loop (x:xs) s2 n = if length s2 > length (x:xs)
					then Nothing
					else if take (length s2) (x:xs) == s2
						then Just n
						else loop xs s2 (n+1)


t11 = ["(foldrWith (\\p q acc -> p+q + acc ) 0 [1, 1] [2, 2])" ~: 6 ~=? (ex11 (\p q acc -> p+q + acc ) 0 [1, 1] [2, 2])]
ex11 :: (a->b->c->c) -> c -> [a] -> [b] -> c
ex11 f z [] [] = z
ex11 f z (a:as) (b:bs) = f a b (ex11 f z as bs)


t12 = ["(mappend (++!) \"bla\")" ~: "b!l!a!" ~=? (ex12 (++"!") ["b","l","a"])]
ex12 :: (a -> [b]) -> [a] -> [b]
ex12 f xs = foldr fun [] xs
	where fun x acc = f x ++ acc



t13 = ["removeDuplicates [1,9,9,2,7,7,7,3]"~: [1,9,2,7,3] ~=? (ex13 [1,9,9,2,7,7,7,3])]
ex13 :: Eq a => [a] -> [a]
ex13 [] = []
ex13 (x:xs) = if (elem x xs) 
				then ex13 xs 
				else x:ex13 xs


t14 = ["f14 'b' \"abc\" "~: True ~=? (ex14 'b' "abc")]
ex14 :: Eq a => a -> [a] -> Bool
ex14 x [] = False
ex14 x (y:ys) = if x == y then True else ex14 x ys


t15 = ["(intersection \"abcde\" \"defgh\")"~: ['d','e'] ~=? (ex15 "abcde" "defgh")]
ex15 :: Eq a => [a] -> [a] -> [a]
ex15 [] bs = []
ex15 as [] = []
ex15 (a:as) bs = if (elem a bs) then a:ex15 as bs else ex15 as bs


t16 = ["(isSubset [2,4] [1,2,3,4,5])" ~: True ~=? (ex16 [2,4] [1,2,3,4,5])]
ex16 :: Eq a => [a] -> [a] -> Bool
ex16 [] [] = True
ex16 [] l2 = True
ex16 l1 [] = False
ex16 (x:xs) (y:ys) = if x == y 
					then True && ex16 xs ys 
					else ex16 (x:xs) ys



t17 = ["isSorted [1,3,2,4]" ~: False ~=? (ex17 [1,3,2,4]), "isSorted [1,2,3,4]" ~: True ~=? (ex17 [1,2,3,4]) ]
ex17 :: Ord a => [a] -> Bool
ex17 [] = True
ex17 (x:y:as) = if x>y then False else True && ex17 (y:as)
ex17 x = True


--t18 = ["" ~: ~=? (factorial)]

t19 = ["flast [1,2,3] regresa " ~: Just 3 ~=? (ex19 [1.0,2,3]) ]
isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing (Just a) = False
 
ex19 :: Eq a => [a]-> Maybe a
ex19 [] = Nothing
ex19 (x:xs) = if xs == [] then Just x else ex19 xs


t20 = ["wholePart \"23.455\""~: "23" ~=? (ex20_I "23.455"),"fractionPart \"23.455\""~: "455" ~=? (ex20_F "23.455")]
ex20_I :: String -> String
ex20_I [] = []
ex20_I (x:xs) = if x /= '.' 
				then [x] ++ ex20_I xs
				else ex20_I [] 

ex20_F :: String -> String
ex20_F [] = []
ex20_F (x:xs) = if x /= '.' 
				then ex20_F xs
				else ex20_I xs 

tests = test (t1++t2++t3++t4++t5++t6++t7++t8++t9++t10++t11++t12++t13++t14++t15++t16++t17++t19++t20)