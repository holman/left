ex7 :: [Char] -> Bool
ex7 cadena = or [ if c == 'O' then True else False | c <- cadena]