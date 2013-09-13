discriminant :: (Floating a) => a -> a -> a -> a 
discriminant a b c = b ^ 2 - 4 * a * c
 
realSqrt :: (Ord a, Floating a) => a -> a -> a -> Maybe (a,a)
realSqrt a b c = case (compare disc) 0 of
  LT -> Nothing
  EQ -> Just (prefix, prefix)
  GT -> Just (prefix + sqdisc, prefix - sqdisc)
  where disc = discriminant a b c
        sqdisc = sqrt disc / (2 * a)
        prefix = - b / (2 * a)