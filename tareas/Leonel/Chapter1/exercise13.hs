data Tuples a b c d = Tuple0 | Tuple1 a | Tuple2 a b | Tuple3 a b c | Tuple4 a b c d deriving(Eq, Show)
igualdad :: [Tuples] -> [Tuples] -> Bool
igualdad [t:ts] [h:hs] = t == h && igualdad ts hs
igualdad []hs = False
igualdad [][] = True

