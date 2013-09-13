combinar :: (Num a) => Maybe a -> Maybe a -> Maybe a
combinar x Nothing = x
combinar Nothing y = y
combinar (Just x) (Just y) = Just (x + y)
combinar Nothing Nothing = Nothing

addJust :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
addJust = zipWith combinar