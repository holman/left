f24::[Char]->Char->Int
f24 cs aguja = foldr (\c acc-> if c == aguja then acc + 1 else acc) 0 cs