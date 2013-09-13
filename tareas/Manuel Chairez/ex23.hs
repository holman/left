{-Genera una lista con los valores de 1 a 20, produce una lista con aquellos valores que no son cuadrados-}

es_cuadrado n = sqN * sqN == n
    where sqN = floor $ sqrt $ (fromIntegral n::Double)

devuelveCuadrados::[Int]
devuelveCuadrados = [a|a<-[1..20], not (es_cuadrado a)]
