-- Nome: Vinícius Stivanin Azzolin			ELC117 - Paradigmas de Programação
-- Profª Andrea Schwertner Charão           Trabalho 03

-- Exercício 1

isEven :: Int -> Bool
isEven n = mod n 2 == 0

-- A função mod realiza a divisão e retorna o resto da mesma. No caso da função isEven, é realizada a divisão do número desejado por 2 e comparado o valor do resto obtido com o valor zero. Se forem iguais, a função retorna True e o número testado é par. Se não, a função retorna False e o número não é par.

-- Exercício 2

somaquad :: Int -> Int -> Int
somaquad x y = x*x + y*y

-- Exercício 3

doubleFirst :: [Int] -> Int
doubleFirst list = head list *head list

-- Exercício 4

hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads x y = head x == head y

-- Exercício 5

addName :: [String] -> [String]
addName name = map ("Mr " ++) name

-- Exercício 6

contSpace :: [Char] -> Int
contSpace x =length (filter (== ' ') x ) 

-- Exercício 7

eqw :: [Float] -> [Float]
eqw x = map (\n -> (3*n*n + 2/n +1)) x

-- Exercício 8

age :: [Int] -> [Int]
age x = map (2015-) (filter (>1970) x)

-- Exercício 9

serie :: Double -> [Double] -> Double
serie x list = sum( map (\n -> (n/x)) list )

-- Exercício 10

charFound :: Char -> String -> Bool
charFound c p = c `elem` p

-- Exercício 11

htmlListItems :: [String] -> [String] 
htmlListItems x = map (\n -> "<LI>" ++ n ++"</LI>") x

-- Exercício 12

-- takeWhile (< 5) [1,2,3,4,5]
--	[1,2,3,4]
-- takeWhile (/=' ') "Fulana de Tal"
--	"Fulana"
--takeWhile (/= 'e') "TEste"
--  "TEst"

-- Exercício 13

femaleName :: [String] -> [String]
femaleName str = filter(\n -> last(n) == 'a') (map(takeWhile(/=' '))str)


