pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y:ys) = x==y || pertenece x ys

hayRepetidos :: (Eq t) =>  [t] -> Bool
hayRepetidos [] = False --vacia
hayRepetidos (x:xs) | pertenece x xs = True --pertenece x (hayRepetidos[]) elemento x al resto de la lista
                    | otherwise = hayRepetidos xs --sino tiene, deletea x y avanza al sig.


quitar :: (Eq t) => t -> [t] -> [t]
quitar x [] = []
quitar x (y:ys) | x == y = ys
                | otherwise = y:quitar x ys

maximo :: [Int] -> Int
maximo [] = 0
maximo [x] = x --si no hay otro numero, es porque los mato y entonces si es el mas grande
maximo (x:y:xs) | abs(x) < abs((y)) = maximo (y:xs) --si el primer elemento es menor al segundo, se elimina y sigues con el segundo
                | otherwise = maximo (x:xs) --sino, deleteas el 2do y sigues con el 1ro y la lista

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar (x:y:xs) | x > y = ordenar(y:xs) ++ [x]
--tail (x:y:xs) ++ [head (x:y:xs)]
                 | x <= y = x:(ordenar(y:xs))


--ordenar xs = (max xs : (ordenar(quitar(max xs) xs)))
--ordenar (1,6,3,87,12,56)
--ordenar (1,6 3,87,12,56) 1:(6,3,87,12,56)
--1:(3,87,12,56,6)
--1:3:(87,12,56,6) = 1:3:(12,56,6,87)
--1:3:12:(56,6,87) = 1:3:12:(6,87,56)
--1:3:12:6:(56,87) 
-- SI A < B == (1,3,12,6,56,87) = (1,3,6,56,87,12) = (1,3,6,56,12, 87) = (1,3,6,12,87,56) = (1,3,6,12,56,87) 
