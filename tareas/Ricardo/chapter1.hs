isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty x = False

{--
Exercise 3. Write a function that takes a character and returns
True if the characters is 'a' and False otherwise.
--}
isA :: Char -> Bool
isA 'a' = True
isA x = False

{--
Exercise 4.
Write a function that takes a string and returns True if the string
is "hello" and False otherwise. This can be done by specifyng each
element of the string in the list pattern (eg. 'h':'i':[]).
--}
isHello :: String -> Bool
isHello ['h','e','l','l','o'] = True
isHello x = False

{--
Exercise 5.
Write a function that takes a string and removes a leading space if
exists.
--}
rmvLS :: String -> String
rmvLS (' ' : xs) = xs
rmvLS x = x

{--
Exercise 6.
Suppose a program has read in a list of numbers of type Int.
Each number is intended to represent a Boolean value, where 0 means
False, 1 means True, and any other number constitutes invalid input.
Write a function convert :: [Int] -> [Bool] that converts a list of
numbers to the corresponding Booleans.
--}
convert :: [Int] -> [Bool]
convert (xs) = map isIntTrue xs

isIntTrue :: Int -> Bool
isIntTrue x = if x == 0 then False else True

{--
Exercise 7.
Write a function member0 :: String -> Bool that takes a list of Char
values (i.e., a String), and returns True if at least one of the
characters is '0' and False otherwise. Hint: use map and the function
or, which takes a list of Boolean values and returns True if at least
one of them is True; otherwise it returns False. Thus or [False, True,
False] => True, but or [False, False, False] => True.
--}
member0 :: String -> Bool
member0 (xs) = or (map isChar0 xs)

isChar0 :: Char -> Bool
isChar0 x = if x=='0' then True else False

{--
Exercise 8. Expand the following application:
foldr max 0 [1,5,3]

=> max 1 (max 5 (max 3 0))
=> max 1 (max 5 3)
=> max 1 5
=> max 5
--}

{--
Exercise 9.
Write a function that takes two lists of type [Maybe Int] and examines
the pair of list heads before looking at the rest of the lists. It returns
a list in which the Ints of each pair have been added if both are of the
form Just n, preserving any Just n value otherwise. For example,
    addJust [Just 2, Nothing, Just 3]
            [Nothing, Nothing, Just 5]
    => [Just 2, Nothing, Just 8]
--}

addJust :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
addJust xs ys = zipWith addIf xs ys

addIf :: Maybe Int -> Maybe Int -> Maybe Int
addIf (Just x) (Just y) = Just (x + y)
addIf (Just x) Nothing = Just x
addIf Nothing (Just y) = Just y
addIf Nothing Nothing = Nothing

{--
Exercise 10.
Define a data type that represents six different metals and automatically
creates versions of (==) and show
--}
data Metals = Gold | Copper | Adamantium | Steel | Aluminium | Zinc
               deriving (Eq, Show)


{--
Exercise 11.
Suppose that you have some coins that have been sorted into piles, each of
which contains only one kind of coin. Define a data type that can be used
to represent the piles of coins.
--}
data CoinsPile = TenCents Int | FiftyCents Int | OnePeso Int | TwoPesos Int
               | FivePesos Int | TenPesos deriving Show


{--
Exercise 12.
A universal type is one in which any type can be represented. Each different
type is identified by its own constructor, which serves as a distinguishing
tag. For example, here is a unviversal type that represtents three different
types of number:

data Number = INT Int | INTEGER Integer | FLOAT Float
              deriving (Eq, Show)

Define a universal type that contains Booleans, characters, and integers (Ints).
--}
data UniversalBCI = BOOL Bool | CHAR Char | INT Int
                  deriving (Eq, Show)

{--
Exercise 13.
Define a type that contains tuples of up to four elements.
--}
data UpToFourTuple a b c d = ZeroTuple | OneTuple a | TwoTuple b | ThreeTuple c
                           | FourTuple d

{--
Exercise 14.
The quadratic equation a * x^2 + b * x + c = 0 has two roots, given by the
formula
            _________________
     -b +- V b^2 - 4 * a * c
x = __________________________
              2 * a

as long as the discriminant (the expression under the square root sign)
is non-negative. If the discriminant is negative the roots are complex.
Define a function that finds real solutions of the quadratic equation, and
reports failure if they don't exist.
--}
quadraticFunction :: Double -> Double -> Double -> (Double, Double)
quadraticFunction a b c = let d = getDiscriminant a b c
                          in
                           if isDiscriminantReal d
                            then
                              ((-b + d) / (2 * a),
                               (-b - d) / (2 * a))
                            else
                              error "The solution is not real"
                            

getDiscriminant :: Double -> Double -> Double -> Double
getDiscriminant a b c = b ^ 2 - 4 * a * c

isDiscriminantReal :: Double -> Bool
isDiscriminantReal x = if x >= 0 then True else False

