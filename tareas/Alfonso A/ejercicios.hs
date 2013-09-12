is_a :: Char -> Bool
is_a caracter | caracter == 'a' = True
              | otherwise = False

funcG :: Int -> Int
funcG numero | numero == 0 = 0 
             | numero < 0 = -1
             | numero > 0 = 1

is_hello :: String -> Bool
is_hello ('h':'e':'l':'l':'o':xs) = True
is_hello (x:xs) = False

remove_space :: String -> String
remove_space (' ':cola) = cola
remove_space (head:cola) = head:cola

convertidor6 :: Int -> Bool
convertidor6 x | x == 1 = True
              | x == 0 = False

ej_6 :: [Int] -> [Bool]
ej_6 lista = map (convertidor6) lista

convertidor7 :: Char -> Bool
convertidor7 c = if c=='O' then True else False

ej_7 :: [Char] -> Bool
ej_7 palabra = or (map convertidor7 palabra)

ej_7' :: [Char] -> Bool
ej_7' cadena = or (map (=='O') cadena)

fa :: Num a => (a,a) -> a
fa (x,y) = x + y

--9
--ej_9' :: [Maybe Int] -> [Maybe Int] -> [Int]
--ej_9' xs ys = [x + y | (Just x) <- xs, (Just y) <- ys]
--ej_9 xs ys = [x + y | x <- xs, y <- ys]

ej_9 :: [Int] -> [Int] -> [Int]
ej_9 [] [] = []
ej_9 [] ys = ys
ej_9 xs [] = xs
ej_9 (x:xs) (y:ys) = (x + y) : ej_9 xs ys 

ej_9b xs ys = (head xs + head ys) : ej_9b (tail xs) (tail ys)

--10
data Metals = Oro | Plata | Bronce | Cobre | Estaño | Hierro
              deriving(Eq, Show)

--11
data Monedas = DeAPeso Int | DeADos Int | DeCinco Int | DeDiez Int
              deriving(Eq, Show)

--12
data Bit = BOOL Bool | CHAR Char | INT Int
           deriving (Eq, Show)
                    
--13
data Tuplas a b c d = Tuplas1 a | Tuplas2 a b | Tuplas3 a b c | Tuplas4 a b c d deriving (Eq, Show)

data Tuples a b c d = Tuple1 a 
                    | Tuple2 a b 
                    | Tuple3 a b c 
                    | Tuple4 a b c d
                    deriving (Eq, Show)

--14
cuadratica :: Double -> Double -> Double -> (Double, Double)
cuadratica a b c = if ((b**2) - 4*a*c) < 0 then error "No se puede"
else ((( (-b) + sqrt((b**2) - 4*a*c) ) / 2*a), (( (-b) - sqrt((b**2) - 4*a*c) ) / 2*a))

--15
showMaybe :: Show a => Maybe a -> String
showMaybe Nothing = []
showMaybe (Just a) = show a

--16
bitOr :: Int -> Int -> Int
bitOr 0 0 = 0
bitOr x y = 1

bitAnd :: Int -> Int -> Int
bitAnd 1 1 = 1
bitAnd x y = 0

bitWiseAnd :: [Int] -> [Int] -> [Int]
bitWiseAnd a b = zipWith (bitAnd) a b

ej_20 :: [Maybe a] -> [a]
ej_20 as = [a | (Just a) <- as]

ej_22 :: [Int] -> Int -> [(Int,Int)]
ej_22 lista buscado = [(i,v) | (i,v) <- zip [0..] lista, v == buscado]

--Regresa maybies y just filtrados
f20 :: [Maybe a]-> [a]
f20 as = [a | (Just a) <- as]

ex_21::[Int] -> Int -> [Int]
ex_21 xs n = [x | x <- xs, x > n]

f22 :: [Int] -> Int -> [(Int,Int)]
f22 haystack needle = [(i,v) | (i,v) <- zip [0..] haystack, v == needle]

ex_23:: [Int]
ex_23 = [x | x <- [1..20], null [n | n <- [1..x], n * n == x]]

f24 :: [Char] -> Char -> Int
f24 cs aguja = foldr (\c acc-> if c == aguja then acc + 1 else acc) 0 cs

--ej_24 :: [Char] -> Char -> Int
--ej_24 palabra letra = [letra, foldr (==) letra palabra]

ex_25::[Char] -> Char -> [Char]
ex_25 xs letra = foldr (\c acc -> if c == letra then acc else c:acc ) [] xs

--26
rev :: [a] -> [a]
rev cs = foldl (\acc c -> c:acc ) [] cs

--ej_26 :: [a] -> [a]
--ej_26 lista = [foldl (:) a [] | [a] <- lista]

showMaybe' :: Maybe a -> a -> Maybe a
showMaybe' _ a = Just a

ex_27::[a] -> Maybe a
ex_27 = foldl showMaybe' Nothing
--ex_27 lista = foldl showMaybe' Nothing lista
