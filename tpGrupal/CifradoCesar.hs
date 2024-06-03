module CifradoCesar where
import Data.Char

--CAMBIAR EL [A .. Z] CON ord y chr 
--EJ 1
esMinuscula :: Char -> Bool
esMinuscula c = (97 >= ord c) && (ord c <= 122) --si c pertenece al abecedario ingles minuscula

--pertenece :: Char -> [Char] -> Bool
--pertenece c [] = False
--pertenece c (x:xs) | c == x = True
--                   | otherwise = pertenece c xs
{-
--EJ 2
ordenLetra :: Char -> [Char] -> Int
ordenLetra c [] = 0
ordenLetra c (x:xs) | c == x = 0
                    | otherwise = 1 + ordenLetra c xs

letraANatural :: Char -> Int
letraANatural c = ordenLetra c ['a'..'z']

--EJ 3 
--si 'a' y n=3, 0+3 = 3, entonces sera 'd'
--si empieza en 'b' y n=50, 1+50 = 51, 51>= 25, entonces 51-25 hasta que cumpla, siendo 'b' (restado dos veces)
--si empieza en 'c' y n=1, 2-1 = 1, sera 'b'
--si '@', sera '@'

sumaLetras :: Char -> Int -> Int
sumaLetras c n = ordenLetra c ['a'..'z'] + n

deNALetra :: Int -> [Char] -> Char
deNALetra n [] = deNALetra (n-25) ['a'..'z'] --si n es mayor a 25
deNALetra n (x:xs) | n == 0 = x -- si es n ya es 0
                   | n<0 = deNALetra (n+25) x:xs --n < 0 --y si es negativo? sumarle 25
                   | otherwise = deNALetra (n-1) xs --si es positivo mayor a 0, continuar

desplazar :: Char -> Int -> Char
desplazar c n | pertenece c ['a'..'z'] = deNALetra (sumaLetras c n) ['a'..'z']
              | otherwise = c
-}