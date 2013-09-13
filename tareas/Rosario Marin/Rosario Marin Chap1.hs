-----EXERCISE 3----- 
--Write a function that takes a character and returns True if the
--character is ’a’ and False otherwise.

isA :: Char -> Bool
isA 'a' = True
isA c = False

-----EXERCISE 4----- 
--Write a function that takes a string and returns True if the string
--is "hello" and False otherwise. This can be done by specifying each
--element of the string in the list pattern (e.g. ’h’:’i’:[]).

isHello :: String -> Bool
isHello ('h':'e':'l':'l':'o':[]) = True
isHello str = False

-----EXERCISE 5----- 
--Write a function that takes a string and removes a leading space
--if it exists.

--OJO: Que funcion tiene xs???-----

removeSpace :: String -> String
removeSpace [] = []
removeSpace (' ' :xs) = xs
removeSpace xs = xs

-----EXERCISE 6----- 
--Suppose a program has read in a list of numbers of type Int.
--Each number is intended to represent a Boolean value, where 0 means
--False, 1 means True, and any other number constitutes invalid input.
--Write a function convert :: [Int] -> [Bool] that converts a list of
--numbers to the corresponding Booleans.

toBool :: Int -> Bool
toBool 1 = True
toBool 0 = False

convert :: [Int] -> [Bool]
convert xs = map toBool xs

--OJOOOOOOOO: Esta funcion solo es para ejecutarse de la siguiente manera:
--convert[1,0]
--convert[0,1]
--Deberiamos implementar:
--convert[0,1,2,3]
--convert[0,1,2,3,0,0,1]

-----EXERCISE 7----- 
--Write a function member0 :: String -> Bool that takes a list
--of Char values (i.e., a String), and returns True if at least one of the
--characters is ’0’ and False otherwise. Hint: use map and the function
--or, which takes a list of Boolean values and returns True if at least one
--of them is True; otherwise it returns False. Thus or [False, True,
--False] => True, but or [False, False, False] => True.

member0 :: String -> Bool
member0 string = or (map (== '0') string)


-----EXERCISE 8----- 
--Expand the following application:
--foldr max 0 [1,5,3]

--foldr max 0 [1,5,3]
-- => 1 'max' (5 'max' (3 'max' 0))
-- => 1 'max' (5 'max' 3)
-- => 1 'max' 5
-- => 5

--VS

--foldl max 0 [1,2,3]
-- => max (max (max 0 1) 2) 3
-- => max (max 1 2) 3
-- => max 2 3
-- => 3

-----EXERCISE 9----- 
--Write a function that takes two lists of type [Maybe Int] and
--examines the pair of list heads before looking at the rest of the lists. It
--returns a list in which the Ints of each pair have been added if both are of
--the form Just n, preserving any Just n value otherwise. For example,

-- addJust [Just 2, Nothing, Just 3]
-- [Nothing, Nothing, Just 5]
-- => [Just 2, Nothing, Just 8]

