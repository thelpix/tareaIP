import ParcialTN
import Test.HUnit

nMaterias = runTestTT testnMaterias
buenAlumno = runTestTT testBuenosAlumnos

promedioMejor = runTestTT testMejorPromedio

conHonores = runTestTT testGraduadoHonores

testnMaterias = test[
        "Ivan si" ~: aproboMasDeNMaterias[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7])] "Ivan" 3 ~?= True,
        "lista de Ivan" ~: notasAlumno "Ivan" [("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7])] ~?= [1,7,9,5,3,8],
        "Ivan no" ~: aproboMasDeNMaterias[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7])] "Ivan" 4 ~?= False,
        "Rocio si" ~: aproboMasDeNMaterias[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7])] "Rocio" 5 ~?= True,
        "Fidel no" ~: aproboMasDeNMaterias[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7])] "Fidel" 3 ~?= False,
        "Vacio" ~: aproboMasDeNMaterias[] "Ivan" 3 ~?= False
    ]

testBuenosAlumnos = test[
        "Devolver Porras y Rocio" ~: buenosAlumnos[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7]),("Porras",[8,9,7,9,9,10,7])] ~?= ["Rocio", "Porras"],
        "Vacio" ~: buenosAlumnos[] ~?= [],
        "Rocio" ~: buenosAlumnos[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7])] ~?= ["Rocio"],
        "Porras" ~: buenosAlumnos[("Ivan",[1,7,9,5,3,8]),("Fidel",[1,2,4,5,7]),("Porras",[8,9,7,9,9,10,7])] ~?= ["Porras"],
        "Ninguno" ~: buenosAlumnos[("Ivan",[1,7,9,5,3,8]),("Fidel",[1,2,4,5,7])] ~?= [],
        "Promedio Rocio" ~: promedioNotas 6 51 ~?= 8.50
    ]

testMejorPromedio = test[
        "Rocio" ~: mejorPromedio[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7]),("Porras",[8,9,7,9,9,10,7])] ~?= "Rocio",
        "porras" ~: mejorPromedio[("Ivan",[1,7,1,1,1,1]),("Rocio",[1,1,1,1,2]),("Fidel",[1,1,1,5,1]),("Porras",[1,1,1,1,3,3,10])] ~?= "Porras"
    ]

testGraduadoHonores = test[
        "Rocio obvio" ~: seGraduoConHonores[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10,10]),("Fidel",[1,2,4,5,7]),("Porras",[8,9,7,9,9,10,7])] 7 "Rocio" ~?= True,
        "Porras obvio" ~: seGraduoConHonores[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10,10]),("Fidel",[1,2,4,5,7]),("Porras",[8,9,7,9,9,10,7])] 7 "Porras" ~?= True,
        "Porras si" ~: seGraduoConHonores[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7]),("Porras",[8,9,7,9,9,10,7])] 6 "Porras"  ~?= True,
        "Fidel no" ~: seGraduoConHonores[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7]),("Porras",[8,9,7,9,9,10,7])] 6 "Fidel" ~?= False,
        "Ivan no" ~: seGraduoConHonores[("Ivan",[1,7,9,5,3,8]),("Rocio",[10,9,7,8,7,10]),("Fidel",[1,2,4,5,7]),("Porras",[8,9,7,9,9,10,7])] 6 "Ivan" ~?= False
    ]