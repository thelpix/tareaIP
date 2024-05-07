module Simulacro where


--EJ 1
golesTitular :: [Int] -> Int
golesTitular [] = 0
golesTitular (x:xs) = x + golesTitular xs

--la primera componente representa el nombre del equipo, y la segunda representa el nombre del arquero titular de dicho equipo.
--[("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi")] y la lista de goleses [3, 5, 9], eso indicaría que Neyder Aragon recibió 3 goles, y Nahuel 5 goles
atajaronSuplentes :: [(String, String)] -> [Int] -> Int -> Int --Arquero titular, goles de cada arquero titular, gol total de todo el partido, y res=goles de arqueros no titulares (DIFERENCIA)
atajaronSuplentes _ listaGol x = x- golesTitular listaGol

--EJ 2

{-
noRepetido :: String -> [(String, String)] -> Bool --que no se repita el elemento que quieras con otras tuplas de la lista
noRepetido a [] = True
noRepetido a ((x,y):xs) | a == x || a == y = False
                      | otherwise = noRepetido a xs

probarClub :: String -> [(String, String)] -> Bool --si no se repite, seguir con el sig elemento.
probarClub a [] = True
probarClub a ((x,y):xs) | noRepetido a ((x,y):xs) = probarClub x xs
                        | otherwise = False

probarArquero :: String -> [(String, String)] -> Bool --si no se repite, seguir con el sig elemento.
probarArquero a [] = True
probarArquero a ((x,y):xs) | noRepetido a ((x,y):xs) = probarClub y xs
                        | otherwise = False
-}
--OPTIMIZAR CODIGO

noRepetido :: (Eq t) => t -> [(t, t)] -> Bool --que no se repita el elemento que quieras con otras tuplas de la lista
noRepetido _ [] = True
noRepetido a ((x,y):xs) = (a /= x && a /= y) && noRepetido a xs

repetirSigoMismo :: (String, String) -> [(String, String)] -> Bool --que no se repitan las tuplas consigo mismas
repetirSigoMismo _ [] = True
repetirSigoMismo (a,b) ((x,y):xs) = a /= b && repetirSigoMismo (x,y) xs

--[("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel")]
equiposValidos :: [(String, String)] -> Bool --no se repite los nombres de clubs en las tuplas, ni arqueros, ni jugadores con nombres de club
equiposValidos [] = True
equiposValidos ((a,b):xs) = noRepetido a xs && noRepetido b xs && repetirSigoMismo (a,b) xs && equiposValidos xs 

--EJ 3

--Arquero, Equipo Arquero, Goles a Porcentaje
--res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares
--ej: "Gabriel" [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel")] [1,5,3] = 33% goles de Gabriel

--Ver en cual tupla pertenece "Gabriel", avanzando una tupla y un elemento de la lista, tipo
-- "gabriel", no coincide con tupla1, ignorar 1, gabriel no coincide con tupla2, ignorar 2, gabriel coincide con tupla3, elegir elemento 3 
-- sumar todos los elementos y restarle el elemento de "gabriel"

golesArqueros :: String -> [(String,String)] -> [Int] -> Float --saber que 3  eran de gabriel si uso el ejemplo de arriba.
golesArqueros _ [] [] = 0 --si no esta en la lista
golesArqueros z ((a,b):xs) (y:ys) 
    | z == b = fromIntegral y
    | otherwise = golesArqueros z xs ys

--Podria usar golesTitular para sacar los goles totales de x
--y hacer 

porcentajeDeGoles :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeGoles a r x = golesArqueros a r x / fromIntegral (golesTitular x) * 100

--EJ 4
--De los arqueros, el que menor goles recibio.
--comparar los elementos de la lista, usar golesArqueros?

--[("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel")] [1,5,3]
vallaMenosVencida :: [(String, String)] -> [Int] -> String
vallaMenosVencida [(a,b)] _ = b
vallaMenosVencida ((a,b):(c,d):xs) (y1:y2:ys) | y1 > y2 = vallaMenosVencida ((a,b):xs) (y1:ys)
                                              | otherwise = vallaMenosVencida  ((c,d):xs) (y2:ys)