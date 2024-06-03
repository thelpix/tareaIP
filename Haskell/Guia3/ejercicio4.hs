--Dos vectores/tuplas, que pueden tener Dos valores ENTEROS, dan un solo entero.
prodInt :: ((Integer, Integer) -> (Integer,Integer) -> Integer)
prodInt x y = fst x * fst y + snd x * snd y

todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor x y | fst x < fst y && snd x < snd y = True 
              | otherwise = False

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos x y = sqrt((fst y - fst x)^2+(snd y - snd x)^2)

sumaTerna :: (Float, Float, Float) -> Float
sumaTerna (x1, x2, x3) = x1 + x2 + x3

--Primero Creas la funcion
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
--Esta funcion, que contiene una terna y un valor, crearas una lista de los elementos de esa terna usando la funcion SUM
--Cada elemento de esa terna se guarda en una lista con elemento "num", comprobando que "num" sea multiplo de y
--Si es multiplo, lo guarda, y una vez terminado, suma los guardados con "sum"
sumarSoloMultiplos (x1, x2, x3) y = sum[num | num <- [x1, x2, x3], num `mod` y == 0]


--case (EXPRESION) of funciona como un switch, una fusion de pattern matching + switch
posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (x1, x2, x3) =
  case (even x1, even x2, even x3) of
    (True, _, _) -> 1
    (_, True, _) -> 2   
    (_, _, True) -> 3
    _           -> 4

crearPar :: a -> b -> (a, b)
crearPar x y = (x, y)

invertir :: (a, b) -> (b, a)
invertir (x1,x2) = (x2,x1)