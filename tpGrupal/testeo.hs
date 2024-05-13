import CifradoCesar
import Test.HUnit

minuscula = runTestTT testMinuscula
--orden = runTestTT testOrden
--correrNum = runTestTT testDesplazar

testMinuscula = test [
        "d es minuscula" ~: esMinuscula 'd' ~?= True,
        "E NO es minuscula" ~: esMinuscula 'E' ~?= False,
        "9 NO es minuscula" ~: esMinuscula '9' ~?= False,
        "ñ NO incluido" ~: esMinuscula 'ñ' ~?= False,
        "à NO incluido" ~: esMinuscula 'à' ~?= False
   ]
{-
testOrden = test [
        "a es 0" ~: letraANatural 'a' ~?= 0,
        "z es 25" ~: letraANatural 'z' ~?= 25,
        "b es 1" ~: letraANatural 'b' ~?= 1
    ]
-}

--testDesplazar = test [
--        "@ es @" ~: desplazar '@' 3 ~?= '@',
--        "a, n=0 es a" ~: desplazar 'a' 0 ~?= 'a',
--        "c, n=30 es j" ~: desplazar 'c' 30 ~?= 'h', --no?
--        "a, n=-1 es z" ~: desplazar 'a' (-1) ~?= 'z',
--        "a, n= -30 es u" ~: desplazar 'a' (-30) ~?= 'u'
--    ]