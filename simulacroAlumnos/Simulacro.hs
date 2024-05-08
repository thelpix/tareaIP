module Simulacro where


--es true si tiene mas de n notas >= 4 
--descartar las notas < 4 de la lista, y luego contar el total si superan n
mayores4 :: [Integer] -> [Integer]
mayores4 [] = []
mayores4 (x:xs) | x >= 4 = x:mayores4 xs
                | otherwise = mayores4 xs

cuantosMayor4 :: [Integer] -> Integer
cuantosMayor4 [] = 0
cuantosMayor4 (x:xs) = 1 + cuantosMayor4 xs

--- nota [1,6,8,3,8] = [6,8,8], luego, que superen a n, ponele que n=2
-- [("AlumnoA", [4,5,10,4]), ("AlumnoB", [6,7,10,8]), ("AlumnoC", [1]), ("AlumnoD", [2, 3])] "AlumnoB" 2
-- primero, que alumno coincida con el primer componente

alumnoIndicado :: [([Char],[Integer])] -> [Char] -> [Integer]
alumnoIndicado [] alumno = []
alumnoIndicado ((a,b):xs) alumno | a == alumno = b
                                 | otherwise = alumnoIndicado xs alumno

aproboMasDeNMaterias :: [([Char],[Integer])] -> [Char] -> Integer -> Bool
aproboMasDeNMaterias [] _ _ = False
aproboMasDeNMaterias registro alumno n = n < cuantosMayor4 (mayores4 (alumnoIndicado registro alumno))

--EJ 2
--De la lista, sacar los que tengan algun elemento menor a 4
--Luego, promediar (sacando su longitud) y dividir la suma total
--de forma recursiva, repetir con las demas tuplas para sumarlas a la lista

notasMayor4 :: [Integer] -> Bool
notasMayor4 [] = True
notasMayor4 (x:xs) | x < 4 = False
                   | otherwise = notasMayor4 xs

sumaNotas :: [Integer] -> Integer
sumaNotas [] = 0
sumaNotas (x:xs) = x + sumaNotas xs

cuantasNotas :: [Integer] -> Integer
cuantasNotas [] = 0
cuantasNotas (x:xs) = 1 + cuantasNotas xs

promedio :: Integer -> Integer -> Float
promedio total cuantas = (fromIntegral  total / fromIntegral cuantas)

buenosAlumnos :: [([Char],[Integer])] -> [[Char]]
buenosAlumnos [] = []
buenosAlumnos ((nombre,notas):registro) | ((promedio (sumaNotas notas) (cuantasNotas notas)) >= 8) && notasMayor4 notas = nombre:buenosAlumnos registro
                                        | otherwise = buenosAlumnos registro

-- EJ 3

mejorPromedio :: [([Char],[Integer])] -> [Char]
mejorPromedio ((nombre,notas):[]) = (nombre)
mejorPromedio ((nombre,notas):(nombre2,notas2):registro) | (promedio (sumaNotas notas) (cuantasNotas notas)) >= (promedio (sumaNotas notas2) (cuantasNotas notas2)) = mejorPromedio ((nombre, notas):registro)
                                                         | otherwise = mejorPromedio ((nombre2,notas2):registro)
-- EJ 4 

pertenece :: [Char] -> [[Char]] -> Bool
pertenece alumno [] = False --nunca estuvo en el registro de buenos Alumnos
pertenece alumno (nombre:registro) | alumno == nombre = True
                                     | otherwise = pertenece alumno registro

seGraduoConHonores :: [([Char],[Integer])] -> Integer -> [Char] -> Bool
seGraduoConHonores registro cantidadDeMaterias alumno =
                                 aproboMasDeNMaterias registro alumno (cantidadDeMaterias-1) && 
                                 pertenece alumno (buenosAlumnos registro) && 
                                 ((promedio (sumaNotas (alumnoIndicado registro alumno)) (cuantasNotas (alumnoIndicado registro alumno))) - (promedio (sumaNotas (alumnoIndicado registro (mejorPromedio registro))) (cuantasNotas (alumnoIndicado registro (mejorPromedio registro))))) <1


