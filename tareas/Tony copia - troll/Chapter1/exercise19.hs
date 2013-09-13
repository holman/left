-- No regresa nada
f :: Maybe a -> [a]
f Nothing = []
f (Just 3)