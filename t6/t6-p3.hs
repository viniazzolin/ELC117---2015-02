import Text.Printf
 
type Point     = (Float,Float)
type Rect      = (Point,Float,Float)
type Circle    = (Point,Float)

-- Gera retangulo SVG 
-- a partir de coordenadas+dimensoes e de uma string com atributos de estilo
writeRect :: (String,Rect) -> String 
writeRect (style,((x,y),w,h)) = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

-- Gera Circulo SVG
writeCircle :: (String,Circle) -> String
writeCircle (style,((cx,cy),r)) =
  printf "<circle cx='%.3f' cy='%.3f' r='%.2f' style='%s' />\n" cx cy r style


-- Gera codigo-fonte de arquivo SVG 
-- concatenando uma lista de retangulos e seus atributos de estilo
writeRects :: Float -> Float -> [(String,Rect)] -> String 
writeRects w h rs = 
  printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h ++ (concatMap writeRect rs) ++ "</svg>"

-- concatenando uma lista de circulos e seus atributos de estilo
writeCircles :: Float -> Float -> [(String,Circle)] -> String 
writeCircles w h rs = 
  printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h ++ (concatMap writeCircle rs) ++ "</svg>"
  

main1 :: IO ()
main1 = do
  let
    hue = 120           -- Cor (0..360)
    m = 10              -- Número de Linhas
    n = 10              -- Numero de Colunas
    r = 30              -- Raio 
    dist = 20           -- Distância entre os Círculos

--Matriz de Cores
    style = map(\(a,b) -> (printf"fill:hsl("++show hue++","++show a++"%,"++show b++"%);stroke:black;stroke-width:1;opacity:0.3")) [(s,l) | s <- [100,ceiling(100-(100/(n-1)))..0], l <- [100,ceiling(100-(100/(m-1)))..0]]
-- Matriz de Posições
    circle =  map(\(a,b) -> ((a,b),r)) [((x*(r+dist)+dist), (y*(r+dist)+dist)) | x <- [0..n-1], y <- [0..m-1]]
    circles = zip style circle
    (w,h) = ((r+dist)*n,(r+dist)*m)
  writeFile "colors3-1.svg" $ writeCircles w h circles

main2 :: IO ()
main2 = do
  let
    hue = 120           -- Cor (0..360)
    m = 10               -- Número de Linhas 
    n = 15               -- Número de Colunas 
    lar = 50            -- Largura 
    alt = 50            -- Altura 
    dist = 0            -- Distância entre os Retangulos

-- Matriz de Cores
    style = map(\(a,b) -> (printf"fill:hsl("++show hue++","++show a++"%,"++show b++"%);stroke:black;stroke-width:1;opacity:0.3")) [(s,l) | s <- [100,ceiling(100-(100/(n-1)))..0], l <- [100,ceiling(100-(100/(m-1)))..0]] 
-- Matriz de Posições
    rect =  map(\(a,b) -> ((a,b),lar,alt)) [(x*(lar+dist)+dist, y*(alt+dist)+dist) | x <- [0..n-1], y<- [0..m-1]] 
    rects = zip style rect
    (w,h) = ((lar+dist)*n,(alt+dist)*m)
  writeFile "colors3-2.svg" $ writeRects w h rects
