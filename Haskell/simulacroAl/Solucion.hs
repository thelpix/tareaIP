module Solucion where

mayorA4 :: [Int] -> Int
mayorA4 [] = 0
mayorA4 (x:xs) | x>=4 = 1 + mayorA4 xs
               | otherwise = mayorA4 xs

aproboMasDeNMaterias :: [(String, [Int])] -> String -> Int -> Bool --ej: [("ivan",[1,2,5,7,6,5]),("fidel",[1,2,3,4,5,6])] ivan 3 = true
aproboMasDeNMaterias (x:xs) alumno n | alumno == fst x = mayorA4 (snd x) > n
                                     | otherwise = aproboMasDeNMaterias xs alumno n

---EJ 2
sinAplazos :: [Int] -> Bool
sinAplazos [] = True
sinAplazos (x:xs) | x >= 4 = sinAplazos xs
                  | otherwise = False

sumaNotasTotal :: [Int] -> Int
sumaNotasTotal [] = 0
sumaNotasTotal (x:xs) = x + sumaNotasTotal xs

longitud :: [Int] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

promedioNotas :: Int -> Int -> Float
promedioNotas n m = (fromIntegral n) / (fromIntegral m)

buenosAlumnos :: [(String, [Int])] -> [String] --ej: [("ivan",[1,2,5,7,6,5]),("fidel",[1,2,3,4,5,6]),("Porras",[8,9,6,8,9,10,10,10])] = ["Porras"]
buenosAlumnos [] = []
buenosAlumnos (x:xs) | sinAplazos (snd x) && (promedioNotas (sumaNotasTotal (snd x)) (longitud (snd x)) >= 8) = fst x : buenosAlumnos xs
                     | otherwise = buenosAlumnos xs

--EJ 3

mejorPromedio :: [(String, [Int])] -> String
mejorPromedio (x:[]) = fst x
mejorPromedio (x:y:xs) | promedioNotas (sumaNotasTotal (snd x)) (longitud (snd x)) >= promedioNotas(sumaNotasTotal(snd y)) (longitud (snd y)) = mejorPromedio (x:xs)
                       | otherwise = mejorPromedio (y:xs)

--EJ 4

