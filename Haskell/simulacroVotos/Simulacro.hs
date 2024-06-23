module Simulacro where

{-
1) Porcentaje de Votos Afirmativos [1 punto]
problema porcentajeDeVotosAfirmativos (formulas: seq⟨String x String⟩,votos:seq< Z >, cantTotalVotos: Z) : R {
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos}
 asegura: {res es el porcentaje de votos no blancos (es decir, asociados a alguna de las fórmulas) sobre el total de votos emitidos}
}
Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int:



________________
-}
--EJERCICIO1

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

sumaVotos ::  [Int] -> Int
sumaVotos [] = 0
sumaVotos (x:xs) = x + sumaVotos xs

porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int -> Float --cantidad de votos en blanco
porcentajeDeVotosAfirmativos _ votos cantTotalVotos = (division (sumaVotos votos) cantTotalVotos) * 100


--EJERCICIO 2
{-
2) Formulas Inválidas [3 puntos]
problema formulasInvalidas (formulas: seq⟨String x String⟩) : Bool {
 requiere: {True}
 asegura: {(res = true) <=> formulas contiene un candidato se propone para presidente y vicepresidente en la misma fórmula; o algún candidato se postula para presidente o vice en más de una fórmula }
-}

noPerteneceCandidato :: String -> [(String,String)] -> Bool --cuando un candidato no pertenece a una tupla, dar true
noPerteneceCandidato _ [] = True
noPerteneceCandidato candidato ((x1,x2):xs) | candidato == x1 || candidato == x2 = False
                                            | otherwise = noPerteneceCandidato candidato xs

--[("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno"),("Sara Mortero","Ivan Ezequiel")]
formulasInvalidas :: [(String, String)] -> Bool --Es invalido si un un candidato esta en mas de una candidatura, no se tiene que repetir nunca
formulasInvalidas [] =  False
formulasInvalidas ((presidente, vice):xs) | presidente /= vice && noPerteneceCandidato presidente xs && noPerteneceCandidato vice xs = formulasInvalidas xs
                                          | otherwise = True

--basicamente que un elemento no se repita en ninguno otro

--EJERCICIO 3

{-
3) Porcentaje de Votos [3 puntos]
problema porcentajeDeVotos (vice: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R {
 requiere: {La segunda componente de algún elemento de formulas es vice}
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {Hay al menos un elemento de votos mayores estricto a 0}
 asegura: {res es el porcentaje de votos que obtuvo vice sobre el total de votos afirmativos}
}
Para resolver este ejercicio pueden utilizar la función division presentada en el Ejercicio 1.
________________Resumen: cuantos votos obtuvo la tupla que pertenece vice, sobre los votostotales
-}

votosCandidato :: String -> [(String, String)] -> [Int] -> Int
votosCandidato vice ((x1,x2):xs) (y:ys) | vice == x1 || vice == x2 = y
                                        | otherwise = votosCandidato vice xs ys

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos vice formulas votos = (division (votosCandidato vice formulas votos) (sumaVotos votos)) * 100

--EJERCICIO 4
{-
problema menosVotado (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {Hay al menos un elemento de votos mayores estricto a 0}
 requiere: {|formulas| > 0}
 asegura: {res es el candidato a presidente de formulas menos votado de acuerdo a los votos contabilizados en votos}
}
-}
--[("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno"),("Ivan","Ezequiel")] [10,35,20]
menosVotado :: [(String,String)] -> [Int] -> String
menosVotado (x:[]) _ = fst x
menosVotado (x:y:xs) (v1:v2:vs) | v1 < v2 = menosVotado (x:xs) (v1:vs)
                                | otherwise = menosVotado (y:xs) (v2:vs)

{-
menosVotado :: [(String,String)] -> [Int] -> String
menosVotado (x:[]) _ = fst x
menosVotado ((x1,x2):(y1,y2):xs) (l1:l2:ls) | votosCandidato x1 ((x1,x2):(y1,y2):xs) (l1:l2:ls) < votosCandidato y1 ((x1,x2):(y1,y2):xs) (l1:l2:ls) = menosVotado ((x1,x2):xs) (l1:ls)
                                            | otherwise = menosVotado((y1,y2):xs) (l2:ls)
-}