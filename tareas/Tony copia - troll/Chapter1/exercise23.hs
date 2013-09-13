isSquare n = elem n (takeWhile (<=n) [ x*x | x <- [1..]])
f23::Int->[Int]
f23 a = [x | x <- [1..a], not(isSquare x)] 