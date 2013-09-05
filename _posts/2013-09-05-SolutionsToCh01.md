---
layout: post
title: Solutions to Chapter 1
category: haskell
---

Exercise 13. Define a type that contains tuples of up to four elements.

Solution:
A separate constructor is needed to indicate the number of elements that
are present, so we introduce five constructors Tuple0, etc. It would not be
correct to use a list type, for two reasons: the individual elements should be
allowed to have different types, and the number of elements must be limited to
four.C.1. INTRODUCTION TO HASKELL
383


-- > data Tuples a b c d = Tuple0 | Tuple1 a | Tuple2 a b
-- >                       | Tuple3 a b c | Tuple4 a b c d
-- >                       deriving (Eq, Show)

-- > igualdad :: [ Tuples ] -> [Tuples] -> Bool
-- > igualdad (t:ts) (h:hs) = t == h && igualdad ts hs
-- > igualdad [] hs = False
-- > igualdad [] [] = True




Exercise 14. The quadratic equation a · x2 + b · x + c = 0 has two roots, given
by the formula
√
−b ± b2 − 4 · a · c
x=
,
2·a
as long as the discriminant (the expression under the square root sign)
is non-negative. If the discriminant is negative the roots are complex.
Define a function that finds the real solutions of the quadratic equation,
and reports failure if they don’t exist.

``` haskell

> quadratic a b c = let d = (b**2 - 4 * a * c)
>                   in (quad a b c d)

> quad :: Double -> Double -> Double -> Double -> Either String (Double, Double)
> quad a b c d | d < 0 = Left "It does not have a real solution"
>             | d >= 0 = Right (((-b + sqrt d) / (2 * a)), ((-b - sqrt d) / (2 * a)))

```

De acuerdo a Octavio

> quadratic_o :: Float -> Float -> Float -> (Float, Float)
> quadratic_o a b c = if discriminante < 0 then error "Imaginario"
>                   else (x1, x2)
>                   where
>                    x1 = part1 + sqrt (discriminante) / (2 * a)
>                    x2 = part1 - sqrt (discriminante) / (2 * a)
>                    discriminante = b **2 - 4 * a * c
>                    part1 = -b / (2 * a)

> quadratic_mix :: Float -> Float -> Float -> (Float, Float)
> quadratic_mix a b c = let
>                        discriminante = b **2 - 4 * a * c
>                        in
>                         if discriminante < 0
>                          then error "Imaginario"
>                          else (((-b + sqrt discriminante) / (2 * a)),
>                                ((-b - sqrt discriminante) / (2 * a)))

Exercise 15. Define a function
showMaybe :: Show a => Maybe a -> String
that takes a Maybe value and prints it.

> showMaybe :: Show a => Maybe a -> String
> showMaybe Nothing = []
> showMaybe (Just a) = show a

Exercise 16. A Bit is an integer that is either 0 or 1. A Word is a list of bits
that represents a binary number. Here are some binary values that can
be represented by Words:
[1,0] => 2
[1,0,0,1] => 9
[1,1,1] => 7CHAPTER 1. INTRODUCTION TO HASKELL
34
We can define functions that are the Bit equivalent of or and and as
follows:

> bitOr :: Int -> Int -> Int
> bitOr 0 0 = 0
> bitOr x y = 1
>
> bitAnd :: Int -> Int -> Int
> bitAnd 1 1 = 1
> bitAnd x y = 0

Now it is possible to take the ’bitwise’ and of two words as follows:
bitwiseAnd [1,0,0] [1,0,1]
=> [bitAnd 1 1, bitAnd 0 0, bitAnd 0 1]
=> [1,0,0]
bitwiseAnd [0,0,0] [1,1,0]
=> [0,0,0]
Write a function bitwiseAnd that takes two Words and creates a third
Word that is the bitwise and of the two Words.

> bitwiseAnd :: [Int]->[Int]->[Int]
> bitwiseAnd a b = zipWith (bitAnd) a b

Exercise 18. What caused the type error in this definition and application?

> f :: Num a => (a,a) -> a
> f (x,y) = x + y

f (True,4)

Solution: Estamos enviando un boolean dentro de la tupla y boolean no cambia a número automáticamente.

Exercise 20. Write a list comprehension that takes a list of Maybe values and
returns a list of the Just constructor arguments. For example,
[Just 3, Nothing, Just 4] -> [3,4]

> filterMaybes :: [Maybe a]-> [a]
> filterMaybes as = [a | (Just a) <- as]

*Main> filterMaybes [Just 3, Nothing, Just 4]
[3,4]


Exercise 22. Write a function
f :: [Int] -> Int -> [Int]
that takes a list of Int values and an Int and returns a list of indexes at
which that Int appears.

> f22 :: [Int] -> Int -> [(Int,Int)]
> f22 haystack needle = [(i,v) | (i,v) <- zip [0..] haystack, v == needle]

f22 [1,2,3,1] 1

Exercise 24. Write a function that uses foldr to count the number of times
a letter occurs in a string.

> f24 :: [Char] -> Char -> Int
> f24 cs aguja = foldr (\c acc-> if c == aguja then acc + 1 else acc) 0 cs


*Main> f24 "hello" 'l'
2
*Main> f24 "holi" 'l'
1

Exercise 26. Using foldl, write a function
that reverses its list argument.

> rev :: [a] -> [a]
> rev cs = foldl (\acc c -> c:acc ) [] cs
