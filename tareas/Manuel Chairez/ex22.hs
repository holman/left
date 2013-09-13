{-Buscar los indices en los cuales se encuentra el elemento pasado como parametro dentro de la lista-}
f22::[Int]->Int->[Int]
f22 haystack needle = [i | (i,v) <- zip [0..] haystack, v==needle]