data Bit = 0 | 1

bitWiseAnd::[Bit]->[Bit]->[Bit]
bitWiseAnd a b = zipWith (bitAnd) a b

bitAnd::Bit->Bit->Bit
bitAnd 1 1 = 1
bitAnd x y = 0