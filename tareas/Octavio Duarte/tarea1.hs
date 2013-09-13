
--ejercicio 3
is_a :: Char -> Bool
is_a x | x == 'a' = True
	   | x /= 'a' = False
	   
isA :: Char -> Bool
isA 'a' = True
isA x = False


-- ejercicio 4 
isHello :: String -> Bool
isHello ('h':'e':'l':'l':'o':xs) = True
isHello (x:xs) = False

--ejercicio 5
remove_space :: String -> String
remove_space (' ':xs) = xs
remove_space (x:xs) = (x:xs)

--ejercicio 6
convertidor :: Int -> Bool
convertidor num | num == 1 = True
				| num == 0 = False
         
ex_6 :: [Int] -> [Bool]
ex_6 lista = map (convertidor) lista

--ejer 6 mejorado
ex6 :: [Int] -> [Bool]
ex6 resul = [if x == 1 then True else False| x <- resul, x == 1 || x == 0]

--ejercicio 7
ex_7 :: [Char] -> Bool
ex_7 cadena = or (map (=='O') cadena)

--ejercicio 8
-- foldr max 0 [1,5,3]
-- max 1 (max 5(max 3 0))
-- max 1 (max 5 3)
-- max 1 5
-- 5

--ejercicio 9
sumando :: Maybe Integer -> Maybe Integer -> Maybe Integer   
sumando Nothing Nothing = Nothing
sumando (Just x) Nothing = (Just x)
sumando Nothing (Just y) = (Just y)
sumando (Just x)  (Just y) = Just (x + y)

addJust :: [Maybe Integer] -> [Maybe Integer] -> [Maybe Integer]
addJust = zipWith sumando

--addJust [Just 2, Nothing, Just 3] [Nothing, Nothing, Just 5]


--ejercicio 10
data Metales = Metal1 | Metal2 | Metal3
	| Metal4 | Metal5 | Metal6
	deriving (Eq, Show)

--ejercicio 11
data Coins= Coin1 | Coin2 | Coin3 | Coin4 | Coin5
  deriving Show

  --ejercicio 12
data Bci = BOOL Bool | INTEGER Integer | CHAR Char
	deriving (Eq, Show)

	
--ejercicio 13
data Tuplas  a b c d = T0 | T1 a | T2 a b | T3 a b c | T4 a b c d 
	deriving (Eq, Show)

	
--ejercicio 14
discriminante :: Float -> Float -> Float -> Float
discriminante a b c = (b * b) - (4 * a * c)

ex14 :: Float -> Float -> Float -> String
ex14 a b c | discriminante a b c > 0 = "Los posibles valores de x son " 
				++ 	show ((- b + (sqrt (discriminante a b c))) / (2 * a))   
				++ " y " ++
				show ((- b - (sqrt (discriminante a b c))) / (2 * a))
		   | otherwise = "Los valores son complejos"
		   
--ejercicio 15

showMaybe :: Show a => Maybe a -> String
showMaybe Nothing = show "Nothing"
showMaybe (Just a) = show (Just a)

--ejercicio 16
bitWiseAnd :: [Int] -> [Int] -> [Int]
bitWiseAnd a b = zipWith bitAnd a b

bitOr :: Int -> Int -> Int
bitOr 0 0 = 0
bitOr x y = 1

bitAnd :: Int -> Int -> Int
bitAnd 1 1 = 1
bitAnd x y = 0

--ejercicio 17
--(1, False) 
--"2" ++ "a"
--[(3,True), (9, False)] 
--2 == 100000
--’a’ > 'b' 
--[[1],[2],[3]]

--ejercicio 18
-- What caused the type error in this definition and application?
--
-- f :: Num a => (a, a) -> a
-- f (x,y) = x + y

-- f(True, 4)

-- Solution:  Estamos sumando dos elementos que no son del mismo tipo

--ejercicio 19
-- Why does this definition produce an error when used?
-- f :: Maybe a -> [a]
-- f Nothing = []
-- f (Just 3)

-- Solution: Causa error porque no se especifica cuál es el resultado cuando se envía
-- por ejemplo un valor o parametro de tipo "Just a".

--ejecicio 20
filterMaybes :: [Maybe a]-> [a]
filterMaybes as = [a | (Just a) <- as]

--ejercicio 21
buscaEnteroMayor :: [Int] -> Int -> [Int]
buscaEnteroMayor lista n = [x| x <- lista , x > n]

--ejercicio 22
f22 :: [Int] -> Int -> [(Int,Int)]
f22 haystack needle = [(i,v) | (i,v) <- zip [0..] haystack, v == needle]

--Ejericio 23
noRaiz :: [Int] -> [Int]
noRaiz arre = [e | e <- arre, [x | x <- [1..e], x * x == e] == []]

--ejercicio 24
buscaLetra :: [Char] -> Char -> Int
buscaLetra cs aguja = foldr (\c acc-> if c == aguja then acc + 1 else acc) 0 cs

--ejercicio 25
remov :: Char -> [Char] -> [Char]
remov aguja cs = foldl (\acc c -> if c /= aguja then acc ++ [c] else acc) [] cs

--ejercicio 26
rev :: [a] -> [a]
rev cs = foldl (\acc c -> c:acc ) [] cs

--ejercicio 27
obtenUltimo :: [Maybe a]->Maybe a
obtenUltimo xs= foldl(\acc x -> x) Nothing xs
