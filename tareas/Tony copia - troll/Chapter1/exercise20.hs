filtro::[Maybe a]->[a]
filtro as = [a | (Just a) <- as]