import math
import random

#ej 1
def imprimir_hola_mundo():
    print("Hola Mundo");

#ej 2
def imprimir_un_verso():
    print("Hon'\nPlease forgive me if I ever did you wrong\nI'll be your candle; burn me upside down\nFrom now on, I won't sleep on my arms")

#ej 3
def raizDe2():
    res = round(math.sqrt(2), 4)
    return res

#ej 4
def factoria_2() -> int:
    res = math.factorial(2)
    return res

#ej5
def perimetro() -> float:
    res = 2*math.pi
    return res

#ej 6
def imprimir_saludo(nombre: str):
    print("Hola",nombre)

#ej 7
def raiz_cuadrada_de(numero: int):
    res = math.sqrt(numero)
    return res

#ej 8
def fahrenheit_a_celsius(t: float) -> float:
    res = (t - 32) / 1.8
    return res

#ej 9
def imprimir_dos_veces(estribillo: str):
    res :str = (estribillo+"\n")*2
    return res

#ej 10
def es_multiplo_de(n: int, m: int) -> bool:
    res : bool
    while n >= m:
        n -= m
    if n == 0:
        res = True
    else:
        res = False
    return res
    #para comprobar si es multiplo, puedes sacar el resto de n-m y si da 0 es multiplo

#ej 11
def es_par(numero: int) -> bool:
    res : bool = False
    if es_multiplo_de(numero, 2):
        res = True
    return res

#ej 12
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    porciones_totales = comensales * min_cant_de_porciones
    res : int = 1
    if porciones_totales == 0:
        res = 0
    while porciones_totales >= 8:
        porciones_totales -= 8
        res += 1
    return res

#ej 13-14
def alguno_es_0(numero1: float, numero2: float):
    return numero1 == 0 or numero2 == 0 #puedes asignarle un argumento al return
def ambos_son_0(numero1: float, numero2: float):
    return numero1 == 0 and numero2 == 0

#ej 15
def es_nombre_largo(nombre: str) -> bool:
    return len(nombre) <= 8 and len(nombre) >= 3

#ej 16
def es_bisiesto(año: int) -> bool:
    return (año % 400 == 0) or ((año % 4 == 0) and not (año % 100 == 0))

#ej 17
def peso_pino(altura_pino:int) -> int:
    if altura_pino <= 3:
        res = 3*(altura_pino*100)
    else:
        altura_pino -= 3
        res = 900 + (altura_pino*100)*2
    return res

def es_peso_util(peso_pino: int) -> bool:
    return 400 <= peso_pino <= 1000

def sirve_pino(altura_pino: int) -> bool:
    return es_peso_util(peso_pino(altura_pino))

def todos_los_pinos(todos_pinos: list[int]) -> list[bool]: #de una lista de pinos devuelve los que son validos y no
    res : list[bool] = []
    for i in range(len(todos_pinos)):
        res.append(sirve_pino(todos_pinos[i]))
    return res

#ej 18
def devolver_el_doble_si_es_par(numero: int) -> int:
    res : int = 0
    if numero % 2 == 0:
        res = numero*2
    else:
        res = numero
    return res

#ej 19
def devolver_el_valor_si_es_par_sino_el_que_sigue_v1(numero: int) -> int:
    res : int = 0
    if numero % 2 == 0:
        res = numero
    else:
        res = (numero+1)
    return res
def devolver_el_valor_si_es_par_sino_el_que_sigue_v2(numero: int) -> int:
    res : int = 0
    if numero % 2 == 0:
        res = numero
    if not (numero % 2 == 0):
        res = (numero+1)
    return res
##funcionan iguales
#ej 20
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_v1(numero: int) -> int: ##if-then-else
    if es_multiplo_de(numero, 9):
        return 3*numero
    elif es_multiplo_de(numero, 3):
        return 2*numero
    else:
        return numero
    
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_v2(numero: int) -> int: ##2 if
    if es_multiplo_de(numero, 9):
        return 3*numero
    if es_multiplo_de(numero, 3):
        return 2*numero
    else:
        return numero

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9_v3(numero: int) -> int: ##con operacion logica
    if es_multiplo_de(numero, 3) and not es_multiplo_de(numero, 9):
        return 2*numero
    elif es_multiplo_de(numero, 9):
        return 3*numero
    return numero

