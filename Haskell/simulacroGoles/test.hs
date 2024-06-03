import Simulacro
import Test.HUnit

golSuplente = runTestTT testAtajoSuplente
equipoVal = runTestTT testEquiposValidos

porcentaje = runTestTT testPorcentajes

valla = runTestTT testVallaMenos

testAtajoSuplente = test [
        "todosTitular" ~: atajaronSuplentes [] [3,5,9] 17 ~?= 0,
        "todosSuplentes" ~: atajaronSuplentes [] [0,0,0] 17 ~?= 17,
        "mixto" ~: atajaronSuplentes [] [1,5,2] 17 ~?= 9,
        "golesTitulares" ~: golesTitular [3,5,9] ~?= 17
    ]

testEquiposValidos = test[
        "no repetidos" ~: equiposValidos [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel")] ~?= True,
        "club repetido" ~: equiposValidos [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel"), ("Fenix", "Lucio")] ~?= False,
        "arquero repetido" ~: equiposValidos [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel"), ("Tigre", "Nahuel Galardi")] ~?= False,
        "arquero nombre de club" ~: equiposValidos [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel"), ("Tigre", "Buenos Aires")] ~?= False,
        "iguales" ~: equiposValidos [("Sacachispas", "Sacachispas"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel")] ~?= False
    ]

testPorcentajes = test[
        "gabriel" ~: porcentajeDeGoles "Gabriel" [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel")] [1,5,3] ~?= 33.333336,
        "nadie" ~: porcentajeDeGoles "Nadie" [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel")] [1,5,3] ~?= 0
    ]

testVallaMenos = test[
        "menor Neyder" ~:vallaMenosVencida [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi"), ("Buenos Aires", "Gabriel")] [1,5,3] ~?= "Neyder Aragon"
    ]