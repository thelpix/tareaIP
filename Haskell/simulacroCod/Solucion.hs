module Solucion where

hayQueCodificar :: Char -> [(Char, Char)] -> Bool --'a' [('a','b'),('s','a'),('c','s')] 
hayQueCodificar c [] = False
hayQueCodificar c (x:xs) | c == fst x = True
                         | otherwise = hayQueCodificar c xs

--EJ 2
contarChar :: Char -> String -> Int
contarChar _ [] = 0
contarChar c (x:xs) | c == x = 1 + contarChar c xs
                    | otherwise = contarChar c xs

cuantasVecesHayQueCodificar :: Char -> String -> [(Char, Char)] -> Int
cuantasVecesHayQueCodificar c frase mapeo | hayQueCodificar c mapeo = contarChar c frase -- contar cuantas veces aparece c en la frase
                                          | otherwise = 0

--EJ 3

laQueMasHayQueCodificar :: String -> [(Char, Char)] -> Char --"hola" [('z','s'),('h','l'),('m','a')]
laQueMasHayQueCodificar (x:[]) mapeo = x
laQueMasHayQueCodificar (x:y:xs) mapeo | cuantasVecesHayQueCodificar x (x:y:xs) mapeo >= cuantasVecesHayQueCodificar y (x:y:xs) mapeo = laQueMasHayQueCodificar (x:xs) mapeo
                                       | otherwise = laQueMasHayQueCodificar (y:xs) mapeo

--EJ 4
cambiarChar :: Char -> [(Char,Char)] -> Char --me cambia el char de 1ra componente a 2da
cambiarChar c (x:xs) | c == fst x = snd x
                     | otherwise = cambiarChar c xs

codificarFrase :: String -> [(Char, Char)] -> String --"hola" [('z','s'),('h','l'),('m','a')] = "lola"
codificarFrase [] mapeo = []
codificarFrase (x:xs) mapeo | hayQueCodificar x mapeo = cambiarChar x mapeo : codificarFrase xs mapeo
                            | otherwise = x : codificarFrase xs mapeo
 