---
layout: post
title: Solutions to Chapter 3
category: haskell
---

Exercise 1.
===========
Write a recursive function copy :: [a] -> [a] that copies its list argument.
For example, copy [2] ⇒[2].

{% highlight haskell %}

> import Test.HUnit
> t1 =  ["f21 [2,3] lista con algo" ~: [2,3] ~=? (f21 [2,3])
>        ,"f21 [1] lista con un elementa" ~: [1] ~=? (f21 [1])]
> f21 :: [a]->[a]
> f21 [] = []
> f21 (x:xs) = x:f21(xs)

{% endhighlight %}

Exercise 2.
==========

Write a function inverse that takes a list of pairs and swaps the pair elements.
For example

inverse [(1,2),(3,4)] ==> [(2,1),(4,3)]

{% highlight haskell %}

> t2 = ["inverse [(1,2),(3,4)]" ~: [(2,1),(4,3)] ~=? (inverse [(1,2),(3,4)])]
> inverse :: [(a,b)]-> [(b,a)]
> inverse [] = [(y,x)|(x,y)<-[]]

{% endhighlight %}

Exercise 3.
===========
Write a function
merge :: Ord a => [a] -> [a] -> [a]
which takes two sorted lists and returns a sorted list containing the elements of each.

{% highlight haskell %}

> t3 =  ["merge [2,4.6] [1,3,5]" ~: [1,2,3,4,5,6] ~=? (merge [2,4,6] [1,3,5])]
> merge :: Ord a => [a] -> [a] -> [a]
> merge [] [] = []
> merge as [] = as
> merge [] bs = bs
> merge (a:as) (b:bs) = if a < b then a:merge as (b:bs) else b:merge (a:as) bs

{% endhighlight %}

Exercise 4.
==========
Write (!!), a function that takes a natural number n and a list
and selects the nth element of the list. List elements are indexed from
0, not 1, and since the type of the incoming number does not prevent it
from being out of range, the result should be a Maybe type. For example,
[1,2,3]!!0 ==> Just 1
[1,2,3]!!2 ==> Just 3
[1,2,3]!!5 ==> Nothing

{% highlight haskell %}

> t4 = ["Excercise 4" ~: "[1,2,3]!!0" ~: Just 1 ~=? ((!!!) 0 [1,2,3])
>       ,  "[1,2,3]!!2" ~: Just 3 ~=? ((!!!) 2 [1,2,3])
>       ,  "[1,2,3]!!5" ~: Nothing ~=? ((!!!) 5 [1,2,3])
>       ]
> (!!!):: Int -> [a] -> Maybe a
> (!!!) 0 [] = Nothing

{% endhighlight %}


Exercise 5.
===========
Write a function lookup that takes a value and a list of pairs, and returns the second element of the pair that has the value as its first element. Use a Maybe type to indicate whether the lookup succeeded.
For example,
lookup 5 [(1,2),(5,3)] ==> Just 3
lookup 6 [(1,2),(5,3)] ==> Nothing

{% highlight haskell %}

> t5 = ["clookup 5 [(1,2),(5,3)]" ~: Just 3 ~=? (clookup 5 [(1,2),(5,3)])
>      , "clookup 6 [(1,2),(5,3)]" ~: Nothing ~=? (clookup 6 [(1,2),(5,3)])]
> clookup :: Int -> [(Int,Int)]-> Maybe Int
> clookup e [] = Nothing
> clookup e ((a,b):as) = if a == e then Just b else clookup e as

{% endhighlight %}


Exercise 6.
===========
Write a function that counts the number of times an element appears in a list.

{% highlight haskell %}

> t6 = ["f6 2 [1,2,3,2,2,2]" ~: 4 ~=? (f6 2 [1,2,3,2,2])]
> f6 :: a->[a]->Int
> f6 t [] =  0

{% endhighlight %}


Exercise 7.
===========
Write a function that takes a value e and a list of values xs and
removes all occurrences of e from xs.

{% highlight haskell %}

> t7 = ["f7 2 [1,2,3,2,2,2]" ~: [1,3] ~=? (f7 2 [1,3])]
> f7 :: Eq a => a->[a]->[a]
> f7 e [] = []
> f7 e (x:xs) = if x == e then f7 e xs else x:(f7 e xs)

{% endhighlight %}


Exercise 8.
===========
Write a function
f :: [a] -> [a]
that removes alternating elements of its list argument, starting with the
first one. For examples, f [1,2,3,4,5,6,7] returns [2,4,6].

{% highlight haskell %}

> t8 = ["f8 [1,2,3,4,5,6,7]" ~: [2,4,6] ~=? (f8 [1,2,3,4,5,6,7])]
> f8 :: [a]->[a]
> f8 xs = []

{% endhighlight %}


Exercise 9.
===========
Write a function extract :: [Maybe a] -> [a] that takes a
list of Maybe values and returns the elements they contain. For example,
extract [Just 3, Nothing, Just 7] = [3, 7].

{% highlight haskell %}

> t9 = ["extract [Just 3, Nothing, Just 7]" ~: [3,7] ~=? (extract [Just 3, Nothing, Just 7])]
> extract :: [Maybe a] -> [a]
> extract [] = []
> extract (Nothing:xs) = extract xs
> extract (Just x:xs) = x:extract xs

{% endhighlight %}


Exercise 10.
============
Write a function
f :: String -> String -> Maybe Int
that takes two strings. If the second string appears within the first, it
returns the index identifying where it starts. Indexes start from 0. For
example,
f "abcde" "bc" ==> Just 1
f "abcde" "fg" ==> Nothing

{% highlight haskell %}

