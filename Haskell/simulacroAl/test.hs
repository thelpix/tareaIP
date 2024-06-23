import Solucion
import Test.HUnit

aproboMaterias = runTestTT testAproboNMaterias
buenAlumno = runTestTT testBuenosAlumnos
mejorAlumno = runTestTT testMejorPromedio


testAproboNMaterias = test[
        "ivan true" ~: aproboMasDeNMaterias[("fidel",[1,2,3,4,5,6]),("ivan",[1,2,5,7,6,5])] "ivan" 3 ~?= True,
        "fidel false" ~: aproboMasDeNMaterias[("fidel",[1,2,3,4,5,6,1]),("ivan",[1,2,5,7,6,5])] "fidel" 3 ~?= False,
        "Ivan no llego" ~: aproboMasDeNMaterias[("fidel",[1,2,3,4,5,6,1]),("ivan",[1,2,5,7,6,5])] "ivan" 4 ~?= False
    ]

testBuenosAlumnos = test[
        "solo porras" ~: buenosAlumnos[("ivan",[1,2,5,7,6,5]),("fidel",[1,2,3,4,5,6]),("Porras",[8,9,6,8,9,10,10,10])] ~?= ["Porras"],
        "solo porras sin aplazo" ~: sinAplazos[8,9,6,8,9,10,10,10] ~?= True,
        "solo porras promedio" ~: promedioNotas 70 8 ~?= 8.75,
        "nadie" ~: buenosAlumnos[("ivan",[1,2,5,7,6,5]),("fidel",[1,2,3,4,5,6]),("Porras",[6,6,6,8,9,6,6,6])] ~?= [],
        "todos con aplazo" ~: buenosAlumnos[("ivan",[1,2,5,7,6,5]),("fidel",[1,2,3,4,5,6]),("Porras",[6,6,6,8,9,6,1,6])] ~?= [],
        "todos sin ser pro" ~: buenosAlumnos[("ivan",[4,4,5,7,6,5]),("fidel",[4,5,4,4,5,6]),("Porras",[6,6,6,8,9,6,4,6])] ~?= [],
        "sin notas" ~: buenosAlumnos[("ivan",[]),("fidel",[]),("Porras",[])] ~?= [],
        "todos pro" ~: buenosAlumnos[("ivan",[9,9,9,9,5]),("fidel",[10,5,10,10,10,6]),("Porras",[10,10,10,8,9,6,10,6])] ~?= ["ivan","fidel","Porras"]
    ]

testMejorPromedio = test[
        "porras ganador" ~: mejorPromedio[("ivan",[1,2,5,7,6,5]),("fidel",[1,2,3,4,5,6]),("Porras",[8,9,6,8,9,10,10,10])] ~?= "Porras",
        "fidel" ~: mejorPromedio[("ivan",[9,9,9,9,5]),("fidel",[10,5,10,10,10,6]),("Porras",[7,9,7,6,5,6,4,6])] ~?= "fidel"
    ]

