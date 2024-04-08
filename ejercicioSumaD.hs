sumaDist :: Int -> Int -> Int -> Int
sumaDist x y z | x == y && x/= z = x+z
               | y == z && y/= x = y+x
               | z == x && z/= y = y+z
               | x == y && x == z = 0
               | otherwise = x + y + z