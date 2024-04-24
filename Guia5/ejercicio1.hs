import System.Win32.Automation.Input (xBUTTON1)
longitud :: (Eq t) => [t] -> Integer
longitud (x:xs) = 1 + longitud(xs)
longitud [] = 0

ultimo :: (Eq t) => [t] -> t
ultimo [x] = x
ultimo (_:xs) = ultimo xs --si hay un valor cualquiera, borrarlo.

principio :: (Eq t) => [t] -> [t]
principio [x] = [] --borrara el ultimo elemento restante.
principio (x:xs) = x:principio xs

reverso :: (Eq t) => [t] -> [t]
reverso [] = []
reservo xs = last xs : reverso (init xs)

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False --si x sigue estando y el conjunto y esta vacío, ya no hay numeros, entonces nunca pertenecio
pertenece x (y:ys) 
    | x == y = True --si el primer elemento x es igual al primer elemento de y, esta en la lista
    | otherwise = pertenece x ys --sino, ir probando con todos

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [x] = True
todosIguales (x:y:xs) | x == y = todosIguales(y:xs)
                      | otherwise = False

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [x] = True
todosDistintos (x:y:xs) | x /= y = todosDistintos(y:xs) --Si x es distinto de y, se elimina x y sigue con el resto de la lista
                        | otherwise = False -- Si son iguales, es falso

hayRepetidos :: (Eq t) =>  [t] -> Bool
hayRepetidos [] = False --vacia
hayRepetidos (x:xs) | pertenece x xs = True --pertenece x (hayRepetidos[]) elemento x al resto de la lista
                    | otherwise = hayRepetidos xs --sino tiene, deletea x y avanza al sig.

quitar :: (Eq t) => t -> [t] -> [t]
quitar x [] = []
quitar x (y:ys) | x == y = ys
                | otherwise = y:quitar x ys

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos x [] = []
quitarTodos x (y:ys) | x == y = quitarTodos x ys
                    | otherwise = y:quitarTodos x ys

incluye :: (Eq t) => [t] -> [t] -> Bool
incluye [] _ = True
incluye _ [] = False
incluye (x:xs) (y:ys) 
    | pertenece x (y:ys) = incluye xs (y:ys) --si el primer elemento de x esta en la lista de y, repitalo con el sig. elemento de x
    | otherwise = False --sino, es porque hay uno diferente en la lista de y
 
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos x y = incluye x y && incluye y x --Si todos los elementos de x estan en el conjunto y, y viceversa

--ej 9

--capicua :: (Eq t) => [t] -> Bool

maximo :: [Int] -> Int
maximo [] = 0
maximo [x] = x --si no hay otro numero, es porque los mato y entonces si es el mas grande
maximo (x:y:xs) | abs (x) < abs ((y)) = maximo (y:xs) --si el primer elemento es menor al segundo, se elimina y sigues con el segundo
                | otherwise = maximo (x:xs) --sino, deleteas el 2do y sigues con el 1ro y la lista

