absoluto :: Int -> Int
absoluto x | x < 0 = x*(- 1)

maxabs :: Int -> Int -> Int
maxabs n m | n < 0 = n*(- 1)
           | m < 0 = m*(- 1)
           | n > m = n
           | otherwise = m

maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c | a < c && b < c = c
              | b < a && c < a = a
              | c < b && a < b = b

algunoEs0 :: Rational -> Rational -> String
algunoEs0 q w | q == 0 = "si es q"
              | w == 0 = "Si es w"
              | otherwise = "no es nadie"

algunEs0 :: Rational -> Rational -> String
algunEs0 q 0 = "Hay un 0"
algunEs0 0 w = "Hay un 0"
algunEs0 q w = "niguno"

ambosSon0 :: Rational -> Rational -> String
ambosSon0 q w | q == 0 && w == 0 = "Ambos son 0"
              | otherwise = "Alguno no es 0"

ambos0 :: Rational -> Rational -> String
ambos0 0 0 = "Ambos son 0"
ambos0 q w = "Alguno no es 0"


