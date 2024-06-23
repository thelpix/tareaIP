import Solucion
import Test.HUnit

divisores = runTestTT testDivisoresPropios
amigos = runTestTT testSonAmigos

perfectos = runTestTT testNPerfectos
listaAmigos = runTestTT testListaDeAmigos
testDivisoresPropios = test[
        "n 1" ~: divisoresPropios 1 ~?= [1],
        "n 2" ~: divisoresPropios 2 ~?= [1],
        "n 4" ~: divisoresPropios 4 ~?= [1,2],
        "n 12" ~: divisoresPropios 12 ~?= [1,2,6],
        "n 6" ~: divisoresPropios 6 ~?= [1,2,3]
    ]

testSonAmigos = test[
        "220 y 284" ~: sonAmigos 220 284 ~?= True,
        "1184 y 1210" ~: sonAmigos 1184 1210 ~?= True,
        "10 y 5" ~: sonAmigos 10 5 ~?= False,
        "1 y 2" ~: sonAmigos 1 2 ~?= False,
        "5020 5564" ~: sonAmigos 5020 5564 ~?= True
    ]

testNPerfectos = test[
        "solo 1" ~: losPrimerosNPerfectos 1 ~?= [1],
        "2 perfectos" ~: losPrimerosNPerfectos 2 ~?= [1,6],
        "3 perfectos" ~: losPrimerosNPerfectos 3 ~?= [1,6,28],
        "4 perfectps" ~: losPrimerosNPerfectos 4 ~?= [1,6,28, 496]
    ]

testListaDeAmigos = test[
        "muchos amigos" ~: listaDeAmigos[1,6368, 284,2,1184,1210,3,220,2620,2924,4,5020,5564,5,6232] ~?= [(6368,6232),(284,220),(1184,1210),(2620,2924),(5020,5564)],
        "pocos amigos" ~: listaDeAmigos[6368,284,220,6232,1184] ~?= [(6368,6232),(284,220)]
    ]