import Simulacro
import Test.HUnit

votosPorcentaje = runTestTT testVotosPorcentaje
invalidaFormula = runTestTT testInvalidaFormula
viceVotos = runTestTT testViceVotos
menosVotos = runTestTT testMenosVotado

testVotosPorcentaje =  test[
        "caso 1" ~: porcentajeDeVotosAfirmativos[("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] [34, 56] 90 ~?= 100,
        "caso 2" ~: porcentajeDeVotosAfirmativos[("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] [34, 56] 135 ~?= 66.66667,
        "caso 3" ~: porcentajeDeVotosAfirmativos[("Ivan","Porras")] [10] 100 ~?= 10,
        "caso sin votos" ~: porcentajeDeVotosAfirmativos[("Fidel","Valen")] [0] 100 ~?= 0
    ]

testInvalidaFormula = test[
        "caso 1" ~: formulasInvalidas[("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] ~?= False,
        "caso 2" ~: formulasInvalidas[("Juan Pérez","Susana García"), ("María Montero","Juan Pérez"),("Ivan","Porras")] ~?= True,
        "caso vacio" ~: formulasInvalidas[] ~?= False,
        "caso repetido" ~: formulasInvalidas[("Juan Pérez","Susana García"), ("María Montero","María Montero"),("Ivan","Porras")] ~?= True,
        "caso 3" ~: formulasInvalidas[("Juan Pérez","Susana García"), ("Juan Pérez","a"),("Ivan","Porras")] ~?= True
    ]

testViceVotos = test[
        "caso 1" ~: porcentajeDeVotos "Ezequiel" [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno"),("Ivan","Ezequiel")] [0,0,10] ~?= 100,
        "caso 2" ~: porcentajeDeVotos "Susana García" [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] [50,50] ~?= 50,
        "caso 3" ~: porcentajeDeVotos "Pablo Moreno" [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno"),("Ivan","Ezequiel")] [10,35,20] ~?= 53.846157,
        "caso 4" ~: porcentajeDeVotos "Susana García" [("Juan Pérez","Susana García")] [10] ~?= 100
    ]

testMenosVotado = test[
        "caso 1" ~: menosVotado[("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno"),("Ivan","Ezequiel")] [10,35,20] ~?= "Juan Pérez",
        "caso 2" ~: menosVotado[("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno"),("Ivan","Ezequiel")] [50,20,30] ~?= "María Montero",
        "caso 3" ~: menosVotado[("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno"),("Ivan","Ezequiel")] [50,40,30] ~?= "Ivan",
        "caso mitad" ~: menosVotado[("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] [23,23] ~?= "María Montero"
    ]