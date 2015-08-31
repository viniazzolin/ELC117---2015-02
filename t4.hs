-- Nome: Vinícius Stivanin Azzolin			ELC117 - Paradigmas de Programação
-- Profª Andrea Schwertner Charão           Trabalho 04

-- Exercício 01

eleva2 :: [Int] -> [Int]
eleva2 [] = []
eleva2 (x:xs) = x^2 : eleva2(xs)

-- Exercício 02

contido :: Char -> [Char] -> Bool
contido c [] = False
contido c (x:xs) = if c == x then True else contido c xs

-- Exercício 03

semVogais :: [Char] -> [Char]
semVogais [] = []
semVogais (x:xs) = if (x=='a')||(x=='e')||(x=='i')||(x=='o')||(x=='u')||(x=='A')||(x=='E')||(x=='I')||(x=='O')||(x=='U') then semVogais xs else x:semVogais xs 

-- Exercício 04

translate :: [(Double,Double)] -> [(Double,Double)]
translate [] = []
translate ((a,b):xs) = (a+2,b+2) : translate xs 


-- Exercício 05

geraTabela' :: Int -> [(Int, Int)]
geraTabela' n = aux 1 n

aux :: Int -> Int -> [(Int, Int)]
aux e n = if (e <= n)
then (e, e^2) : aux (e+1) n
else []
