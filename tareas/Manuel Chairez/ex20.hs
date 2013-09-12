{-filtro :: Maybe a -> a
filtro (Just x) = x
filtro Nothing = Nothing

addJust :: [Maybe a] -> [a]
addJust a = map (filtro) a
-}

filterMaybes :: [Maybe a] -> [a]
filterMaybes as = [a | (Just a) <- as]
