factorial :: Integer -> Integer 
factorial a 
    | a == 0 = 1
    | a == 1 = 1
    | a > 0 = a * factorial(a - 1)
    
--ej 1
fibonacci :: Integer -> Integer
fibonacci a 
    | a == 0 = 0
    | a == 1 = 1
    | otherwise = fibonacci(a - 1) + fibonacci(a - 2)

--ej 2
parteEntera :: Float -> Integer
parteEntera x
    | x < 1 && x >= 0 = 0
    | x >= 1 = 1 + parteEntera(x-1)
    | otherwise = (-1) + parteEntera(x+1)

--ej 3
esDivisible :: Integer -> Integer -> Bool
esDivisible x y | x >= 0 && x == y = True
                | x > 0 && x < y = False
                | x >= 0 && x > y = esDivisible (x - y) y
                | x == 0 && x < y = True

--ej 4

sumaImpares :: Integer -> Integer 
sumaImpares n | n> 0 = (2*n -1) + sumaImpares(n-1)
              | otherwise = n
    
--ej 5 

medioFact :: Integer -> Integer 
medioFact n | n == 0 = 1
            | n > 0 = abs (n * medioFact(n+(-2)))
            | otherwise = n

--ej 6

sumaDigitos :: Integer -> Integer
sumaDigitos x | x < 10 = x
              | otherwise = mod x 10 + sumaDigitos(div x 10)

--ej 7 PROFE PRO

ultimoDigito :: Int -> Int
ultimoDigito x = mod x 10

sacarUltimoDigito :: Int -> Int
sacarUltimoDigito x = div x 10

--Si en 101, ultimoDigito = 1, 1!= mod(10) 10 == 0 = FALSO ENTIENDES
--Otherwise repite lo anterior pero en el ultimo valor :)
todosDigitosIguales :: Int -> Bool
todosDigitosIguales x | x < 10 = True
                      | ultimoDigito x /= ultimoDigito(sacarUltimoDigito(x)) = False
                      | otherwise = todosDigitosIguales(sacarUltimoDigito(x))