#ej 21
def lindo_nombre(nombre: str) -> str:
    if len(nombre) >= 5:
        return "Tu nombre tiene muchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"

#ej 22
def elRango(numero:int) -> str:
    if numero < 5:
        print("Menor a 5")
    if 10<= numero <= 20:
        print("Entre 10 y 20")
    if numero > 20:
        print("Mayor a 20")

def trabajas_o_no(sexo: str, edad: int) -> str:
    if (sexo == "F" and 18<= edad <60) or (sexo == "M" and 18<= edad < 65):
        print("Te toca trabajar")
    else:
        print("Andad de vacaciones")

#ej 23
def imprimir_1_al_10() -> str:
    i = 1
    while i <= 10:
        print(i)
        i += 1

#ej 24
def imprimir_pares_10_al_40() -> str:
    i = 10
    while i <= 40:
        if (es_multiplo_de(i, 2)):
            print(i)
        i += 1

#ej 25
def eco_10_veces() -> str:
    i = 1
    while i <= 10:
        print("eco")
        i += 1
#ej 26
def despegue(numero: int) -> str:
    while numero >= 1:
        print(numero)
        numero -= 1
    print("Despegue")

#ej 27
def viaje_en_el_tiempo(año_partida :int, año_llegada: int) -> str:
    while año_partida > año_llegada:
        año_partida -= 1
        print("Viajo un anio al pasado, estamos en el anio:",año_partida)
#ej 28
def viaje_hasta_aristoteles(año_partida: int) -> str:
    while año_partida >= -384 and (año_partida-20) > -384:
        año_partida -= 20
        if año_partida < 0:
            print("Viajo 20 anios al pasado, estamos en el anio:",año_partida*(-1), "a.C")
        else: 
            print("Viajo 20 anios al pasado, estamos en el anio:",año_partida)

#ej 29
def imprimir_1_al_10_v2() -> str:
    for i in range(1, 11, 1):
        print(i)
def imprimir_pares_10_al_40_v2() -> str:
    for i in range(10, 41, 2):
        print(i)
def eco_10_veces_v2() -> str:
    for i in range(0, 10, 1):
        print("eco")
def despegue_v2(numero: int) -> str:
    for i in range(numero, 0, -1):
        print(i)
    print("Despegue")
def viaje_en_el_tiempo_v2(año_partida: int, año_llegada: int) -> str:
    for i in range(año_partida-1, año_llegada-1, -1):
        print("Viajo un anio al pasado, estamos en el anio:",i)
def viaje_hasta_aristoteles_v2(año_partida: int) -> str:
    for i in range(año_partida, -385, -20):
        if i < 0:
            print("Viajo 20 anios al pasado, estamos en el anio:",i*(-1), "a.C")
        else: 
            print("Viajo 20 anios al pasado, estamos en el anio:",i)

def poner_pos_pares_en_cero(s: list[int]):
    i:int = 0
    while i < len(s):
        if i % 2 == 0:
            s[i] = 0
        i += 1


def poner_pos_pares_en_cero_v2(s: list[int]) -> list[int]:
    res: list[int] = s.copy()    #creo una lista que es identica a la lista s
    i:int = 0
    while i < len(s):
        if i % 2 == 0:
            res[i] = 0
        i += 1
    return res

def poner_pos_pares_en_cero_v3(s: list[int], res: list[int]):
    i: int = 0
    while i < len(s):
        if i % 2 == 0:
            res.append(0)
        else:
            res.append(s[i]) 
        i += 1


s = [1,2,3,4,5]
res = []
#poner_pos_pares_en_cero_v3(s, res)
#print(res)

#ejercicio 4.1



#print(nombres_estudiantes())



#print(monedero())

'''def siete_medio() -> list[int]:
    res: list[int] = []
    carta: int = random.radint(1,12)
    ṕuntos: float = 0
    while (carta-8) != 0 or (carta-9) != 0:
        if carta < 8:
            puntos += carta
        elif carta > 9:
            puntos += 0.5
        res.append(puntos)
        seguir: str = input("Apriete Y si quiere seguir: ")
        while seguir == "Y":
                  
#
#    else:
#        carta = random.radint(1,12)
'''


    