-----OJO no le entiendoooooo :(----

addJust :: Maybe Int -> Maybe Int -> Maybe Int
addJust (Just a) (Just b) = Just (a + b)
addJust (Just a) Nothing = Just a
addJust Nothing (Just a) = Just a
addJust Nothing Nothing = Nothing

addMaybe :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
addMaybe lst1 lst2 = zipWith addJust lst1 lst2


-----EXERCISE 10----- 
--Define a data type that represents six different metals and automatically
--creates versions of (==) and show.

-----OJO  Para que sirve deriving (Eq, Show)???------- 
----NO COMPILA!-------

--data Metals = Copper | Silver | Gold | Tin | Platinum | Bronze
--deriving (Eq, Show)

-----EXERCISE 11----- 
--Suppose that you have some coins that have been sorted into
--piles, each of which contains only one kind of coin. Define a data type
--that can be used to represent the piles of coins.

--data Coins = OneP Int | TwoP Int | FiveP Int | TenP Int | TwentyP Int | FiftyP Int | HundredP Int
--deriving (Eq, Show)

-----EXERCISE 12----- 
--A universal type is one in which any type can be represented.
--Each different type is identified by its own constructor, which serves as a
--distinguishing tag. For example, here is a universal type that represents
--three different types of number:

--data Number = INT Int | INTEGER Integer | FLOAT Float
--deriving (Eq, Show)

--Define a universal type that contains Booleans, characters, and integers
--(Ints).

--data Universal = BOOL Bool | INT Int | CHAR Char
--deriving (Eq, Show)

-----EXERCISE 13----- 
--Define a type that contains tuples of up to four elements.

--A separate constructor is needed to indicate the number of elements that
--are present, so we introduce five constructors Tuple0, etc. It would not be
--correct to use a list type, for two reasons: the individual elements should be
--allowed to have different types, and the number of elements must be limited to
--four.

-----EXERCISE 14----- 
--The quadratic equation a · x2 +b · x+c = 0 has two roots, given
--by the formula ....
--as long as the discriminant (the expression under the square root sign)
--is non-negative. If the discriminant is negative the roots are complex.
--Define a function that finds the real solutions of the quadratic equation,
--and reports failure if they don’t exist.

-- 2 3 5 ---

quadratic a b c 
	= let d = (b**2 - 4 * a * c);
		in (quad a b c d)
			
quad :: Double -> Double -> Double -> Double-> Either String (Double, Double)
quad a b c d | d < 0 = Left "It does not have a real solution"			 
			| d >= 0 = Right (((-b + sqrt d) / (2*a)), ((-b - sqrt d) / (2*a)))

-----EXERCISE 15----- 
--Define a function
--showMaybe :: Show a => Maybe a -> String
--that takes a Maybe value and prints it.
--WTF

showMaybe :: Show a => Maybe a -> String
showMaybe Nothing = []
showMaybe (Just a) = show a

-----EXERCISE 16----- 
--A Bit is an integer that is either 0 or 1. A Word is a list of bits
--that represents a binary number. Here are some binary values that can
--be represented by Words:

--We can define functions that are the Bit equivalent of or and and as
--follows:

--bitwiseAnd [1,0,0] [1,0,1]
--bitwiseAnd [0,0,0] [1,1,0]


bitOr :: Int -> Int -> Int
bitOr 0 0 = 0
bitOr x y = 1

bitAnd :: Int -> Int -> Int
bitAnd 1 1 = 1
bitAnd x y = 0

--Write a function bitwiseAnd that takes two Words and creates a third
--Word that is the bitwise and of the two Words.

bitwiseAnd :: [Int] -> [Int] -> [Int]
bitwiseAnd word1 word2 = zipWith bitAnd word1 word2


-----EXERCISE 17-----  FALTA
--Each of the following expressions has a type error. Change the
--expression so that the type error no longer occurs.

--[1, False] ’2’ ++ ’a’
--[(3,True), (False,9)] 2 == False
--’a’ > "b" [[1],[2],[[3]]]

-----EXERCISE 18----- 
---What caused the type error in this definition and application?

--f :: Num a => (a,a) -> a
--f (x,y) = x + y
--f (True,4)

--The types of the two paired elements must be the same, according to the
--type signature given. In addition, the type of the first component of the pair
--was defined as being of the Num class, while the function f was applied to a
--pair with a Boolean as its first element.

-----EXERCISE 19----- FALTA

--Why does this definition produce an error when used?

--f :: Maybe a -> [a]
--f Nothing = []
--f (Just 3)

--There are two possible constructors in the type, and the function definition
--handles only one of them. If the other is used, an error occurs.

-----EXERCISE 20----- 
--Write a list comprehension that takes a list of Maybe values and
--returns a list of the Just constructor arguments. For example,
--[Just 3, Nothing, Just 4] => [3,4]

--[a | (Just a) <- xs]

-----EXERCISE 21---- 
--Using a list comprehension, write a function that takes a list of
--Int values and an Int value n and returns those elements in the list that
--are greater than n.

largerThanN :: [Int] -> Int -> [Int]
largerThanN lst n = [e | e <- lst, e > n]

-----EXERCISE 22---- 
--Write a function
--f :: [Int] -> Int -> [Int]
--that takes a list of Int values and an Int and returns a list of indexes at
--which that Int appears.

f22 :: [Int] -> Int -> [Int]
f22 lst v = [n | n <- [0..length lst - 1], lst!!n == v]

-----EXERCISE 23---- 
--Write a list comprehension that produces a list giving all of the
--positive integers that are not squares in the range 1 to 20.

--[e | e <- [1..20],[x | x <- [1..e], x * x == e] == []]

-----EXERCISE 24---- 
--Write a function that uses foldr to count the number of times
--a letter occurs in a string.

--We define an auxiliary function that compares the current letter with the
--one we are looking for, and increments the running count if it matches. The
--main iteration over the string is performed by the foldr.

count :: (Eq a, Num b) => a -> a -> b -> b
count letter x acc = if letter == x then acc + 1 else acc

countLetters :: Char -> String -> Int
countLetters c lst = foldr (count c) 0 lst

-----EXERCISE 25---- 
--Write a function using foldr that takes a list and removes each
--instance of a given letter.

remove :: Char -> Char -> [Char] -> [Char]
remove ch x acc = if x == ch then acc else x:acc

removeEachLetter :: Char -> [Char] -> [Char]
removeEachLetter ch lst = foldr (remove ch) [] lst

-----EXERCISE 26----
--Using foldl, write a function
--rev :: [a] -> [a]
--that reverses its list argument.

rearrange :: [a] -> a -> [a]
rearrange lst x = x:

rev :: [a] -> [a]
rev lst = foldl rearrange [] lst

-----EXERCISE 27----
--Using foldl, write a function
--maybeLast :: [a] -> Maybe a
--that takes a list and returns the last element in it if there is one, otherwise
--it returns Nothing.

takeLast :: Maybe a -> a -> Maybe a
takeLast Nothing x = Just x
takeLast (Just y) x = Just x

maybeLast :: [a] -> Maybe a
maybeLast lst = foldl takeLast Nothing lst


--Alternative
--Siempre se modifica el acc (acumulado...)
--foldl  \acc c 
--foldr  \c  acc

--ex27 :: [Maybe a] -> Maybe a
--ex27 lista = foldl (\acc c -> c) Nothing lista































