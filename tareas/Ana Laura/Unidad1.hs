-- Exercise 1. Evaluate these expressions, and check with the computer:

-- True && False       	-> Regresa el valor de False, que es el resultado de la operacion and
-- True || False       	-> Regresa el valor de True, que es el resultado de la opracion or
-- not False           	-> Regresa True, que es la negacion de False
-- 3 <= 5 && 5 <= 10   	-> Regresa un True, que es el resultado de la comparacion de la expresion True && True de acuerdo a los valores dados
-- 3 <= 20 && 20 <= 10		-> Regresa un False, que es el resultado de la comparacion de la expresion True && False de acuerdo a los valores
-- False == True    		-> Regresa un False, ya que False es diferente de True
-- 1 == 10 	 			-> Regresa un False, ya que el valor de 1 es diferente de 10
-- 1 /= 20 				-> Regresa un True, ya que se esta comparando si los valores de 1 y 20 son diferentes 
-- 1 /= 1 					-> Regresa un False, ya que se esta comparando si los valores 1 y 1 son diferentes.


--Exercise 3. Write a function that takes a character and returns True if the character is ’a’ and False otherwise.
ex3 :: Char -> Bool
ex3 caracter | caracter == 'a' = True
             | otherwise = False

g :: Int -> Int
g x | x < 0 = (-1)
    | x == 0 = 0
    | x > 0 = 1

-- Exercise 4. Write a function that takes a string and returns True if the string is "hello" and False otherwise. 
-- This can be done by specifying each element of the string in the list pattern (e.g. ’h’:’i’:[]).

ex4 :: String -> Bool
ex4 ('h':'e':'l':'l':'o':xs) = True
ex4 (x:xs) = False


-- Exercise 5. Write a function that takes a string and removes a leading space if it exists.

ex5 :: String -> String
ex5 (' ':cola) = cola
ex5 (cola) = cola


-- Exercise 6. Suppose a program has read in a list of numbers of type Int.
-- Each number is intended to represent a Boolean value, where 0 means
-- False, 1 means True, and any other number constitutes invalid input.
-- Write a function convert :: [Int] -> [Bool] that converts a list of
-- numbers to the corresponding Booleans.

convertidor :: Int -> Bool
convertidor num | num == 1 = True
             | num == 0 = False
         
ex6 :: [Int] -> [Bool]
ex6 lista = map (convertidor) lista


-- Exercise 7. Write a function member0 :: String -> Bool that takes a list
-- of Char values (i.e., a String), and returns True if at least one of the
-- characters is ’0’ and False otherwise. Hint: use map and the function
-- or, which takes a list of Boolean values and returns True if at least one
-- of them is True; otherwise it returns False. Thus or [False, True,
-- False] => True, but or [False, False, False] => True.

ex7 :: [Char] -> Bool
ex7 cadena = or (map (=='O') cadena)

-- Exercise 8. Expand the following application: 
-- foldr max 0 [1,5,3] = max 1 (max 5 (max 3 0))
--                     = max 1 (max 5 3)
--                     = max 1 5
--                     = 5

-- Exercise 9. Write a function that takes two lists of type [Maybe Int] and
-- examines the pair of list heads before looking at the rest of the lists. It
-- returns a list in which the Ints of each pair have been added if both are of
-- the form Just n, preserving any Just n value otherwise. For example,
-- addJust [Just 2, Nothing, Just 3]
-- [Nothing, Nothing, Just 5]
-- => [Just 2, Nothing, Just 8]

ex :: Maybe Int -> Maybe Int -> Maybe Int
ex (Just a) (Just b) = Just (a + b)
ex (Just a) Nothing = Just a
ex Nothing (Just b) = Just b
ex Nothing Nothing = Nothing

ex9 :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
ex9 lst1 lst2 = zipWith ex lst1 lst2

-- Exercise 10. Define a data type that represents six different metals and automatically
-- creates versions of (==) and show.

data Metales = Oro | Plata | Bronce | Cobre | Titanio | Hierro deriving (Eq, Show)


-- Exercise 11. Suppose that you have some coins that have been sorted into
-- piles, each of which contains only one kind of coin. Define a data type
-- that can be used to represent the piles of coins.

data Monedas = UnPeso Int | DosPesos Int | CincoPesos Int | DiezPesos deriving (Eq, Show)

-- Exercise 12. A universal type is one in which any type can be represented.
-- Each different type is identified by its own constructor, which serves as a
-- distinguishing tag. For example, here is a universal type that represents
-- three different types of number:
-- data Number = INT Int | INTEGER Integer | FLOAT Float deriving (Eq, Show)

-- Define a universal type that contains Booleans, characters, and integers (Ints).

data Tipos = BOOL Bool | CHAR Char | INT Int deriving (Eq, Show)


-- Exercise 13. Define a type that contains tuples of up to four elements.

data Tuples a b c d = Tuple0 | Tuple1 a | Tuple2 a b
                       | Tuple3 a b c | Tuple4 a b c d
                       deriving (Eq, Show)  


-- Exercise 14. The quadratic equation a · x2 +b · x+c = 0 has two roots, given by the formula
-- x = −b ± √b2 − 4 · a · c
--            2 · a

-- as long as the discriminant (the expression under the square root sign)
-- is non-negative. If the discriminant is negative the roots are complex.

-- Define a function that finds the real solutions of the quadratic equation,
-- and reports failure if they don’t exist.

