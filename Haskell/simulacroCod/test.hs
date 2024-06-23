import Solucion
import Test.HUnit

hayCodificar = runTestTT testCodificar
cuantasCodificar = runTestTT testCuantasVecesCodificar
masCodificar = runTestTT testLaQueMasHayQueCodificar
codificar = runTestTT testCodificarFrase
testCodificar = test [
    "hayQueCodificar ListaVacia"  ~: hayQueCodificar 'a' [] ~?= False,
    "hayQueCodificar False mapeo 1 elem" ~: hayQueCodificar 'a' [('b','f')] ~?= False,
    "hayQueCodificar True mapeo 1 elem" ~: hayQueCodificar 'b' [('b','f')] ~?= True,
    "hayQueCodificar False xq está en 2da comp" ~: hayQueCodificar 'z' [('b','f'),('o','n'),('e','z')] ~?= False,
    "hayQueCodificar False mapeo muchos elem" ~: hayQueCodificar 'z' [('b','f'),('o','n'),('e','z')]~?= False,
    "hayQueCodificar True mapeo igual" ~: hayQueCodificar 'e' [('b','f'),('o','n'),('e','e')]~?= True,
    "hayQueCodificar True está en última pos" ~: hayQueCodificar 'e' [('b','f'),('o','n'),('e','z')]~?= True,
    "hayQueCodificar True está en el medio" ~: hayQueCodificar 'o' [('e','f'),('o','n'),('x','z')]~?= True,
    "hayQueCodificar True está en primera pos" ~: hayQueCodificar 'e' [('e','f'),('o','n'),('x','z')]~?= True
    ]
frase_a_probar = "hola mundo"
testCuantasVecesCodificar = test[
        "mapeo vacio" ~: cuantasVecesHayQueCodificar 'a' "hola" [] ~?= 0,
        "mapeo que no pertenece c" ~: cuantasVecesHayQueCodificar 'a' "hola" [('h','s'),('o','a')] ~?= 0,
        "c pertenece al mapeo" ~: cuantasVecesHayQueCodificar 'a' "hola" [('h','s'),('o','a'),('a','z')] ~?= 1,
        "c mas de 1 vez" ~: cuantasVecesHayQueCodificar 'a' "holaaa" [('h','s'),('a','z'),('o','a')] ~?= 3,
        "cuantasVecesHayQueCodificar mapeoVacio" ~: cuantasVecesHayQueCodificar 'm' frase_a_probar [] ~?= 0,
        "cuantasVecesHayQueCodificar 0 con mapeoUnElem" ~: cuantasVecesHayQueCodificar 'm' frase_a_probar [('c','k')] ~?= 0,
        "cuantasVecesHayQueCodificar 0 con mapeoVariosElem" ~: cuantasVecesHayQueCodificar 'm' frase_a_probar [('c','k'),('a','b'),('x','z')] ~?= 0,
        "cuantasVecesHayQueCodificar 1 con mapeoVariosElem" ~: cuantasVecesHayQueCodificar 'm' frase_a_probar [('m','n'),('z','a'),('b','j')] ~?= 1,
        "cuantasVecesHayQueCodificar 1 con mapeoVariosElemAlFinal" ~: cuantasVecesHayQueCodificar 'm' frase_a_probar [('b','n'),('z','a'),('m','j')] ~?= 1,
        "cuantasVecesHayQueCodificar 1 con mapeoConUnElemento" ~: cuantasVecesHayQueCodificar 'm' frase_a_probar [('m','n')] ~?= 1,
        "cuantasVecesHayQueCodificar fraseSoloConRepetidos" ~: cuantasVecesHayQueCodificar 'a' "aaa" [('a','r')] ~?= 3,
        "cuantasVecesHayQueCodificar >1 con mapeoUnElem" ~: cuantasVecesHayQueCodificar 'o' frase_a_probar [('o','r')] ~?= 2,
        "cuantasVecesHayQueCodificar >1 con mapeoVariosElem" ~: cuantasVecesHayQueCodificar 'o' frase_a_probar [('p','k'),('o','r')] ~?= 2
    ]

