estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b | a /= 0 && rem a b == 0 && a*a+b*a*(-a) `div` b == 0 = True
                      | otherwise = False


--- PODES USAR MULTIPLO PORQUE SI FACTORIZAS, SALE QUE ESTA RELACIONADO CON A, A RELACIONADO CON B, SI ES MULTIPLO DE A
