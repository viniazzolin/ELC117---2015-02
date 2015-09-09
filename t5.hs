-- Nome: Vinícius Stivanin Azzolin			ELC117 - Paradigmas de Programação
-- Profª Andrea Schwertner Charão           Trabalho 05

-- Exercício 01:

addSuffix :: String -> [String] -> [String]
addSuffix suf str = [x ++ suf| x <- str]  

-- Exercício 02:

addSuffix' :: String -> [String] -> [String] 
addSuffix' _ [] = []
addSuffix' suf (x:xs) = (x ++ suf) : addSuffix' suf xs    

-- Exercício 03:

countShorts :: [String] -> Int
countShorts [] = 0
countShorts (x:xs) = if length(x) < 5
  then 1 + countShorts(xs)
  else countShorts(xs)
  
-- Exercício 04:

countShorts' :: [String] -> Int
countShorts' str = length[x | x <- str, length x < 5]

-- Exercício 05:

ciclo :: Int -> [Int] -> [Int] 
ciclo 0 _ = []
ciclo n lis = lis ++ ciclo (n-1) lis

-- Exercício 06:

combine :: [Int] -> [String] -> [(Int, String)]
combine [] _ = []
combine _ [] = [] 
combine (x:xs) (a:b) = (x, a) : combine xs b

-- Exercício 07:

numera :: [String] -> [(Int, String)]
numera str = aux 0 str  

aux :: Int -> [String] -> [(Int, String)]
aux _ [] = []
aux e (x:xs) = if  length(x) /= 0 
then (e+1, x) : aux (e+1) xs
else []

-- Exercício 08:

-- a) [(x,y) | x <- [1..5], even x, y <- [(x+1)..6], odd y]
-- 		[(2,3),(2,5),(4,5)]

-- A função seleciona os números pares entre 1 e 5 e os agrupa em uma tuplas com números ímpares entre 3 e 6.

-- b) [ a ++ b | a <- ["lazy", "big"], b <- ["frog", "dog"]]
-- 		["lazyfrog","lazydog","bigfrog","bigdog"]

--   O código concatena todos os elementos entre si, começando pelo primeiro elemento de 'a' com os elementos de 'b', e conseguinte, o segundo elemento de 'a' com os demais de 'b'.


-- c) concat [[a,'-'] | a <- "paralelepipedo", a `elem` "aeiou"]
--		"a-a-e-e-i-e-o-"

-- O código concatena os elementos recebidos de uma String, comparando e filtrando as vogais através da função `elem`, com o símbolo '-'.

-- Exercício 09:

crossProduct :: [a] -> [b] -> [(a,b)]
crossProduct xs ys = [(x,y) | x <- xs, y <- ys ]

pairWithAll :: a -> [b] -> [(a,b)]
pairWithAll _ [] = []
pairWithAll a (x:xs) = (a, x): pairWithAll a xs

-- Exercício 10:

genRects :: Int -> (Int, Int) -> [(Float, Float, Float, Float)]
genRects n (x,y)  = if n > 0 
 then (fromIntegral x, fromIntegral y, 5.5, 5.5) : genRects (n-1) (fromIntegral(x+6),y)
 else otherwise = []
 
-- Exercício 11:

func :: [(a,b)] -> ([a,b])
func [] = ([],[])
func x = (a x, b x)
		where	a [] = []
			a x = (fst (head x)) : a (tail x)
			b [] = []
		    	b x = (snd (head x)) : b (tail x)
		    	
-- Exercício 12:

func2 :: [(a,b)] -> ([a,b])
func2 [] = ([],[])
func2 tup = ([fst x | x<-tup],[snd x | x<-tup])

-- Exercício 13:

func3 :: [(a,b)] -> ([a],[b])
func3 [] = ([],[])
func3 tup = (map (fst) tup, map (snd) tup)

