lettersOccur::[Char]->Char->Int
lettersOccur cs aguja = foldr(\c acc-> if c == aguja then acc + 1 else acc) 0 cs