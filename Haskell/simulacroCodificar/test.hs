import SimulacroCod
import Test.HUnit

hayCodificar = runTestTT testhayCodificar 
cuantoCodificar = runTestTT testCuantoCodificar
masCodificar = runTestTT testMasCodificar
codificar = runTestTT testCodificarFrase

testhayCodificar = test[
        "pertenece" ~: hayQueCodificar 's' [('s','i'),('n','o')] ~?= True,
        "no pertenece" ~: hayQueCodificar 'm' [('s','i'),('n','o')] ~?= False
    ]

testCuantoCodificar = test[
        "caso a" ~: cuantasVecesHayQueCodificar 'a' ['h','a','s','t','a'] [('h','a'),('a','s'),('s','t'),('t','a')] ~?= 2,
        "caso h" ~: cuantasVecesHayQueCodificar 'h' ['h','a','s','t','a'] [('h','a'),('a','s'),('s','t'),('t','a')] ~?= 1,
        "caso no hay mapeo" ~: cuantasVecesHayQueCodificar 'a' ['h','a','s','t','a'] [('h','m'),('p','s'),('s','t'),('t','r')] ~?= 0
    ]

testMasCodificar = test[
        "a ganador" ~: laQueMasHayQueCodificar ['h','a','s','t','a'] [('h','a'),('a','s'),('s','t'),('t','a')] ~?= 'a',
        "iguales" ~: laQueMasHayQueCodificar ['f','i','d','e','l'] [('f','i'),('i','d'),('d','e'),('e','l')] ~?= 'f',
        "ivana" ~: laQueMasHayQueCodificar ['i','v','a','n','a'] [('i','v'),('v','a'),('a','n'),('n','a')] ~?= 'a',
        "mamma" ~: laQueMasHayQueCodificar ['m','a','m','m','a'] [('m','a'),('a','m'),('m','m'),('m','a')] ~?= 'm'
    ]


testCodificarFrase = test[
        "ayudad" ~: codificarFrase ['a','y','u','d','a','d'] [('a','x'),('d','e'),('z','a'),('y','m'),('p','q')] ~?= ['x','m','u','e','x','e'],
        "morty" ~: codificarFrase ['m','o','r','t','y'] [('m','p'),('o','z'),('y','i'),('r','m'),('p','q')] ~?= ['p','z','m','t','i']
    ]