-- Ejercicios del Capítulo 1 
-- Brenda Durón 6G Tiempo Parcial


ex1_1 =  True && False
ex1_2 =  True || False
ex1_3 = not False
ex1_4 = 3 <= 5 && 5<= 10 
ex1_5 = 3 <= 20 && 20 <= 10
ex1_6 = False == True
ex1_7 = 1 == 1
ex1_8 = 1 /= 2
ex1_9 = 1 /= 1

ex2_1 = [x | x <- [1,2,3], False]
ex2_2 = [not (x && y) | x <- [False, True], y <- [False, True]]
ex2_3 = [x || y | x <- [False, True], y <- [False, True],
	x /= y]
ex2_4 = [[x,y,z] | x <- [1..50], y <- [1..50], z <- [1..50],
	x ** 2 + y ** 2 == z ** 2]


ex3 :: Char -> Bool
ex3 car | car == 'a' = True 
		| otherwise  = False 


ex4 :: String -> Bool
ex4   ('h':'e':'l':'l':'o':xs) = True
ex4 (x:xs) = False

ex5 :: String -> String
ex5 cadena = if head (cadena) == ' ' then tail (cadena) else cadena

ex5B :: String -> String
ex5B (' ':cola) = cola
ex5B (cola) = cola


ex6 ::[Int] -> [Bool]
ex6 lista = map (convertirBool) lista

convertirBool :: Int -> Bool
convertirBool valor | valor == 0 = False 
	| valor == 1 = True



ex7 :: [Char] -> Bool
ex7 cadena = or (map (=='o') cadena)

ex7B :: [Char] -> Bool
ex7B cadena = or (memberO cadena)

memberO :: [Char] -> [Bool]
memberO cadena = [if c=='o' then True else False | c <- cadena]


ex8  = "Expand the apllication"
-- foldr max 0 [1,5,3]
-- => max 1 (max 5 (max 3 0))
-- => max 1 ( max 5 3)
-- => max 1 5
-- => 5

ex9 :: [Maybe Int] ->  [Maybe Int] -> [Maybe Int]
ex9 a b =  zipWith sumMaybeList a b

sumMaybeList :: Maybe Int -> Maybe Int -> Maybe Int
sumMaybeList (Just x) (Just y) = Just (x + y)
sumMaybeList (Just x) Nothing = Just x
sumMaybeList Nothing (Just y)  = Just y
sumMaybeList Nothing Nothing = Nothing


--ex10 
data Metales = Plata | Cobre | Bronce | Acero | Aluminio | Laton deriving (Eq,Show)

--ex11
data Moneditas =  Centavo10 Int | Centavo50 Int| Peso1 Int | Peso2 Int | Peso5 Int | Peso10 Int  deriving (Eq,Show)

--ex12
data Any = BOOL Bool | CHAR Char | INT Int deriving (Eq,Show)

--ex13
data Tuplas a b c d = Tupla0 | Tupla1 a | Tupla2 a b| Tupla3 a b c | Tupla4 a b c d deriving (Eq,Show) 

--Tupla0 = ()
--Tupla1 a = (a)
--Tupla2 a b = (a,b)
--Tupla3 a b c = (a,b,c)
--Tupla4 a b c d = (a,b,c,d)

--igualdad :: Tuplas -> Tuplas -> Bool
--igualdad (t:ts) (h:hs) =  t == h && igualdad ts hs
--igualdad [] [] = True
--igualdad [] hs = False


ex14 :: Float -> Float ->Float ->  [Char]
ex14 a b c = if (validaV2 a b c) then  show (calculaEc1 a b c) ++ " " ++ show (calculaEc2 a b c)  else "Error: Las constantes dadas generan aun solucion que no es real"

validaV :: Float -> Float ->Float -> Bool
validaV a b c = elem [a,b,c] ex14val

validaV2 :: Float -> Float ->Float -> Bool
validaV2 a b c = if b^2 >= (4*a*c) then True else False