> t10 = ["f10 \"abcde\" \"bc\"" ~: Just 1 ~=? (f10 "abcde" "bc")
>      , "f10 \"abcde\" \"fg\"" ~: Nothing ~=? (f10 "abcde" "fg")]
> f10 :: String -> String -> Maybe Int
> f10 "" "" = Just 0

{% endhighlight %}


Exercise 11.
============
Write foldrWith, a function that behaves like foldr except
that it takes a function of three arguments and two lists.

{% highlight haskell %}

> t11 = ["(foldrWith (\\p q acc -> p+q + acc ) 0 [1, 1] [2, 2])" ~: 6 ~=? (foldrWith (\p q acc -> p+q + acc ) 0 [1, 1] [2, 2])]
> foldrWith :: (a -> b -> c -> c) -> c -> [a] -> [b] -> c
> foldrWith f z [] bs = z
> foldrWith f z as [] = z
> foldrWith f z (a:as) (b:bs)= f a b (foldrWith f z as bs)

{% endhighlight %}


Exercise 12.
===========
Using foldr, write a function mappend such that mappend f xs = concat (map f xs)

{% highlight haskell %}

> t12 = ["(mappend (++!) \"bla\")" ~: "b!l!a!" ~=? (mappend (++"!") ["b","l","a"])]
> mappend :: (a->[b])->[a]->[b]
> mappend f xs = []

{% endhighlight %}


Exercise 13.
============
Write removeDuplicates, a function that takes a list and re-
moves all of its duplicate elements.

{% highlight haskell %}

> t13 = ["removeDuplicates [1,9,9,2,7,7,7,3]"~: [1,9,2,7,3] ~=? (removeDuplicates [1,9,9,2,7,7,7,3])]
> removeDuplicates :: Eq a => [a] -> [a]
> removeDuplicates [] = []
> removeDuplicates (x:xs) = if (elem x xs) then removeDuplicates xs else x:removeDuplicates xs

{% endhighlight %}


Exercise 14.
============
Write a recursive function that takes a value and a list of values and returns True if the value is in the list and False otherwise.


{% highlight haskell %}

> t14 = ["f14 'b' \"abc\" "~: True ~=? (f14 'b' "abc")]
> f14 :: Eq a => a -> [a] -> Bool
> f14 e [] = False

{% endhighlight %}


Exercise 15.
============
Write a function that takes two lists, and returns a list of values that appear in both lists.
The function should have type
intersection :: Eq a => [a] -> [a] -> [a].
(This is one way to implement the intersection operation on sets; see Chapter 8.)

{% highlight haskell %}

> t15 = ["(intersection \"abcde\" \"defgh\")"~: ['d','e'] ~=? (intersection "abcde" "defgh")]
> intersection :: Eq a => [a] -> [a] -> [a]
> intersection [] bs = []
> intersection as [] = []
> intersection (a:as) bs = if (elem a bs) then a:intersection as bs else intersection as bs

{% endhighlight %}


Exercise 16.
============
Write a function that takes two lists, and returns True if all the
elements of the first list also occur in the other. The function should have type
isSubset :: Eq a => [a] -> [a] -> Bool.
(This is one way to determine whether one set is a subset of another; see Chapter 8.)

{% highlight haskell %}

> t16 = ["(isSubset [2,4] [1,2,3,4,5])" ~: True ~=? (isSubset [2,4] [1,2,3,4,5])]
> isSubset :: Eq a => [a] -> [a] -> Bool
> isSubset [] [] = True

{% endhighlight %}


Exercise 17.
============
Write a recursive function that determines whether a list is sorted.

{% highlight haskell %}

> t17 = ["isSorted [1,3,2,4]" ~: False ~=? (isSorted [1,3,2,4])
>       , "isSorted [1,2,3,4]" ~: True ~=? (isSorted [1,2,3,4]) ]
> isSorted :: Ord a => [a] -> Bool
> isSorted [] = True
> isSorted (a:b:as) = if a < b then True && isSorted (b:as) else False
> isSorted a = True

{% endhighlight %}


Exercise 18.
============
Show that the definition of factorial using foldr always produces
the same result as the recursive definition given in the previous section

 t18 = ["" ~: ~=? (factorial)]

Exercise 19.
============
Using recursion, define last, a function that takes a list and
returns a Maybe type that is Nothing if the list is empty.

{% highlight haskell %}

> isNothing :: Maybe a -> Bool
> isNothing Nothing = True
> isNothing (Just a) = False
> t19 = ["flast [1,2,3] regresa " ~: Just 3 ~=? (flast [1.0,2,3]) ]
> flast :: Eq a => [a]-> Maybe a
> flast [] = Nothing
> flast (x:xs) = if xs == [] then Just x else flast xs

{% endhighlight %}


Exercise 20.
============
Using recursion, write two functions that expect a string containing
a number that contains a decimal point (for example, 23.455).
The first function returns the whole part of the number (i.e., the part to
the left of the decimal point). The second function returns the fractional
part (the part to the right of the decimal point).

{% highlight haskell %}

> t20 = ["wholePart \"23.455\""~: "23" ~=? (wholePart "23.455")
>       ,"fractionPart \"23.455\""~: "455" ~=? (fractionPart "23.455")]
> wholePart :: String -> String
> wholePart ns = ""
> fractionPart :: String -> String
> fractionPart ns = ""

{% endhighlight %}

Run all the tests
-----------------

> tests = test (t1++t3++t5++t7++t9++t11 ++t13 ++ t15 ++ t17 ++ t19)

++ t2 ++ t3 ++ t4 ++ t5 ++ t6 ++ t7 ++ t8 ++
                t9++t10++t11++t12++t13++t14 ++ t15 ++ t16 ++ t17 ++ t20)