mapeo_a_probar = [('a','g'), ('o','a'), ('s','z')]

testLaQueMasHayQueCodificar = test[
        "solo un c" ~: laQueMasHayQueCodificar "hola" [('z','s'),('h','l'),('m','a')] ~?= 'h',
        "mas de un c pero misma cantidad" ~: laQueMasHayQueCodificar frase_a_probar [('z','s'),('h','l'),('m','a')] ~?= 'h',
        "mas de un c y uno mas cantidad" ~: laQueMasHayQueCodificar frase_a_probar [('z','s'),('h','l'),('m','a'),('o','a')] ~?= 'o',
        "laQueMasHayQueCodificar stringDeUnChar" ~: laQueMasHayQueCodificar "a" mapeo_a_probar ~?= 'a',
        "laQueMasHayQueCodificar stringDeUnCharRepetido" ~: laQueMasHayQueCodificar "sssss" mapeo_a_probar ~?= 's',
        "laQueMasHayQueCodificar unaLetrasVariasApariciones" ~: laQueMasHayQueCodificar "casa" mapeo_a_probar ~?= 'a',
        "laQueMasHayQueCodificar variasAparicionesDosLetrasGana1ra" ~: laQueMasHayQueCodificar "cosos" mapeo_a_probar ~?= 'o',
        "laQueMasHayQueCodificar variasAparicionesDosLetrasGana2da" ~: laQueMasHayQueCodificar "cososs" mapeo_a_probar ~?= 's',
        "laQueMasHayQueCodificar variasAparicionesTresLetrasGana3ra" ~: laQueMasHayQueCodificar "cocosss" mapeo_a_probar ~?= 's',
        "laQueMasHayQueCodificar fraseSoloConLetrasDiferentes" ~: laQueMasHayQueCodificar "aos" mapeo_a_probar ~?= 'a',
        "laQueMasHayQueCodificar laMasFrecuenteNoSeMapea" ~: laQueMasHayQueCodificar "ttcotsottstst" mapeo_a_probar ~?= 's'
    ]

frase6 = "un gran poder blabla"

testCodificarFrase = test[
        "hola a lola" ~: codificarFrase "hola" [('z','s'),('h','l'),('m','a')] ~?= "lola",
        "h a l" ~: cambiarChar 'h' [('z','s'),('h','l'),('m','a')] ~?= 'l',
        "hola a hola" ~: codificarFrase "hola" [('z','s'),('n','l'),('m','a')] ~?= "hola",
        "mapeo vacio" ~: codificarFrase frase_a_probar [] ~?= frase_a_probar,
        "misma letra cambiada" ~: codificarFrase "nnnn" [('z','s'),('n','l'),('m','a')] ~?= "llll",
        "palabra cambiada" ~: codificarFrase "Hola" [('o','l'),('a','n'),('H','r'),('l','M')] ~?= "rlMn",
        "codificarFrase fraseLarga mapeoVacio" ~: codificarFrase frase6 [] ~?= frase6,
        "codificarFrase fraseLarga nadaMapeable" ~: codificarFrase frase6 [('z','p'), ('x','q')] ~?= frase6,
        "codificarFrase fraseLarga mapeaEspacios" ~: codificarFrase frase6 [(' ','*'), ('x','q')] ~?= "un*gran*poder*blabla",
        "codificarFrase fraseMuyCorta unMapeo" ~: codificarFrase "a" [('a','g')] ~?= "g",
        "codificarFrase fraseUnChar unMapeo" ~: codificarFrase "aaaa" [('a','g')] ~?= "gggg",
        "codificarFrase todoSeMapea" ~: codificarFrase "caba" [('a','g'),('c','d'),('b','x'),('z','y')] ~?= "dgxg",
        "codificarFrase soloMapeoUltimaLetra" ~: codificarFrase "el bebes" [('s','z')] ~?= "el bebez",
        "codificarFrase soloMapeoPrimeraLetra" ~: codificarFrase "sel bebe" [('s','z')] ~?= "zel bebe"
    ]