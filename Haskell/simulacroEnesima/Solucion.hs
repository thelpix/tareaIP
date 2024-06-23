module Solucion where

{-


3) A los pingos: resultado carreras [3 puntos]
Implementar la función frecuencia_posiciones_por_caballo que dada la lista de caballos que corrieron las carreras, y el diccionario que tiene los resultados del hipódromo en el formato carreras:posiciones_caballos, donde carreras es un String y posiciones_caballos es una lista de strings con los nombres de los caballos, genere un diccionario de caballos:#posiciones, que para cada caballo devuelva la lista de cuántas veces salió en esa posición.

Tip: para crear una lista con tantos ceros como caballos se puede utilizar la siguiente sintaxis lista_ceros = [0]*len(caballos)
problema frecuencia_posiciones_por_caballo(in caballos: seq⟨String⟩, in carreras: dict⟨String,seq⟨String⟩⟩: dict⟨String,seq⟨Z⟩⟩ {
  requiere: {caballos no tiene repetidos}
  requiere: {Los valores del diccionario carreras son permutaciones de la lista caballos (es decir, tienen exactamente los mismos elementos que caballos, en cualquier orden posible)}
  asegura: {res tiene como claves los elementos de caballos}
  asegura: {El valor en res de un caballo es una lista que indica en la posición i cuántas veces salió ese caballo en la i-ésima posición.}

Por ejemplo, dados
caballos= ["linda", "petisa", "mister", "luck" ]
carreras= {"carrera1":["linda", "petisa", "mister", "luck"],
                  "carrera2":["petisa", "mister", "linda", "luck"]}
se debería devolver res = {"petisa": [1,1,0,0],
                                          "mister": [0,1,1,0],
                                          "linda": [1,0,1,0],
                                          "luck": [0,0,0,2]}

-}
{-
1) Índice de la n-ésima aparición [2 puntos]
Implementar la función ind_nesima_aparicion que dada una secuencia de enteros s, 
 dos enteros n y elem devuelve la posición en la cual elem aparece por n-ésima vez en s. En caso de que elem aparezca menos de n veces en s, devolver -1.

problema ind_nesima_aparicion (in s: seq⟨Z⟩, in n: Z, in elem: Z) : Z {
  requiere: {n>0}
  asegura: {Si el elemento aparece menos de n veces en la secuencia, res= -1 }
  asegura: {Si el elemento aparece al menos n veces en la secuencia, s[res] = elem }
  asegura: {Si el elemento aparece al menos n veces en la secuencia, elem aparece n-1 veces en s entre las posiciones 0 y res-1 }

Por ejemplo, dadas
s = [-1, 1, 1, 5, -7, 1, 3], n = 2, elem = 1se debería devolver res = 2
-}
buscarPosicion :: [Integer] -> Integer -> Integer -> Integer -> Integer
buscarPosicion _ 0 _ pos = pos -1
buscarPosicion [] _ _ _ = -1
buscarPosicion (x:xs) n elem pos | x == elem = buscarPosicion xs (n-1) elem (pos+1)
                                 | otherwise = buscarPosicion xs n elem (pos+1)
 
ind_nesima_aparicion :: [Integer] -> Integer -> Integer -> Integer
--ind_nesima_aparicion (x:xs) 0 elem = --mi problema es que si hago esto no tengo forma de contar cuantas posiciones pase, me gustaria tener otro elemento que haga pos+1 cada vez
ind_nesima_aparicion s n elem = buscarPosicion s n elem 0

--EJERCICIO 2

{-
2) Mezclar [2 puntos]
Implementar la función mezclar que dadas dos listas s1 y s2 con igual cantidad de elementos devuelva una lista con los elementos intercalados.
 Esto es, las posiciones pares de res tendrán los elementos de s1 y las posiciones impares los elementos de s2, respetando el orden original.
problema mezclar (in s1: seq⟨Z⟩, in s2: seq⟨Z⟩) : seq⟨Z⟩ {
  requiere: {|s1| = |s2| }
  asegura: {|res| = 2 * |s1|}
  asegura: {res[2*i] = s1[i] y res[2*i+1] = s2[i], para i entre 0 y |s1|-1}
TIP: realizar la iteración mediante índices y no mediante elementos

Por ejemplo, dadas
s1 = [1, 3, 0, 1]
s2 = [4, 0, 2, 3]
se debería devolver res = [1, 4, 3, 0, 0, 2, 1, 3]
-}

mezclar :: [Integer] -> [Integer] -> [Integer]
mezclar []  [] = []
mezclar (x:xs) (y:ys) = x:y:mezclar xs ys

{-
ME DI CUENTA QUE ESTO ES PARA PYTHON JAJA
-}