resRaiz :: Float -> Float ->Float -> Float
resRaiz a b c = sqrt (b^2 - (4*a*c))

calculaEc1 :: Float -> Float ->Float -> Float
calculaEc1 a b c =  (-b + resRaiz a b c)/ (2*a) 

calculaEc2 :: Float -> Float ->Float -> Float
calculaEc2 a b c = (-b - resRaiz a b c)/ (2*a) 

ex14val = [[a,b,c] | a <- [1..10], b <- [1..10], c <- [1..10],	b^2 >= (4*a*c)]


--ex14PePe
quadratic a b c
	= let d= (b^2 - (4*a*c));
		in (quad a b c d)

quad :: Double -> Double -> Double -> Double -> Either String (Double,Double)
quad a  b c d  | d < 0 = Left "Error solucion raiz irreal o algo asi"
				| d >=0 = Right (((-b -(sqrt (b^2 - (4*a*c))))/2*a),((-b +(sqrt (b^2 - (4*a*c))))/2*a))

--ex14Tavo
--quadratic_O :: Float -> Float -> Float -> Float 

ex15 :: Show a => Maybe a -> String
ex15 Nothing = []
ex15 (Just a) = show a 


--ex16-- bitwiseAnd
ex16 :: [Int] -> [Int] -> [Int]
ex16 a b = zipWith bitAnd a b


bitOr :: Int -> Int -> Int
bitOr 0 0 = 0
bitOr x y = 1

bitAnd :: Int -> Int -> Int
bitAnd 1 1 = 1
bitAnd x y = 0


----ex17----
-- [1, False]  --> Los elementos de una lista deben ser del mismo tipo no puede ser Int y Bool --> [1,2]  [True, False]
-- ’2’ ++ ’a’  --> La concatenación con ++ deben ser dos strings no chars  --> "2" ++ "b"
-- [(3,True), (False,9)] --> El arreglo de tuplas debe ser del mismo tipo (Int, Bool) --> [(3,True),(9,False)]
-- 2 == False --> 2 no puede vaslidarse a False -->  2 == 3 => False
-- ’a’ > "b" --> Las comparaciones con < > deben ser entre elementos del mismo tipo --> 'a' > 'b' o "a" > "b"
-- [[1],[2],[[3]]] --> [[1],[2],[3]] 

ex18 :: Num a => (a,a) -> a
ex18 (x,y) = x + y
--ex18 (4,True) --> En la definición de la función se especifica que recibe una tupla de Numeros, y aqui se manda un (Num,Bool)

ex19 :: Maybe a -> [a]
ex19 Nothing = []
ex19 (Just a) = [a]

--ex19 (Just 3) El problema es que no se definió el caso en el que si se recibe un valor distinto de Nothing

ex20 :: [Maybe a] -> [a]
ex20 as = [a | Just (a) <- as]

ex21 :: [Int] -> Int -> [Int]
ex21 lista a = [x| x <- lista , x > a]

ex22 :: [Int] -> Int -> [Int]
ex22 lista a = [x| (x,y) <- zip [0..] lista , y == a]

ex23 =[e | e <- [1..20],[x | x <- [1..e], x * x == e] == []]


ex24 :: [Char] -> Char -> Int
ex24 cadena a = foldr (\c acc -> if c== a then acc+1 else acc) 0 cadena


ex25 :: [Char] -> Char -> [Char] 
ex25 cadena a = foldr (\c acc -> if c/= a then  [c] ++ acc else acc) [] cadena


ex26 :: [a] -> [a]
ex26 lista = foldl (\acc a -> a:acc) [] lista


ex27 :: [Maybe a] ->  Maybe a
ex27 lista = last lista

--Versión del libro --
takeLast :: Maybe a -> a -> Maybe a
takeLast Nothing x = Just x
takeLast (Just y) x = Just x

maybeLast :: [a] -> Maybe a
maybeLast lst = foldl takeLast Nothing lst


ex27_1 :: [Maybe a] ->  Maybe a
ex27_1 lista = foldl (\acc c-> c) Nothing lista

