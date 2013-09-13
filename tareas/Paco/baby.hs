doubleMe x = x + x
doubleUs x y = x*2 + y*2

is_a :: Char -> Bool
is_a caracter | caracter == 'a' = True
     	      | otherwise = False

g :: Int -> Int
g valor | valor == 0 = 0
  	| valor < 0 = -1
	| valor > 0 = 1

is_hello :: String -> Bool
is_hello ('h':'e':'l':'l':'o':xs) = True
is_hello (x:xs) = False

remove_space :: String -> String
remove_space (' ':cola) = cola
remove_space (head:cola) = head:cola

ex6 :: Int -> Bool
ex6 num | num == 1 = True
    	| num == 0 = False

convert :: [Int] -> [Bool]
convert lista = map(ex6) lista

memberO :: String -> Bool
memberO cadena = or (map (=='O') cadena)

------------------------------TAREA------------------------

--Ex 8
--foldr max 0 [1,5,3]  => Expand
--max 1(foldr max 0 [5,3])
--max 1(max 5(foldr max 0 [3]))
--max 1(max 5 (max 3 0))


--Ex 9
addJust :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
addJust a b = zipWith (adding) a b

adding :: Maybe Int -> Maybe Int -> Maybe Int
adding (Just a) (Just b) = Just (a + b)
adding (Just a) Nothing = Just a
adding Nothing (Just b) = Just b
adding Nothing Nothing = Nothing

--Ex 10
data Metals = Oro | Plata | Bronce | Aluminio | Hierro | Platino
     	    deriving (Eq, Show)

--Ex11
data Coins = Diez Int | Veinte Int | Cinco Int | Dos Int | Uno Int
     	   deriving (Eq, Show)

--Ex 12
data Universal = BOOL Bool | CHAR Char | INT Int
     	       deriving (Eq, Show)

--Ex 13
data Tuples a b c d = Tupla1 a | Tupla2 a b | Tupla3 a b c
     	      	      | Tupla4 a b c d 
		      deriving (Eq, Show)

--Ex 14
equation :: Double -> Double -> Double -> (Double,Double)
equation a b c = if (b*b) >= (4*a*c) then  evalualos a b c
	       	 else error "Wrong"

evalualos :: Double -> Double -> Double -> (Double, Double)
evalualos a b c = ((-b + sqrt((b*b)-(4*a*c)))/(2*a), (-b - sqrt((b*b)-(4*a*c)))/(2*a))

--newtype Bit =  0 | 1
--      	    deriving(Eq, Show)

-- bitOr :: Bit -> Bit -> Bit
-- bitOr 0 0 = 0
-- bitOr x y = 1

-- bitAnd :: Bit -> Bit -> Bit
-- bitAnd 1 1 = 1
-- bitAnd x y = 0

-- bitWiseAnd :: [Bit] -> [Bit] -> [Bit]
-- bitWiseAnd a b = zipWith (bitAnd) a b

-- f :: Num a => (a,a) -> a
-- f (x,y) = x + y

--Ex 15
showMaybe :: Show a => Maybe a -> String
showMaybe (Just a) = show a
showMaybe Nothing = []

--Ex 17
--[1, False]  -> [True, False]

--’2’ ++ ’a’  -> "2" ++ "a"

--[(3,True), (False,9)] -> [(3,True), (9,False)]

--2 == False -> 2==4

--’a’ > "b" -> 'a' > 'b'

--[[1],[2],[[3]]] -> [[1],[2],[3]]


--Ex 19
-- f :: Maybe a -> [a]
-- f Nothing = []
-- f (Just 3)

f :: Maybe a -> [a]
f Nothing = []
f (Just a) = a:[]

--Ex 21
ex21 :: [Int] -> Int -> [Int]
ex21 a b = [c | c <- a, c > b]

--Ex 23
ex23 :: [Int]
ex23 = [ a | a <- [1..20], isSquared a]

isSquared :: Int -> Bool
isSquared a = if length ([c | c <- [1..a], a == c*c]) /= 0
	      then True
	      else False
 
-- Ex 25 
goodByeMyChar :: Char-> Char-> String -> String 
goodByeMyChar c str acum = if c == str 
	      	    	   then acum 
			   else str:acum 
removeChar :: String -> Char -> String 
removeChar str c = foldr (goodByeMyChar c) [] str

--Ex 27
maybeLast :: [a] -> Maybe a
maybeLast a = foldl (funcion) Nothing a

funcion :: Maybe a -> a -> Maybe a
funcion Nothing a = Just a
funcion acum a = Just a