{--
Exercise 15.
Define a function
     showMaybe :: Show a => Maybe a -> String
that takes a Maybe value and prints it.
--}
showMaybe :: Show a => Maybe a -> String

showMaybe a = show a


{--
Exercise 16.
A bit is an integer that is either 0 or 1. A word is a list of bits that
represents a binary number. Here are some binary values that can be
represented by Words:
     [1,0] => 2
     [1,0,0,1] => 9
     [1,1,1] => 7

We can define functions that are the Bit equivalent of or and and as
follows:
     bitOr :: Int -> Int -> Int
     bitOr 0 0 = 0
     bitOr x y = 1

     bitAnd :: Int -> Int -> Int
     bitAnd 1 1 = 1
     bitAnd x y = 0

Now it is possible to take the 'bitwise' and of two words as follows:
    bitwiseAnd [1,0,0] [1,0,1]
    => [bitAnd 1 1, bitAnd 0 0, bitAnd 0 1]
    => [1,0,0]

    bitWiseAnd [0,0,0] [1,1,0]
    => [0,0,0]

Write a function bitwiseAnd that takes two Words and creates a third
Word that is the bitwise and of the two Words.
--}
bitwiseAnd :: [Int] -> [Int] -> [Int]
bitwiseAnd xs ys = zipWith bitAnd xs ys

bitAnd :: Int -> Int -> Int
bitAnd x y = 0
bitAnd 1 1 = 1

{--
Exercise 17. Each of the following expressions has a type error. Change
the expression so that the type error no longer occurs.
    [1, False]                '2' ++ 'a'
    [(3, True), (False, 9)]   2 == False
    'a' > "b"                 [[1], [2], [3]]
--}
{--
    [1, False]
        [1, 3]
        [True, False]

    '2' ++ 'a'
        "2" ++ "a"

    [(3, True), (False, 9)]
        [(3, 4), (9, 9)]
        [(False, True), (False, False)]

    2 == False
        2 == 3
        False == False

    'a' > "b"
        'a' > 'b'
        "a" > "b"

    [[1], [2], [[3]]]
        [[1], [2], [3]]
        [[[1]], [[2]], [[3]]]
--}


{--
Exercise 18.
What caused the type error in this definition and application?
    f :: Num a => (a, a) -> a
    f (x, y) = x + y

    f (True, 4)
--}
{--
    En el uso de la función se le está pasando un par de tipo
    (Bool, Int) y, aunque la definición del tipo de los parámetros
    es un par genérico, se establece una restricción que indica
    que los tipos del par deben pertenecer a la clase Num. Los
    tipos booleanos no pertenecen a esa clase.
--}


{--
Exercise 19.
Why does this definition produce an error when used?
    f :: Maybe a -> [a]
    f Nothing = []

    f (Just 3)
--}
{--
    La definición de la función no contempla el patrón para Just a 
--}


{--
Exercise 20.
Write a list comprehension that takes a list of Maybe values and
returns a list of the Just constructor arguments. For example,
    [Just 3, Nothing, Just 4] => [3, 4]
--}
dropMaybes :: [Maybe a] -> [a]
dropMaybes xs = [ x | (Just x) <- xs]

{--
Exercise 21.
Using a list comprehension, write a function that takes a list of
Int values and an Int value n and returns those elements in the list
that are greater than n.
--}
greaterThan :: [Int] -> Int -> [Int]
greaterThan xs n = [x | x <- xs, x > n]

{--
Exercise 22.
Write a function
    f :: [Int] -> Int -> [Int]
that takes a list of Int values and an Int and returns a list of
indexes at which that Int appears.
--}
f :: [Int] -> Int -> [Int]
f xs y = [index | index <- [0..(length xs - 1)], isNumberAtIndex xs y index]

isNumberAtIndex :: [Int] -> Int -> Int -> Bool
isNumberAtIndex xs n index = if xs !! index == n
                                 then True
                                 else False


{--
Exercise 23.
Write a list comprehension that produces a list giving all of the
positive integers that are not squares in the range 1 to 20.
--}
notSquares :: [Int]
notSquares = [x | x <- [0..20], y <- [0..x], not (x == (y * y))]


{--
Exercise 24.
Write a function that uses foldr to count the number of times a
letter occurs in a string.
--}
{--timesCharInString :: String -> Char -> Int
timesCharInString xs c = foldl isEqual 0 xs

isEqual :: Char -> Char -> Int
isEqual x y = if x == y
                 then 1
                      else 0

--}


{--
Exercise 25.
Write a function using foldr that takes a list and removes each
instance of a given letter.
--}



{--
Exercise 26.
Using foldl, write a function
    rev :: [a] -> [a]
that reverses its list argument.
--}


  
{--
Exercise 27.
Using foldl, write a function
    maybeLast :: [a] -> Maybe a
that takes a list and returns the las element in it if there is one,
otherwise it returns Nothing.
--}
