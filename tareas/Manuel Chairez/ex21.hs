{-Recibe una lista y un valor entero, devuelve aquellos elementos en la lista que son mayores al valor entero-}

mayorQueElValor::[Int]->Int->[Int]
mayorQueElValor lista v = [a|a<-lista, a > v]
