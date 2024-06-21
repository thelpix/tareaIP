module ParcialTN where

{-

La Unidad de Tecnologías de la Información (UTI) de nuestra Facultad 
nos ha encargado que desarrollemos un nuevo sistema para el registro de alumnos. 
En este sistema se guarda la información de cada alumno, que está representada como una tupla de dos elementos:
 el primero es el nombre completo del alumno y el segundo una lista con las notas de los finales que rindió.

problema aproboMasDeNMaterias (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩, alumno:seq⟨Char⟩, n: Z) : Bool {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  requiere: {n > 0}
  requiere: {El alumno se encuentra en el registro }
  asegura: {res = true <=> el alumno tiene más de n notas de finales mayores o iguales a 4 en el registro}
-}
--[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7])]
--[]
--Si alumno coincide con el primer elemento de la tupla


notasAlumno :: String -> [(String,[Integer])] -> [Integer] --Extraer las notas del alumno para luego preguntar
notasAlumno alumno ((nombre,notas):xs) | alumno == nombre = notas
                                       | otherwise = notasAlumno alumno xs

materiasAprobadas :: [Integer] -> Integer --cantidad de notas aprobadas
materiasAprobadas [] = 0
materiasAprobadas (x:xs) | x >= 4 = 1 + materiasAprobadas xs
                         | otherwise = materiasAprobadas xs

masDeN :: Integer -> Integer -> Bool
masDeN n materias = materias > n


aproboMasDeNMaterias :: [(String, [Integer])] -> String -> Integer -> Bool
aproboMasDeNMaterias [] _ _ = False
aproboMasDeNMaterias registro alumno n = masDeN n (materiasAprobadas (notasAlumno alumno registro))

--EJERCICIO 2
{-
Ejercicio 2 (2 puntos)

problema buenosAlumnos (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩) : seq⟨seq⟨Char⟩⟩ {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  asegura: {res es la lista de los nombres de los alumnos que están en registro cuyo promedio de notas es mayor o igual a 8 y no tiene aplazos (notas menores que 4)}
}
Para resolver el promedio pueden utilizar la función del Preludio de Haskell 
fromIntegral que dado un valor de tipo Int devuelve su equivalente de tipo Float.
Ejercicio 3 (2 puntos)
-}
--[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7]),("Porras",[8,9,7,9,9,10,7])] DEVOLVER ["Porras"]

--Extraer notas, sacar promedios y si supera 7, anotarlo en el [string]
sumaNota :: [Integer] -> Integer --suma total de sus notas
sumaNota [] = 0
sumaNota (x:xs) = x + sumaNota xs

cantidadNotas :: [Integer] -> Integer --cuantas notas para luego dividir
cantidadNotas [] = 0
cantidadNotas (x:xs) = 1 + cantidadNotas xs

promedioNotas :: Integer -> Integer -> Float
promedioNotas cantidad suma = (fromIntegral suma) / (fromIntegral cantidad)

notasAplazadas :: [Integer] -> Bool
notasAplazadas [] = True
notasAplazadas (x:xs) | x < 4 = False
                      | otherwise = notasAplazadas xs

buenosAlumnos :: [(String, [Integer])] -> [String]
buenosAlumnos [] = []
buenosAlumnos ((nombre,notas):xs) | promedioNotas (cantidadNotas notas) (sumaNota notas) >= 8 && notasAplazadas notas = nombre : buenosAlumnos xs
                                  | otherwise = buenosAlumnos xs


--EJERCICIO 3

--Ejercicio 3 (2 puntos)

{--
problema mejorPromedio (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩) : seq⟨Char⟩ {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  requiere: {|registro| > 0 }
  asegura: {res es el nombre del alumno cuyo promedio de notas es el más alto; si hay más de un alumno con el mismo promedio de notas, devuelve el nombre de alumno que aparece primero en registro}
}
--}

promedioAlumno :: [Integer] -> Float --nota promedio del alumno
promedioAlumno [] = 0
promedioAlumno notas = promedioNotas (cantidadNotas notas) (sumaNota notas) 


mejorPromedio :: [(String, [Integer])] -> String
mejorPromedio ((nombre, notas):[]) = nombre
mejorPromedio ((nombre1,notas1):(nombre2,notas2):xs) | promedioAlumno notas1 >= promedioAlumno notas2 = mejorPromedio ((nombre1,notas1):xs)
                                                     | otherwise = mejorPromedio((nombre2, notas2):xs)

--EJERCICIO 4

{-
Ejercicio 4 (3 puntos)

problema seGraduoConHonores (registro: seq⟨seq⟨Char⟩ x seq⟨Z⟩⟩, cantidadDeMateriasDeLaCarrera: Z, alumno: seq⟨Char⟩ ) : Bool {
  requiere: {No hay nombres de alumnos repetidos en registro}
  requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
  requiere: {cantidadDeMateriasDeLaCarrera > 0}
  requiere: {El alumno se encuentra en el registro }
  requiere: {|buenosAlumnos(registro)| > 0}
  asegura: {res <=> true si aproboMasDeNMaterias(registro, alumno, cantidadDeMateriasDeLaCarrera -1) = true y 
  alumno pertenece al conjunto de buenosAlumnos(registro) y 
  el promedio de notas de finales de alumno está a menos (estrictamente) de 1 punto del mejorPromedio(registro)}
-}
perteneceAlumno :: String -> [(String,[Integer])] -> Bool
perteneceAlumno alumno [] = False
perteneceAlumno alumno ((nombre,_):xs) | alumno == nombre = True
                                       | otherwise = perteneceAlumno alumno xs

promedioDelMejor :: String -> [(String,[Integer])] -> Float --Nota promedio de el mejor alumno
promedioDelMejor alumno ((nombre,nota):xs) | alumno == nombre = promedioAlumno nota
                                           | otherwise = promedioDelMejor alumno xs

-- 3 condiciones:
--aproboMasDeNMaterias(registro, alumno, cantidadDeMateriasDeLaCarrera -1) = true AND alumno pertenece al conjunto de buenosAlumnos(registro)
--AND el promedio de notas de finales de alumno está a menos (estrictamente) de 1 punto del mejorPromedio(registro)}
seGraduoConHonores :: [(String, [Integer])] -> Integer -> String -> Bool
seGraduoConHonores registro cantidadDeMateriasDeLaCarrera alumno = aproboMasDeNMaterias registro alumno (cantidadDeMateriasDeLaCarrera -1) &&
                                                                   perteneceAlumno alumno registro &&
                                                                   promedioAlumno (notasAlumno alumno registro) > ((promedioDelMejor (mejorPromedio registro) registro) -1)