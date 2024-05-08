module SimulacroCod where


--EJ 1

--dara V si x coincide con el primer elemento de alguna tupla
hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar c [] = False
hayQueCodificar c ((a,_):xs) | c == a = True
                             | otherwise = hayQueCodificar c xs

--EJ 2
-- 'a' ['h','a','s','t','a'], [('h','a'),('a','s'),('s','t'),('t','a')]
cuantosRepetidos :: Char -> [Char] -> Int
cuantosRepetidos c [] = 0
cuantosRepetidos c (x:xs) | c == x = 1 + cuantosRepetidos c xs
                          | otherwise = cuantosRepetidos c xs

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c frase ((a,b):ys )
        | hayQueCodificar c ((a,b):ys) = cuantosRepetidos c frase
        | otherwise = 0

--EJ 3
--res debe ser el caracter que mas veces aparezca en la frase.
-- c pertenece a frase 
--['h','a','s','t','a'] ['h','a','s','t','a'] [('h','a'),('a','s'),('s','t'),('t','a')]


laQueMasHayQueCodificarAux :: [Char] -> [Char] -> [(Char,Char)] -> Char -- h 
laQueMasHayQueCodificarAux [x] _ _ = x
laQueMasHayQueCodificarAux (x:y:xs) frase mapeo  | cuantasVecesHayQueCodificar x frase mapeo >= cuantasVecesHayQueCodificar y frase mapeo = laQueMasHayQueCodificarAux (x:xs) frase mapeo
                                                 | otherwise = laQueMasHayQueCodificarAux (y:xs) frase mapeo

laQueMasHayQueCodificar :: [Char] -> [(Char, Char)] -> Char 
laQueMasHayQueCodificar frase mapeo = laQueMasHayQueCodificarAux frase frase mapeo

-- EJ 4 

--si la letra de la frase, no esta en el mapeo, el res es la letra de la frase, mostrar todas las letras que no esten
--si esta la letra de la frase en el mapeo, entonces ['a','y','u','d','a','d'] -> [('a','x'),('d','e'),('z','a')),('y','m'),('p','q')] -> ['x','m','u','e','x','e']

reemplazar :: Char -> [(Char, Char)] -> Char -- 'a' -> 'e'
reemplazar letra ((x,y):xs) | letra == x = y
                            | otherwise = reemplazar letra xs 

codificarFrase :: [Char] -> [(Char, Char)] -> [Char]
codificarFrase [] mapeo = []
codificarFrase (a:as) mapeo | hayQueCodificar a mapeo = reemplazar a mapeo : codificarFrase as mapeo --reemplazar ya que a pertenece al mapeo
                            | otherwise = a:codificarFrase as mapeo

 

