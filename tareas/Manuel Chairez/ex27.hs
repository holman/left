{-Recibe una lista y devuelve el último elemento si es que existe-}

showMaybe::Maybe a->a->Maybe a
showMaybe _ a = Just a

ex27::[a]->Maybe a
ex27 lista = foldl showMaybe Nothing lista

ex27'::[a]->Maybe a
ex27' = foldl showMaybe Nothing