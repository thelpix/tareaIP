module Solucion where

--EJ 1
divisoresPropiosAux :: Integer -> Integer -> [Integer]
divisoresPropiosAux n d | n == 1 = [1]
                        | d > div n 2 = []
                        | mod n d == 0 = d : divisoresPropiosAux n (d+1)
                        | otherwise = divisoresPropiosAux n (d+1)
                        
divisoresPropios :: Integer -> [Integer] --primero obtener los divisores de n, los numeros que cuyo modulo es 0
divisoresPropios n = divisoresPropiosAux n 1

--EJERCICIO 2:

sumaLista :: [Integer] -> Integer
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs
 
sonAmigos :: Integer -> Integer -> Bool
sonAmigos n m = sumaLista (divisoresPropios n) == m && sumaLista(divisoresPropios m) == n
 --si n y m son amigos, o sea, los divisores de n da m y los divisores de m da n

--EJERCICIO 3

darPerfecto :: Integer -> Integer -> [Integer] --num empieza en 1, y el contador n se reduce si halla un numero perfecto
darPerfecto num 0 = []
darPerfecto num contador | sumaLista(divisoresPropios num) == num = num : darPerfecto (num+1) (contador-1)
                         | otherwise = darPerfecto (num + 1) contador

losPrimerosNPerfectos :: Integer -> [Integer] --si n es 3, la lista es [6,28,496], n es el contador hasta hallar un numero perfecto, se le resta 1
losPrimerosNPerfectos n = darPerfecto 1 n

--EJERCICIO 4

obtenerAmigo :: Integer -> [Integer] -> [(Integer, Integer)] --obtengo su par amigo
obtenerAmigo _ [] =  []
obtenerAmigo n (x:xs) | sonAmigos n x = [(n,x)]
                      | otherwise = obtenerAmigo n xs

listaDeAmigos :: [Integer] -> [(Integer, Integer)] -- el res son tuplas de 2 numeros donde sean amigos y esten en la lista, 
--ej: [1,6368, 284,2,1184,1210,3,220,2620,2924,4,5020,5564,5,6232] = [(6368,6232),(284,220),(1184,1210),(2620,2924),(5020,5564)]
listaDeAmigos [] = []
listaDeAmigos (x:xs) = obtenerAmigo x xs ++ listaDeAmigos xs