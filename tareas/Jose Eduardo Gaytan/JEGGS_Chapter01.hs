
doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
	then x
	else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

conanO'Brien = "It's a-me, Conan O'Brien!"
--let lostNumber = [4,8,15,16,23,42]

--- EXCERCISE 3

is_a :: Char -> Bool
--is_a character = if character == 'a' then True else False
is_a character | character == 'a' = True
				| otherwise = False

funcG :: Int -> Int
funcG x | x < 0 = (-1) 
		| x == 0 = 0
		| x > 0 = 1

--Main> [funcG x | x <-[(-10)..10]]
--[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,1,1,1,1,1,1,1,1,1,1]

--- EXCERCISE 4

isHello :: String -> Bool
isHello ('h':'e':'l':'l':'o':xs) = True
isHello	(x:xs) = False

-- EXCERCISE 5

removeSpace :: String -> String
removeSpace (' ':cola) = cola
removeSpace (cola) = cola

--- EXCERCISE 6

--boolList :: [Int] -> [Bool]
--boolList y = [y | x <- lista, x == 0, y <- False]
--ex6Map :: Int -> Bool
--ex6Map num | num == 1 = False
--		|num == 0 = False
--		|num

ex6 :: [Int] -> [Bool]
ex6 lista = map (convertir) lista

convertir :: Int -> Bool
convertir valor | valor == 0 = False
	|valor == 1 = True

--- EXCERCISE 7

--ex7 :: [Char] -> [Bool]
--ex7 cadena = [if c=='0' then True else False | c <- cadena]

conv_str :: Char -> Bool
conv_str c = if c == '0' then True else False

ex7 :: [Char] -> Bool
ex7 cadena = or (map conv_str cadena)

--lambda
--ex7 cdena = or (map (\ c -> if c=='0' then True else False) cadena)

--la funcion ==, c == '0', == c '0', == '0'
ext7' :: [Char] -> Bool
ext7' cadena = or (map (=='0') cadena)

-- EXCERCISE 8. Expand the following applicaton fddr max 0 [1,5,3]

-- => max 1 (max 5 (max 3 0))
-- => max 1 (max 5 3)
-- => max 1 5
-- => 5

------ EXCERCISE 9 -------
addNumber :: Maybe Int -> Maybe Int -> Maybe Int
addNumber (Just x) (Just y) = Just (x+y)
addNumber (Just x) Nothing = Just x
addNumber Nothing (Just y) = Just y
addNumber Nothing Nothing = Nothing 

addJust :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
addJust lista1 lista2 = zipWith addNumber lista1 lista2

------ EXCERCISE 10 -------
data Metal = Oro | Plata | Bronce 
			| Zinc | Cobre | Hierro
			deriving (Eq, Show)

------ EXCERCISE 11 -------
data Monedas = VeinteCentavos Int | CincuentaCentavos Int
				| UnPeso Int | DosPesos Int | CincoPesos
				| DiezPesos | VeintePesos Int
				deriving (Eq, Show)

------ EXCERCISE 12 -------
data Universal = BOOL Bool | CHAR Char | INTEGER Integer | DOUBLE Double | STRING String
				deriving (Eq, Show)

------ EXCERCISE 13 -------
--data Tuplas = (a,b,c,d)
data Tuplas a b c d = Tupla0 | Tupla1 a | Tupla2 a b | Tupla3 a b c | Tupla4 a b c d
	deriving(Eq, Show)

------ EXCERCISE 14 -------
--quadratic :: Double -> Double -> Double -> (Double, Double, Double, Double)

quadratic a b c 
	= let d = (b**2 - 4 * a * c);
		in (quad a b c d)
		--x1 = (-b + d) / (2*a);
		--x2 = (-b - d) / (2*a)
	--in (x1, x2)
	
quad :: Double -> Double -> Double -> Double-> Either String (Double, Double)
quad a b c d | d < 0 = Left "It does not have a real solution"			 
			| d >= 0 = Right (((-b + sqrt d) / (2*a)), ((-b - sqrt d) / (2*a)))

quartatic_o :: Float -> Float -> Float -> (Float, Float)
quartatic_o a b c = if discriminante < 0 then error "Imaginario"
					else (x1, x2)
					where
						x1 = part1 + sqrt (discriminante) / (2*a)
						x2 = part1 - sqrt (discriminante) / (2*a)
						discriminante = b**2 - 4 * a * c
						part1 = -b / (2*a)

--quadratic_mix :: Float -> Float ->Float -> (Float, Float)
--quadratic_mix a b c = let
--						discriminante = b**2-4*a*c 
--						if discriminante < 0
--							then error "Imaginario"
--							else (((-b + sqrt discriminante) / (2*a)),
--								((-b - sqqrt discriminante)))


--EJERCICIO 15

ex15 :: Show a => Maybe a -> String
ex15 Nothing = []
ex15 (Just a) = show a

--EJERCICIO 16

ex16 :: [Int] -> [Int] -> [Int]
ex16 a b = zipWith bitAnd a b


bitOr :: Int -> Int -> Int
bitOr 0 0 = 0
bitOr x y = 1

bitAnd :: Int -> Int -> Int
bitAnd 1 1 = 1
bitAnd x y = 0

--EJERCICIO 17

--[1,False] --- Debe de ser del tipo Int o Bool, [1,2] o [True, False]
--[(3,True), (False, 9)] --- Las tuplas deben de ser del mismo tipo [(3, True), (9, False)]
--'a' > "b" --- deben de ser los dos del tipo char 'a' > 'b'
-- '2' ++ 'a' -- si se quiere concatenar debe utilizarse : 2:a
-- 2 == False -- deben de ser del mismo tipo, 2 == 3 o False == False
-- [[1],[2],[[3]]] -- sobran los parantesis cuadrados del 3, [[1],[2],[3]]

--EJERCICIO 18

ex18 :: Num a => (a,a) -> a
ex18 (x,y) = x + y

--EJERCICIO 19

-- se necesita una definición que incluya cuando tienes de parametro de entrada algo distino de nothing
f :: Maybe a -> [a]
f Nothing = []
f (Just a) = [a]

-- EJERCICIO 20

ex20 :: [Maybe a] -> [a]
ex20 as = [a | Just (a) <- as]

--EJERCICIO 21

ex21 :: [Int] -> Int -> [Int]
ex21 lista1 n = [x | x <- lista1, x > n]

--EJERCICIO 22

ex22 :: [Int] -> Int -> [Int]
ex22 lista a = [x| (x,y) <- zip [0..] lista , y == a]

--EJERCICIO 23

ex23 :: [Int]
ex23 = [x | x <- [1..20], [c | c <- [1..x], c * c == x] == [] ]

-- EJERCICIO 24

ex24 :: [Char] -> Char -> Int
ex24 cadena a = foldr (\c acc -> if c== a then acc+1 else acc) 0 cadena

--EJERCICIO 25

ex25 :: [Char] -> Char -> [Char]
ex25 cadena a = foldr (\c acc -> if c /= a then c:acc else acc) [] cadena

--EJERCICIO 26

ex26 :: [a] -> [a]
ex26 b = foldl (\acc a -> a:acc) [] b

--EJERCICIO 27

ex27 :: [Int] -> Maybe Int
takeLast :: Maybe Int -> Int -> Maybe Int

takeLast Nothing x = Just x
takeLast (Just x) y = Just y

ex27 lista = foldl takeLast Nothing lista

--EJERCICIO 27 solución en el salón de clases

ex27_1 :: [Maybe Int] -> Maybe Int
ex27_1 lista = foldl (\acc c -> c) Nothing lista 