--Ejercicio 9
exe9 :: Maybe Int -> Maybe Int -> Maybe Int
exe9 (Just a) (Just b) = Just (a + b)
exe9 (Just a) Nothing = Just a
exe9 Nothing (Just a) = Just a
exe9 Nothing Nothing = Nothing

exe9_1 :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
exe9_1 lista1 lista2 = zipWith exe9 lista1 lista2

--Ejercicio 10
data Metales = Plata | Oro | Bronce | Acero | Cobre | Aluminio deriving (Eq, Show)

--Ejercicio 11
data Monedas = UnP Int | DosP Int | CincoP Int | DiesP Int deriving (Eq , Show)

exe11 :: Monedas -> Int
exe11 (UnP x) = x
exe11 (DosP x) = x*2
exe11 (CincoP x) = x*5
exe11 (DiesP x) = x*10


exe11_1 :: [Monedas] -> [Int]
exe11_1 lista =  map exe11 lista

--Ejercicio 12
data Universal = BOOL Bool | CHARACTER Char | INTEGER Int deriving (Eq, Show)



--Ejercicio 13
--data Tuples a b c d = Tuple0 | Tuple1 a | Tuple2 a b
  --                     | Tuple3 a b c | Tuple4 a b c d
    --                   deriving (Eq, Show)

--igualdad :: [ Tuples ] -> [Tuples] -> Bool
--igualdad (t:ts) (h:hs) = t == h && igualdad ts hs
--igualdad [] hs = False
--igualdad [] [] = True  

--Ejercicio 14
exe14 a b c = let d = (b**2 - 4 * a * c)
                   in (quad a b c d)
quad :: Double -> Double -> Double -> Double -> Either String (Double, Double)
quad a b c d | d < 0 = Left "It does not have a real solution"
             | d >= 0 = Right (((-b + sqrt d) / (2 * a)), ((-b - sqrt d) / (2 * a)))


--Ejercicio 15
exe15 :: Show a => Maybe a -> String
exe15 Nothing = []
exe15 (Just a) = show a



--Ejercicio 16
exe16_1 :: Int -> Int -> Int
exe16_1 1 1 = 1
exe16_1 x y = 0

exe16 :: [Int]->[Int]->[Int]
exe16 a b = zipWith (exe16_1) a b


--Ejercicio 17
--[1, 2] 
--[(3,True), (9,False)] 
--"a" > "b"
--"2" ++ "a"
--2 == 3 
--[[1],[2],[3]]


--Ejercicio 18
--f :: Num a => (a,a) -> a
--f (x,y) = x + y
--f (True,4)
--Resultado: La funcion sólo admite valores de tipo Numerico.


--Ejercicio 19
--f :: Maybe a -> [a]
--f Nothing = []
--f (Just 3)
--Resultado: Sólo falta que el ultimo elemento de la función retorne la lista.

--Ejercicio 20
exe20 :: [Maybe a]-> [a]
exe20 as = [a | (Just a) <- as]


--Ejercicio 21
exe21 :: [Int] -> Int -> [Int]
exe21 lista x = [e | e <- lista, e > x]

--Ejercicio 22
exe22 :: [Int] -> Int -> [(Int,Int)]
exe22 haystack needle = [(i,v) | (i,v) <- zip [0..] haystack, v == needle]

--Ejercicio 23
exe23 :: [Int] -> [Int]
exe23 lista = [y|y<-[1..20], not (elem y [x*x|x<-lista])]

--Ejercicio 24
exe24 :: [Char] -> Char -> Int
exe24 cs aguja = foldr (\c acc-> if c == aguja then acc + 1 else acc) 0 cs

--Ejercicio 25
exe25 :: [Char] -> Char -> [Char]
exe25 lista x = foldr(\c acc -> if c /= x then c:acc else acc) [] lista

--Ejercicio 26
exe26 :: [a] -> [a]
exe26 cs = foldl (\acc c -> c:acc ) [] cs

--Ejercicio 27
exe27 ::[Maybe a] -> Maybe a
exe27 lista = foldl (\acc c -> c) Nothing lista

