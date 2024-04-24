import System.Console.Terminfo (functionKey)
noRepetir :: [(String,String)] -> Bool
noRepetir [(x1,x2)] = x1/=x2

noIncluye :: [(String,String)] -> Bool
noIncluye [(x1,x2),(y1,y2)]
    |(x1,x2) == (y1, y2) && (x1,x2) == (y2, y1) = False
    |otherwise = True
--Si todos los 2 elementos de la primera dupla no sean iguales a la 2da dupla
--para eso, debo primero que no se repitan las duplas

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = False 
relacionesValidas [(x1,x2), (y1,y2)] = noIncluye [(x1,x2),(y1,y2)] && noIncluye [(y1,y2),(x1,x2)] && noRepetir[(x1,x2)] && noRepetir[(y1,y2)]
 
--asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales} 
--relaciones[(tupla1),(tupla2)] no debe tupla1 ser incluida tupla2, y viceversa, ni los elementos de las tuplas sean iguales


pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys

funcionTEST :: (Eq t) => [t] -> [t]
funcionTEST [] = []
funcionTEST (x:ys) | pertenece x ys = funcionTEST ys
                   | otherwise = x:funcionTEST ys

personas :: [(String, String)] -> [String]
personas [] = ["nadie"]
personas [(x1,x2),(y1,y2)] | relacionesValidas[(x1,x2),(y1,y2)] = funcionTEST[x1,x2,y1,y2]

--agarrando las dos duplas de la lista, el resultado es la suma de los elementos de las tuplas, sin repetirse.
