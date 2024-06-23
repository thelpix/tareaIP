import Solucion
import Test.HUnit

nEsima = runTestTT testNEsimaPosicion
mezcl = runTestTT testMezclar

testNEsimaPosicion :: Test
testNEsimaPosicion = test[
        "ejemplo con 1" ~: ind_nesima_aparicion[-1, 1, 1, 5, -7, 1, 3] 2 1 ~?= 2,
        "vacio" ~: ind_nesima_aparicion[] 2 9 ~?= -1,
        "insuficiente" ~: ind_nesima_aparicion[1, 2, 3, 4, 5] 2 6 ~?= -1,
        "ejemplo con 2" ~: ind_nesima_aparicion[2, 2, 3, 2, 3, 2, 2] 5 2 ~?= 6
    ]

testMezclar = test[
        "1er ej:" ~: mezclar[1, 3, 0, 1] [4, 0, 2, 3] ~?= [1, 4, 3, 0, 0, 2, 1, 3],
        "vacio" ~: mezclar[] [] ~?= [],
        "todo igual" ~: mezclar[1,0] [0,1] ~?= [1,0,0,1],
        "posta" ~: mezclar[1] [2] ~?= [1,2]
    ]