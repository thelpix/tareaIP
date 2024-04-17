sumaDist :: Int -> Int -> Int -> Int
sumaDist x y z | x == y && x/= z = x+z
               | y == z && y/= x = y+x
               | z == x && z/= y = y+z
               | x == y && x == z = 0
               | otherwise = x + y + z

esMultiploDe :: Int -> Int -> String
esMultiploDe x y | rem x y == 0 = "Es multiplo"
                 | otherwise = "No son multiplos"

digitoUnidades :: Int -> Int
digitoUnidades x = abs x `mod` 10

digitoDecenas :: Int -> Int
digitoDecenas x | abs x < 10 = 0
                | otherwise = (abs x `div` 10) `mod` 10

