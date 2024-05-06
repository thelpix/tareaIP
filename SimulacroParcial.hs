import Simulacro
import Test.HUnit


relVal = runTestTT testRelVal
personas = runTestTT testPersonas
amigos = runTestTT testAmigosDe

masAmigos = runTestTT testMasAmigos

testRelVal = test [
        "tupla mismo elemento" ~: relacionesValidas[("diana", "diana")] ~?= False,
        "tupla igual a otra tupla" ~: relacionesValidas[("pepe","maria"), ("pepe","maria")] ~?= False,
        "tupla inversa igual a otra tupla" ~: relacionesValidas[("pepe","maria"), ("maria","pepe")] ~?= False,
        "tupla diferente" ~: relacionesValidas[("juana","pablo"),("maria","pepe")] ~?= True
    ]

testPersonas = test [
        "Borrar Repetidos" ~: personasLista[("pepe","maria"),("juana", "pablo"),("diana","melisa"), ("pepe", "juana")] ~?= ["maria", "pablo", "diana", "melisa", "pepe","juana"],
        "lista vacia" ~: personasLista[] ~?= [],
        "elementos juntados" ~: juntarlos[("pepe","maria"),("juana", "pablo"),("diana","melisa"), ("pepe", "juana")] ~?= ["pepe", "maria", "juana", "pablo", "diana", "melisa", "pepe","juana"]
    ]

testAmigosDe = test [
        "amigos de pepe" ~: amigosDe "pepe" [("pepe","maria"),("juana", "pablo"),("diana","melisa"), ("juana", "pepe")] ~?= ["maria","juana"],
        "pepe sin amigos" ~: amigosDe "maria" [("pepe","maria"),("juana", "pablo"),("diana","melisa"), ("juana", "pepe")] ~?= ["pepe"]
    ]

testMasAmigos = test [
        "juana mas amigos" ~: personaConMasAmigos[("pepe","maria"),("juana", "pablo"),("diana","melisa"), ("pepe", "juana")] ~?= "juana",
        "juana amigos" ~: listaLongitud["pablo", "pepe"] ~?= 2,
        "pepe amigos" ~: listaLongitud["maria", "juana"] ~?= 2
    ]