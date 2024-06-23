module Solucion where

--EJERCICIO 1
-- ["Jorgito","Sara","Don Satur","Bagley","Jorgito","Don Satur", "Don Satur", "Don Satur", "Melisa"]
-- [("Jorgito",2),("Sara",1),("Don Satur",4),("Bagley",1),("Melisa",1)]

cuantasVeces :: String -> [String] -> Integer --Cuenta en una lista, cuantas veces esta esa palabra
cuantasVeces _ [] = 0
cuantasVeces producto (x:xs) | producto == x = 1 + cuantasVeces producto xs
                             | otherwise = cuantasVeces producto xs

remover :: String -> [String] -> [String]
remover _ [] = []
remover palabra (x:xs) | palabra == x = remover palabra xs
                       | otherwise = x : remover palabra xs 

generarStock :: [String] -> [(String, Integer)]
generarStock [] = []
generarStock (x:xs) = (x, cuantasVeces x (x:xs)) : generarStock (remover x (x:xs)) --[("Jorgito",3),("Jorgito",2),("Jorgito",1)], me interesa borrar los repetidos a la hora de usar recursividad

--EJERCICIO 2

stockDeProducto :: [(String, Integer)] -> String -> Integer --De una lista de productos con su stock, devuelve el stock si se encuentra
stockDeProducto [] _ = 0
stockDeProducto ((palabra, cantidad):xs) producto | producto == palabra = cantidad
                                                  | otherwise = stockDeProducto xs producto

--EJERCICIO 3


--EJ: [("Jorgito",2),("Sara",1),("Don Satur",4)] [("Jorgito",500),("Don Satur",200),("Sara",3305)] = 5105
-- 2*500 + 200* 4 + 3305* 1 

multiplicarStock :: String -> Float -> [(String,Integer)] -> Float --Individualmente cada multiplicacion stock * precio
multiplicarStock _ _ [] = 0
multiplicarStock palabra precio ((marca, stock):xs) | palabra == marca = precio * fromIntegral stock
                                                    | otherwise = multiplicarStock palabra precio xs

dineroEnStock :: [(String, Integer)] -> [(String, Float)] -> Float
dineroEnStock _ [] = 0
dineroEnStock stock ((palabra,precio):ys) = multiplicarStock palabra precio stock + dineroEnStock stock ys

--EJERCICIO 4

aplicarOferta :: [(String, Integer)] -> [(String, Float)] -> [(String, Float)] --si el Stock >10, aplicar descuento de 0.80, sino, devolverlo como siempre
aplicarOferta _ [] = []
aplicarOferta stock ((marca, precio):xs) | stockDeProducto stock marca > 10 = (marca, precio * 0.8) : aplicarOferta stock xs
                                         | otherwise = (marca, precio) : aplicarOferta stock xs

                                    