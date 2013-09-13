quadratic a b c = let d = (b**2 -4 * a * c) in (formulaGeneral a b c d)
formulaGeneral :: Double -> Double -> Double -> Double -> Either String (Double, Double)
formulaGeneral a b c d | d < 0 = Left("fuck u")
					   | d >= 0 = Right (((-b + sqrt d) / (2*a)),((-b - sqrt d) / ( 2 * a)))
