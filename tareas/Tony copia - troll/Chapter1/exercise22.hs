findIndixes::[Int]->Int->[Int]
findIndixes haystack needle = [i | (i,v) <- zip[0..] haystack, v == needle]