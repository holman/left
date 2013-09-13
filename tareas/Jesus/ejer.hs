---Jesús Martín García Ramírez

doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleSmallNumber x = if x > 100
	then x
	else x*2
doubleSmallNumber' x = (if x > 100
	then x
	else x*2) + 1

conanO'Brien = "It's a-me, Conan O'Brien!"   

array1 = [1,3,5,7,9]
array2 = [2,4,6,8,10]

solo5 = 5

takeCycle x = take x (cycle [1,2,3])

replicat x y = replicate x y

naturalNumbers range = [x*2 | x<- [1..range]]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]   

length' xs = sum [1 | _ <- xs]   
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]   

addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  

factorial :: Integer -> Integer
factorial n = product [1..n]
--ejercicio 3
is_a :: Char -> Bool
is_a caracter | caracter == 'a' = True
			  | otherwise = False
--ejercicio 4
is_hello :: [Char] -> Bool
is_hello string | string == "hello" = True
				| otherwise = False

g :: Int -> Int
g x | x < 0 = -1
	| x > 0 = 1
	| x == 0 = 0
--ejercicio 5
remove_space :: String -> String
remove_space(' ':cola)=cola
remove_space(cola)=cola

--ejercicio 6
ejer6 :: [Int] -> [Bool]
ejer6 lista = map (convertir) lista

convertir :: Int -> Bool
convertir valor | valor == 0 = False
	|valor == 1 = True

--ejercicio 7
ejer7::[Char]->Bool
ejer7 cadena = or (map (== 'O') cadena)



--ejercicio 8
--foldr max 0 [1,5,3]
-- = 1 ‘max‘ (5 ‘max‘ (3 ‘max‘ 0))
-- = 1 ‘max‘ (5 ‘max‘ 3)
-- = 1 ‘max‘ 5
-- =5

--ejercicio 9
ejer9 :: Maybe Int -> Maybe Int -> Maybe Int
ejer9 (Just x) (Just y) = Just (x+y)
ejer9 (Just x) Nothing = Just x
ejer9 Nothing (Just y) = Just y
ejer9 Nothing Nothing = Nothing 

ejer9_1 :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
ejer9_1 lista1 lista2 = zipWith ejer9 lista1 lista2

--ejercicio 10
data Metales = Plata| Oro| Bronce| Acero| Cobre| Aluminio deriving (Eq, Show)
--ejercicio 11
data Moneda = Peso1 Int|Peso2 Int|Peso5 Int| Peso10 Int |Peso20 Int |Peso100 Int deriving (Eq, Show)

ejer11 :: Moneda -> Int
ejer11 (Peso1 x) = x
ejer11 (Peso5 x) = x*5
ejer11 (Peso10 x) = x*10
ejer11 (Peso20 x) = x*20
ejer11 (Peso100 x) = x*100

--ejercicio12
data Universal = BOOLEAN Bool | CHARACTER Char | INTEGER Int deriving (Eq, Show)

--ejercicio 13
data Tuplas a b c d = Tupla1 a|Tupla2 a b| Tubla3 a b c| Tupla4 a b c d deriving (Eq,Show)

--ejercicio 14
quadratic :: Float -> Float -> Float -> (Float, Float)
quadratic a b c = if discriminante < 0 then error "Imaginario"
					else (x1, x2)
					where
						x1 = part1 + sqrt (discriminante) / (2*a)
						x2 = part1 - sqrt (discriminante) / (2*a)
						discriminante = b**2 - 4 * a * c
						part1 = -b / (2*a)

--ejercicio 15
ejer15 :: Show a => Maybe a -> String
ejer15 Nothing = []
ejer15 (Just a) = show a

--ejercicio 16

bitAnd :: Int -> Int -> Int
bitAnd 1 1=1
bitAnd x y=0

bitwiseAnd :: [Int]->[Int]->[Int]
bitwiseAnd a b = zipWith bitAnd a b

--Ejercicio 17
--[1,False] --- las listas solo aceptan un solo tipo de dato
--[(3,True), (False, 9)] --- deben ser del mismo tipo ordenadas
--'a' > "b" --- deben ser de tipo char
-- '2' ++ 'a' -- para concatenar con ++ debe ser de tipo String
-- 2 == False -- deben de ser del mismo tipo
-- [[1],[2],[[3]]] -- no se puede crear una lista dentro de una lista dentro de otra lista
  
--[[1],[2],[3]]

--Ejercicio --- no retorna la lista
ejer19:: Maybe a -> [a]
ejer19 Nothing=[]
ejer19 (Just a) = [a]

--
--ejercicio 20

ejer20 ::[Maybe a]->[a]
ejer20 as = [a | (Just a)<-as]

--Ejercicio 21

ejer21 :: [Int] -> Int->[Int]
ejer21 lista n =  [x | x<-lista,x>n]

--Ejercicio22

ejer22 :: [Int] -> Int -> [Int]
ejer22 lista a = [x| (x,y) <- zip [0..] lista , y == a]

--Exercise 23. Write a list comprehension that produces a list giving all of the
--positive integers that are not squares in the range 1 to 20.
ejer23 ::[Int]
ejer23 = [x | x <- [1..20], [y | y <- [1..x], y * y == x] == [] ]

--ejer24
ejer24 :: [Char] -> Char -> Int
ejer24 cs aguja = foldr (\c acc-> if c == aguja then acc + 1 else acc) 0 cs



--Exercise 25. Write a function using foldr that takes a list and removes each
--instance of a given letter.

ejer25 :: [Char] -> Char -> [Char]
ejer25 string a  = foldr (\c acc -> if c /= a then c:acc else acc) [] string

--Exercise 26. Using foldl, write a function
--that reverses its list argument.

rev :: [a] -> [a]
rev cs = foldl (\acc c -> c:acc ) [] cs


--ejercicio 27

takeLast :: Maybe Int -> Int -> Maybe Int
takeLast Nothing x = Just x
takeLast (Just x) y = Just y

ejer27 lista = foldl takeLast Nothing lista
