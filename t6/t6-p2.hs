import Text.Printf

type Point     = (Float,Float)
type Rect      = (Point,Float,Float)

-- Gera retangulo SVG 
-- a partir de coordenadas+dimensoes e de uma string com atributos de estilo
writeRect :: (String,Rect) -> String 
writeRect (style,((x,y),w,h)) = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

-- Gera codigo-fonte de arquivo SVG 
-- concatenando uma lista de retangulos e seus atributos de estilo
writeRects :: Float -> Float -> [(String,Rect)] -> String 
writeRects w h rs = 
  printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 
      ++ (concatMap writeRect rs) ++ "</svg>"

main :: IO ()
main = do
  let
     hue = 0 		-- Cor (0..360)
     m = 8      	    -- Número de Linhas
     n = 5		    -- Número de Colunas	
     larg = 50	    -- Largura de cada Retangulo
     alt = 30		-- Altura de cada Retangulo
     borda = 2		-- Distância entre os Retangulos
     matiz = 4

     style = map(\(c,a,b) -> (printf"fill:hsl("++show c++","++show a++"%,"++show b++"%)")) [(h,s,l) | h<- [hue,(hue+30)..((30*(matiz-1))+hue)],s <- [100,ceiling(100-(100/(n-1)))..0], l <- [100,ceiling(100-(100/(m-1)))..0]]
     rect = map(\(c,d,a,b) -> (((a+(n*(2*borda+larg)*c)),(b+(n*(2*borda+larg+15)*d))),larg,alt)) [(z,w,(x*(larg+borda)+borda),(y*(alt+borda)+borda))|z<-[0..((matiz/2)-1)],w<-[0..((matiz/2)-1)],x <-[0..n-1],y<-[0..m-1]]
     rects = zip style rect
     (w,h) = ((matiz)*(2*borda+larg)*n,((matiz)*(2*borda+alt)*m))
  writeFile "colors2.svg" $ writeRects w h rects
