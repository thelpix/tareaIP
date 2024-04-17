doubleMe :: Int -> Int
doubleMe x = x+x

f :: Int -> Int
f n | n == 1 = 8
            | n == 4 = 131
            | n == 16 = 16

g :: Int -> Int
g m         | m == 8 = 16
            | m == 16 = 4
            | m == 131 = 1 

h :: Int -> Int
h x = f(g(x))

k :: Int -> Int
k y = g(f(y))

