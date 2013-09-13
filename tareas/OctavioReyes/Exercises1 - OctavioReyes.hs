-----EX1----------------------------------
ex1a=True&&False
ex1b=True||False
ex1c=not False
ex1d=3<=5&&5<=10
ex1e=3<=20&&20<=10
ex1f=False==True
ex1g=1==1
ex1h=1/=2
ex1i=1/=1


----EX2-----------------------------
ex2a=[x|x<-[1,2,3], False]
ex2b=[not(x && y) | x <-[False, True] , y <-[False, True]]
ex2c=[x || y | x <- [False, True], y <-[False, True], x/=y]
ex2d=[[x,y,z] | x<-[1..50], y<-[1..50], z<-[1..50], x**2 + y**2 == z**2]


----EX3------------------------------
is_a :: Char->Bool
is_a caracter | caracter=='a' = True
              | otherwise=False

----EX4------------------------------
is_Hello :: String -> Bool
is_Hello ('h':'e':'l':'l':'o':xs)=True
is_Hello (x:xs)=False

----EX5------------------------------
remove_space :: String -> String
remove_space (' ':cola)=cola
remove_space(cola)=cola

----EX6-------------------------------
ex6::[Int]->[Bool]
ex6 lista=map (convertidor) lista

convertidor::Int->Bool
convertidor num | num==1 = True
                | num==0 = False

----EX7------------------------------
ex7::[Char]->Bool
ex7 cadena= or(map(=='O')cadena)

----EX8-------------------------------
-- foldr max 0 [1,5,3]
--   max 1 (max 5(max 3 0))
--   max 1 (max 5 3)
--   max 1 5
--   5


----EX9------------------------------
addCompara::(Num a) => Maybe a-> Maybe a ->Maybe a
addCompara Nothing Nothing = Nothing
addCompara (Just x) (Just y) = Just (x+y)
addCompara x Nothing = x
addCompara Nothing y = y

addJust :: [Maybe Int] -> [Maybe Int] -> [Maybe Int]
addJust = zipWith addCompara

----EX10-----------------------------------
data Metal= Oro
	  | Plata
	  | Bronce
	  | Hierro
	  | Acero
	  | Plomo deriving (Eq, Show)


comparametal :: Metal -> String
comparametal met
	  | met == Plata = "Es Plata"
	  | met == Oro = "Es Oro"
	  | met == Hierro = "Es Hierro"
	  | met == Acero = "Es Acero"
	  | met == Plomo = "Es Plomo"



----EX11--------------------------------------
data Coin=UnPeso
	 | DosPesos
	 | CincoPesos
	 | DiezPesos
	  deriving (Eq, Show)

comparamoneda :: Coin -> String
comparamoneda moneda 
   | moneda == UnPeso = "Es un peso"
   | moneda == DosPesos = "Son dos peso"
   | moneda == CincoPesos = "Son cinco pesos"
   | moneda == DiezPesos = "Son diez pesos"

---EX12---------------------------------------
data Universal = BOOL Bool
  | INT Integer
  | CHAR Char
  deriving(Eq, Show)


--EX13----------------------------------------
data Tuples a b c d=Tuple0
	  | Tuple1 a
	  | Tuple2 a b
	  | Tuple3 a b c
	  | Tuple4 a b c d
		  deriving (Eq, Show)



--igualdad :: [ Tuples ] -> [Tuples] -> Bool
--igualdad (t:ts) (h:hs) = t == h && igualdad ts hs
--igualdad [] hs = False
--igualdad [] [] = True   


-- EX14----------------------------------------
realSqrt :: Float->Float->Float-> (Float, Float)
realSqrt a b c =  if discriminante  < 0 then error "Imaginario" else (x1, x2)
               where x1 = part1 + sqrt discriminante / (2*a)
                     x2 = part1 - sqrt discriminante / (2*a)
                     discriminante = b ^ 2 - 4 * a * c
                     part1 = -b / (2*a)



--- Ex 15 --------------------------------------
showMaybe :: Show a => Maybe a -> String
showMaybe (Just a) =  show (Just a)
showMaybe Nothing = "Nothing"