ex14 :: Float -> Float -> Float -> (Float, Float)
ex14 a b c = if discriminante < 0 then error "Imaginario"
                   else (x1, x2)
                   where 
                    x1 = part1 + sqrt (discriminante) / (2 * a)
                    x2 = part1 - sqrt (discriminante) / (2 * a)
                    discriminante = b **2 - 4 * a * c
                    part1 = -b / (2 * a)


-- Exercise 15. Define a function
-- showMaybe :: Show a => Maybe a -> String
-- that takes a Maybe value and prints it.

ex15 :: Show a => Maybe a -> String
ex15 Nothing = ""
ex15 (Just a) = show a

-- Exercise 16. A Bit is an integer that is either 0 or 1. A Word is a list of bits
-- that represents a binary number. Here are some binary values that can
-- be represented by Words:
-- [1,0] => 2
-- [1,0,0,1] => 9
-- [1,1,1] => 7

-- We can define functions that are the Bit equivalent of or and and as
-- follows:
-- bitOr :: Int -> Int -> Int
-- bitOr 0 0 = 0
-- bitOr x y = 1
-- bitAnd :: Int -> Int -> Int
-- bitAnd 1 1 = 1
-- bitAnd x y = 0

-- Now it is possible to take the ’bitwise’ and of two words as follows:
-- bitwiseAnd [1,0,0] [1,0,1]
-- => [bitAnd 1 1, bitAnd 0 0, bitAnd 0 1]
-- => [1,0,0]
-- bitwiseAnd [0,0,0] [1,1,0]
-- => [0,0,0]

-- Write a function bitwiseAnd that takes two Words and creates a third
-- Word that is the bitwise and of the two Words.

bitOr :: Int -> Int -> Int
bitOr 0 0 = 0
bitOr x y =  1

bitAnd :: Int -> Int -> Int
bitAnd 1 1 = 1
bitAnd x y = 0

ex16 :: [Int] -> [Int] -> [Int]
ex16 a b = zipWith (bitAnd) a b




-- Exercise 17. Each of the following expressions has a type error. Change the
-- expression so that the type error no longer occurs.

-- [1, False]  La forma correcta es [True,False] ya que al introducer uno no coinciden los tipos de datos, deben de ser Bool
-- 2 == False  Para esta comparacion los dos valores a comparar deben ser del mismo tipo  
-- ’a’ > "b"   La forma correcta de la comparacion, es que los dos sean del mismo tipo, por lo que tienen que ser los dos ‘a’> ‘b’
-- [[1],[2],[[3]]]               La forma correcta es [[1],[2],[3]]
-- [(3,True), (False,9)]         Forma correcta [(3,True), (9,False)]
-- ’2’ ++ ’a’                    La forma correcta es “2”++”a” ya que los 2 son char



-- Exercise 18. What caused the type error in this definition and application?
-- f :: Num a => (a,a) -> a
-- f (x,y) = x + y
-- f (True,4)

-- El error que se da es por que en los parametros de la funcion se le esta intriduciendo un valor booleano
-- Segun la definicion del tipo en la funcion, estos deben de ser de tipo num



-- Exercise 19. Why does this definition produce an error when used?
-- f :: Maybe a -> [a]
-- f Nothing = []

-- f (Just 3)

-- El error es causado, por que en la funcion no se agrego el constructor de Just

-- Exercise 20. Write a list comprehension that takes a list of Maybe values and
-- returns a list of the Just constructor arguments. For example,
-- [Just 3, Nothing, Just 4] => [3,4]

ex20 :: [Maybe a]-> [a]
ex20 as = [a | (Just a) <- as]


-- Exercise 21. Using a list comprehension, write a function that takes a list of
-- Int values and an Int value n and returns those elements in the list that
-- are greater than n.

ex21 :: [Int] -> Int -> [Int]
ex21 lista xs = [ x | x <- lista ,x > xs] 

-- Exercise 22. Write a function
-- f :: [Int] -> Int -> [Int]
-- that takes a list of Int values and an Int and returns a list of indexes at
-- which that Int appears.

ex22 :: [Int] -> Int -> [Int]
ex22 haystack needle = [ i | (i,v) <- zip [0..] haystack, v == needle]


-- Exercise 23. Write a list comprehension that produces a list giving all of the
-- positive integers that are not squares in the range 1 to 20.

-- let isSquare n = elem n (takeWhile (<=n) [x*x | x <- [1..]]) in [x|x <- [1..20], not (isSquare x)]

-- Exercise 24. Write a function that uses foldr to count the number of times
-- a letter occurs in a string.

ex24 :: String -> Char -> Int
ex24 cs aguja = foldr (\c acc -> if c == aguja then acc + 1 else acc) 0 cs

-- Exercise 25. Write a function using foldr that takes a list and removes each
-- instance of a given letter.

ex25 :: [Char]-> Char -> [Char]
ex25 lista caracter = foldr (\c acc -> if c== caracter then acc else c:acc) [] lista

-- Exercise 26. Using foldl, write a function
-- rev :: [a] -> [a]
-- that reverses its list argument.

ej26 :: [a] -> [a]
ej26 cs = foldl (\acc c -> c:acc) [] cs

-- Exercise 27. Using foldl, write a function
-- maybeLast :: [a] -> Maybe a
-- that takes a list and returns the last element in it if there is one, otherwise
-- it returns Nothing.

last1 :: Maybe a -> a -> Maybe a
last1 Nothing x = Just x
last1 (Just y) x = Just x

ex27 :: [a] -> Maybe a
ex27 lst = foldl last1 Nothing lst




