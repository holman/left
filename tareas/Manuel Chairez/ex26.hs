{-Invertir el orden de una lista-}
rev::[a]->[a]
rev as = foldl (\acc c -> c:acc) [] as