--- Ex 16 --------------------------------------
bitWiseAnd :: [Int] -> [Int] -> [Int]
bitWiseAnd a b = zipWith bitAnd a b


bitOr :: Int -> Int -> Int
bitOr 0 0 = 0
bitOr x y = 1

bitAnd :: Int -> Int -> Int
bitAnd 1 1 = 1
bitAnd x y = 0

---- EX17---------------------------------------
-- [1, False]            -->   [1,2]  [True, False]   = > Los dos elementos tienen que ser del mismo tipo (los dos Bool o los dos Números)
-- ’2’ ++ ’a’            -->   "2" ++ "b"             = > No se concatenan dos de tipo char, la concatenación ++ deben ser dos Strings  
-- [(3,True), (False,9)] -->   [(3,True),(9,False)]   = > Las tuplas deben ir en el mismo orden [(numero, bool) (numero, bool) ] ó [(bool, numero),(bool,numero)]
-- 2 == False            -->    2 == 3  ó True==False = > No se puede comparar un entero con bool, los dos deben ser del mismo tipo  bool==bool  ó Numero==Numero
-- ’a’ > "b"             -->   'a' > 'b' o "a" > "b"  = > No se puede compara un Char con un String los dos deben ser del mismo tipo Char>Char ó String>String
-- [[1],[2],[[3]]]       -->     [[1],[2],[3]]        = > El último elemento de la lista no corresponde con el tipo necesario, todos deben ser del tipo [Numero], sobran unos corchetes en [3]



----EX 18 -----------------------------------------
-- What caused the type error in this definition and application?
--
-- f :: Num a => (a, a) -> a
-- f (x,y) = x + y

-- f(True, 4)

-- Solution:  Estamos enviando un boolean dentro de la tupla
-- y boolean no cambia a número automáticamente


-------- EX 19 --------------------------------------
-- Why does this definition produce an error when used?
-- f :: Maybe a -> [a]
-- f Nothing = []
-- f (Just 3)

-- Solution: Causa error porque no se especifica cuál es el resultado cuando se envía
-- por ejemplo un valor o parametro de tipo "Just a".


-------- EX20 --------------------------------------------
filterMaybes :: [Maybe a]-> [a]
filterMaybes as = [a | (Just a) <- as]

-- *Main> filterMaybes [Just 3, Nothing, Just 4]
-- [3,4]
 


--------- EX21-----------------------------------------------
--------- Busca en una lista los enteros que son más grandes que "n" 

buscaEnteroMayor :: [Int] -> Int -> [Int]
buscaEnteroMayor lista n = [x| x <- lista , x > n]


---- *>Main buscaEnteroMayor[4,3,56,11] 10
---- [56, 11]






--------- EX22-----------------------------------------------
--------- Busca el índice de un entero en una lista de enteros

f22 :: [Int] -> Int -> [(Int,Int)]
f22 haystack needle = [(i,v) | (i,v) <- zip [0..] haystack, v == needle]

-- *Main > f22 [1,2,3,1] 1
-- [(0,1), (3,1)]


----------EX23-------------------------------------------------
notSquares =[e | e <- [1..20],[x | x <- [1..e], x * x == e] == []]





---------EX 24---------------------------------------------------
buscaLetra :: [Char] -> Char -> Int
buscaLetra cs aguja = foldr (\c acc-> if c == aguja then acc + 1 else acc) 0 cs

-- *Main> buscaLetra "hello" 'l'
-- 2


---------EX 25 ---------------------------------------------------

removeLetra :: Char -> [Char] -> [Char]
removeLetra aguja cs = foldl (\acc c -> if c /=aguja then acc ++ [c] else  acc) [] cs

-- *Main> removeLetra 'a'"Palabra"
-- "Plbr"



--------EX 26 -----------------------------------------------------

rev :: [a] -> [a]
rev cs = foldl (\acc c -> c:acc ) [] cs


--------EX 27 -----------------------------------------------------

obtenUltimo :: [Maybe a]->Maybe a
--obtenUltimo []= Nothing
obtenUltimo xs= foldl(\acc x -> x) Nothing xs

-- *Main> obtenUltimo [Just 1, Just 2, Just 4, Just 5]
-- Just 5