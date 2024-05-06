import Practica4
import Test.HUnit

testFibo = test [
        "Caso Base 1: fibonacci 0" ~: fibonacci 0 ~?= 0, -- nombre caso base y luego el test (fib 0), y valor debe ser 0.
        "Caso Base 2: fibonacci 1" ~: fibonacci 1 ~?= 1,
        "Caso Recursivo: fibonacci 2" ~: fibonacci 2 ~?= 1
        ]