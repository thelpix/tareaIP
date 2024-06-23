import Solucion
import Test.HUnit

stock = runTestTT testGenerarStock
stockProducto = runTestTT testStockDeProducto
dinero = runTestTT testDineroEnStock
oferta = runTestTT testAplicarOferta
testGenerarStock = test[
        "cuenta total" ~: generarStock["Jorgito","Sara","Don Satur","Bagley","Jorgito","Don Satur", "Don Satur", "Don Satur", "Melisa"] ~?= [("Jorgito",2),("Sara",1),("Don Satur",4),("Bagley",1),("Melisa",1)],
        "vacio" ~: generarStock[] ~?= [],
        "solo 1" ~: generarStock["Jorgito"] ~?= [("Jorgito", 1)],
        "3 jorgitos" ~: generarStock["Jorgito","Jorgito","Jorgito"] ~?= [("Jorgito",3)]
    ]

testStockDeProducto = test[
        "jorgito" ~: stockDeProducto[("Jorgito",2),("Sara",1),("Don Satur",4),("Bagley",1),("Melisa",1)] "Jorgito" ~?= 2,
        "Don satur" ~: stockDeProducto[("Jorgito",2),("Sara",1),("Don Satur",4),("Bagley",1),("Melisa",1)] "Don Satur" ~?= 4,
        "vacio" ~: stockDeProducto[] "Melisa" ~?= 0,
        "vacio con palabras" ~: stockDeProducto[("Bagley",1)] "Melisa" ~?= 0
    ]

testDineroEnStock = test [
  "EJ3 dinero con stock y precios vacíos" ~: dineroEnStock [] [] ~?= 0,
  "EJ3 dinero en stock del stock vacío " ~: dineroEnStock [] [("mesa", 10.2),("silla",9.5),("computadora",8.1)] ~?= 0,
  "EJ3 dinero en stock con 1 producto stock 1" ~: dineroEnStock [("silla", 1)] [("silla",11.2)] ~?= 11.2,
  "EJ3 dinero en stock con 1 producto stock 3" ~: dineroEnStock [("silla", 3)] [("silla",11.2)] ~?= 3*11.2,
  "EJ3 dinero con stock limitado igual" ~: dineroEnStock [("mesa", 3),("computadora", 3)] [("mesa", 10.5),("silla",22.2),("computadora",50.5)] ~?= (10.5*3 + 50.5*3),
  "EJ3 dinero con stock limitado distinto" ~: dineroEnStock [("mesa", 2),("computadora",1)] [("mesa", 10.5),("silla",22.2),("computadora",50.5)] ~?= (10.5*2 + 50.5*1),
  "EJ3 dinero con stock completo" ~: dineroEnStock [("mesa", 2),("silla",3),("computadora",1)] [("mesa", 10.5),("silla",22.2),("computadora",50.5)] ~?= (10.5*2 + 22.2*3 + 50.5*1),
  "EJ3 dinero en stock con 1 producto stock 3, precio entero y stock distinto" ~: dineroEnStock [("silla", 3)] [("silla",21), ("cama", 15)] ~?= 3*21,
  "EJ3 dinero con stock distinto ++" ~: dineroEnStock [("mesa", 2),("silla",3),("computadora",1), ("mueble",8)] [("mesa", 10.5),("silla",22.2),("computadora",50.5), ("mueble", 1), ("buque", 100)] ~?= (10.5*2 + 22.2*3 + 50.5*1 + 8*1)
  ]

testAplicarOferta = test [
  "EJ4 aplicar ofertas sobre precios vacíos" ~:  aplicarOferta [] [] ~?= [],
  "EJ4 aplicar ofertas sin stock" ~:   aplicarOferta [] [("mesa", 10.5),("silla",22.2),("computadora",50.5)]
                                                                     ~?= [("mesa", 10.5),("silla",22.2),("computadora",50.5)],
  "EJ4 aplicar ofertas modifica los precios correctos" ~:   aplicarOferta [("mesa", 12),("computadora",10)] [("mesa", 10.5),("silla",22.2),("computadora",50.5)]
                                                                     ~?= [("mesa", 10.5*0.8),("silla",22.2),("computadora",50.5)],
  "EJ4 aplicar ofertas modifica todos los precios" ~:   aplicarOferta [("mesa", 11),("silla",11),("computadora",11)] [("mesa", 10.5),("silla",22.2),("computadora",50.5)]
                                                                     ~?= [("mesa", 10.5*0.8),("silla",22.2*0.8),("computadora",50.5*0.8)],
  "EJ4 aplicar ofertas no modifica ningún precio" ~:   aplicarOferta [("mesa", 9),("silla",10),("computadora",2)] [("mesa", 10.5),("silla",22.2),("computadora",50.5)]
                                                                     ~?= [("mesa", 10.5),("silla",22.2),("computadora",50.5)],
  "EJ4 aplicar ofertas sobre un precio no modifica" ~:   aplicarOferta [("mesa", 9)] [("mesa", 10.5)]
                                                                                   ~?= [("mesa", 10.5)],
  "EJ4 aplicar ofertas sobre un precio debe modificar" ~:   aplicarOferta [("mesa", 20)] [("mesa", 10.5)]
                                                                                   ~?= [("mesa", 10.5*0.8)]
  ]