module Simulacro where

--EJ 1

noRepetido :: (String, String) -> [(String, String)] -> Bool
noRepetido _ [] = True
noRepetido (a,b) ((x,y):xs) | (a,b) == (x,y) || (b,a) == (x,y) = False
                            | otherwise = noRepetido (a,b) xs

--si tengo X tuplas, (pepe,maria),(juana, pablo),(diana,melisa), (pepe, juana), (pepe, melisa)
--Ninguna tupla debe tener sus elementos repetidos entre sí
--Ninguna tuplas que , sin importar el orden, se repitan sus pares de elementos
--Primero, no deberia haber tuplas que sus elementos se repitan


-- (a/=b) que una tupla no tenga elementos repetidos.
relacionesValidas :: [(String, String)] -> Bool --Una lista, con X cantidad de duplas de texto
relacionesValidas [] = True
relacionesValidas ((a,b):xs) = (a /= b) && noRepetido (a,b) xs && relacionesValidas xs

-- EJ 2

juntarlos :: [(String,String)] -> [String]
juntarlos [] = []
juntarlos ((a,b):xs) = a:b:juntarlos xs --juntar

pertenecer :: (Eq t) => t -> [t] -> Bool --Determinara si un elemento de la lista se repite con todas las demas
pertenecer _ [] = False --no se repitio
pertenecer x (y:ys) | x == y = True -- si se repitio
                    | otherwise = pertenecer x ys

eliminarDuplicado :: (Eq t) => [t] -> [t]
eliminarDuplicado [] = []
eliminarDuplicado (x:xs) | pertenecer x xs = eliminarDuplicado xs
                         | otherwise = x:eliminarDuplicado xs
--Una vez descartado que el conjunto es reflexivo ( a==b) y simetrico, ahora queda eliminar cuando se repite los elementos de las tuplas que se repita
--Despues de pasar el filtro de que solo queden esas tuplas, juntar todos sus elementos, y luego, remover las repeticiones.

personasLista :: [(String, String)] -> [String]
personasLista [] = []
personasLista r = eliminarDuplicado(juntarlos r)

--EJERCICIO 3

-- (pepe,maria),(juana, pablo),(diana,melisa), (pepe, juana)
-- ["maria", "pablo", "diana", "melisa", "pepe","juana"]
--quiero que, agarrando un elemento de la lista personas, si esta relacionada con otros elementos de la lista a traves de las tuplas.
--Si uso el caso "pepe", el res deberia = ["maria", "juana"]
amigosDe :: String -> [(String, String)] -> [String]
amigosDe p [] = []
amigosDe p ((a,b):xs) | p == a = b:amigosDe p xs
                      | p == b = a:amigosDe p xs
                      | otherwise = amigosDe p xs


--EJERCICIO 4
--De una lista de tuplas, validas para relacionesValidas, poner la persona ("elemento") con mas amigos que tenga (mas tuplas)
--podria comparar con 2 elementos a las listas, medir sus longitudes, y eliminar el mas chico, dejando los dos mas grandes, para despues dejar solo uno o borrarlo
--primero, agarrar primer persona, poner a la 2da detras (siempre es su amigo) y luego 
--agarrar elemento de una tupla, y luego 
-- r =(pepe,maria),(juana, pablo),(diana,melisa), (pepe, juana)
-- ["maria", "pablo", "diana", "melisa", "pepe","juana"]
personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos r = personaAmigosAux r (personasLista r) 

listaLongitud :: [t] -> Integer
listaLongitud [] = 0
listaLongitud (x:xs) = 1 + listaLongitud xs

personaAmigosAux ::  [(String, String)] -> [String] -> String
personaAmigosAux _ [a] = a 
personaAmigosAux r (a:b:xs) | listaLongitud(amigosDe a r) > listaLongitud(amigosDe b r) = personaAmigosAux r (a:xs)
                            | otherwise = personaAmigosAux r (b:xs)