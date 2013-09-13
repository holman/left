ex3 :: Char -> Bool
ex3 caracter | caracter == 'a' = True
             | otherwise = False

g :: Int -> Int
g x | x < 0 = (-1)
    | x == 0 = 0
    | x > 0 = 1

ex4 :: String -> Bool
ex4 ('h':'e':'l':'l':'o':xs) = True
ex4 (x:xs) = False

ex5 :: String -> String
ex5 (' ':cola) = cola
ex5 (cola) = cola

convertidor :: Int -> Bool
convertidor num | num == 1 = True
             | num == 0 = False
         
ex6 :: [Int] -> [Bool]
ex6 lista = map (convertidor) lista

ex7 :: [Char] -> Bool
ex7 cadena = or (map (=='O') cadena)

addJust :: Maybe Int -> Maybe Int -> Maybe Int
addJust (Just a) (Just b) = Just (a + b)
addJust (Just a) Nothing = Just a
addJust Nothing (Just a) = Just a
addJust Nothing Nothing = Nothing
addMaybe :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
addMaybe lst1 lst2 = zipWith addJust lst1 lst2

data Metal = Oro | Plata | Cobre | Bonce | Aluminio | Hierro deriving (Eq, Show)

data Coins = Uno Int | Dos Int | Cinco Int | Diez Int | Veinte Int | Cincuenta Int | Cien Int deriving (Eq, Show)

data Universal = BOOL Bool | CHARATER Char | INT Int deriving(Eq,Show)

data Tuplas a b c d = Tupla1| Tupla2 a| Tupla3 a b| Tupla4 a b c| Tupla5 a b c d deriving(Eq,Show)

quadratic_mix :: Float -> Float -> Float -> (Float, Float)
quadratic_mix a b c = let 
                        discriminante = b **2 - 4 * a * c
                        in 
                         if discriminante < 0 
                          then error "Imaginario"
                          else (((-b + sqrt discriminante) / (2 * a)), 
                                ((-b - sqrt discriminante) / (2 * a)))


 --showMaybe :: Show a => Maybe a -> String
 --showMaybe Nothing = []
 --showMaybe (Just a) = show a		

bitOr :: Int -> Int -> Int
bitOr 0 0 = 0
bitOr x y = 1

bitAnd :: Int -> Int -> Int
bitAnd 1 1 = 1
bitAnd x y = 0					

--[1, False]  la forma correcta es [True,False] ya que al introducer uno no coinciden los tipos de datos, deben de ser Bool
--2 == False  2==2 
--’a’ > "b"   la forma correcta debe de  ser  ‘a’> ‘b’  ya que los 2 son char
-- [[1],[2],[[3]]]-> correcta [[1],[2],[[3]]
--[(3,True), (False,9)]-> Forma correcta [(3,True), (9,False)]
--’2’ ++ ’a’  “2”++”a” ya que los 2 son char

f :: Num a => (a,a) -> a
f (x,y) = x + y


-- :: Maybe a -> [a]
--f Nothing = []
--Falta el constructor del Just

 --20
filterMaybes :: [Maybe a]-> [a]
filterMaybes as = [a | (Just a) <- as]

f21 :: [Int] -> Int -> [Int]
f21 lista xs = [ x | x <- lista ,x > xs] 

f22 :: [Int] -> Int -> [(Int,Int)]
f22 haystack needle = [(i,v) | (i,v) <- zip [0..] haystack, v == needle]

--let isSquare n = elem n (takeWhile (<=n) [x*x | x <- [1..]]) in [x|x <- [1..20], not (isSquare x)] 

f24 :: String -> Char -> Int
f24 cs aguja = foldr ( \c acc -> if c == aguja  then acc + 1 else acc) 0 cs

f25 :: [Char] -> Char-> [Char]
f25 cs lista = foldr(\c acc-> if c== lista then acc else c:acc) [] cs  

f26 :: [a] -> [a]
f26 as= foldl (\acc c -> c:acc) [] as 

takeLast :: Maybe a -> a -> Maybe a
takeLast Nothing x = Just x
takeLast (Just y) x = Just x
maybeLast :: [a] -> Maybe a
maybeLast lst = foldl takeLast Nothing lst

