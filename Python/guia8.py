import math
from random import randint
from queue import Queue as Cola
from queue import LifoQueue as Pila


#EJ 2.8
def generar_nros_al_azar_pilas(cantidad: int, desde: int, hasta:int) -> Pila[int]:
    p : Pila[int] = Pila()
    lista_p : list[int] = []
    for i in range(cantidad):
        num: int = randint(desde, hasta)
        p.put(num)
    return p

pila = generar_nros_al_azar_pilas(10,0,10)
'''def pila_a_lista(pila: Pila[int]) -> list[int]:
    res : list[int] = []
    while not pila.empty():
        elemento = pila.get()
        res.append(elemento)
    return res
print(pila_a_lista(pila))
'''   
#EJ 2.9
def cantidad_elementos(p: Pila[int]) -> int:
    res : int = 0
    temporal: list[int] = []
    while not p.empty():
        temporal.append(p.get())
    res = len(temporal)
    for i in range(len(temporal)-1,0,-1):
        p.put(temporal[i])
    return res

#EJ 2.10
def buscar_el_maximo(p: Pila[int]) -> int:
    res : int = 0
    lista_temporal : list[int] = []
    while not p.empty():
        lista_temporal.append(p.get())
    for i in range(len(lista_temporal)):
        if i < (len(lista_temporal)-2):
            if lista_temporal[i] >= lista_temporal[i+1]:
                res = lista_temporal[i]
            else:
                res = lista_temporal[i+1]
    for i in range(len(lista_temporal)-1,-1,-1):
        p.put(lista_temporal[i])
    return res

#EJ 2.12
expresion = "3 4 + 5 * 2 -"
def evaluar_expresion(s: str) -> float:
    tokens: list[str] = []
    token = ""
    for i in range(len(s)): #Parte 1
        if s[i] != " ":
            token += s[i]
        elif token:
            tokens.append(token)
            token = ""
    if token:
        tokens.append(token)
    #ahora la parte 2
    pila: Pila[float] = Pila() #contiene los numeros
    for i in range(len(tokens)):
        if '0'<= tokens[i] <= '9':
            pila.put(tokens[i])
        elif tokens[i] in ["+","*","-","/"]: #parte 3
            n2: float = float(pila.get())
            n1: float = float(pila.get())
            if tokens[i] == "+":
                pila.put(n1 + n2)
            if tokens[i] == "-":
                pila.put(n1 - n2)
            if tokens[i] == "/":
                pila.put(n1 / n2)
            if tokens[i] == "*":
                pila.put(n1 * n2)
    return pila.get()


#ej 13
def generar_nros_al_azar_colas(cantidad: int, desde:int, hasta:int) -> Cola[int]:
    c: Cola[int] = Cola() #crear
    lista_c : list[int] = []
    for i in range(cantidad): #bucle de numeros aleatorios
        num :int = randint(desde, hasta)
        c.put(num)
    return c

def cola_a_pila(c: Cola[int]) -> list[int]:
    lista: list[int] = []
    while not c.empty():
        lista.append(c.get())
    return lista

#EJ 3.16
#Parte 1
def armar_secuencia_de_bingo() -> Cola[int]:
    c: Cola[int] = Cola()
    lista_numeros : list[int] = []
    for i in range(99):
        numero : int = randint(0,99)
        if not (numero in lista_numeros):
            lista_numeros.append(numero)
            c.put(lista_numeros[i])
        else:
            while numero in lista_numeros:
                numero = randint(0,99)
            lista_numeros.append(numero)
            c.put(lista_numeros[i])
    return c
#Parte 2
def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    elementos_temporales : list[int] = []
    bolillas_descartadas : list[int] = [bolillero.get()]
    elementos_temporales.append(bolillas_descartadas[0])
    for i in range(len(carton)):
        while not (carton[i] in bolillas_descartadas): #ir agregandole de bolilleros a bolillas descartadas
            elemento = bolillero.get()
            bolillas_descartadas.append(elemento)
            elementos_temporales.append(elemento)
    for i in range(len(elementos_temporales)):
        bolillero.put(elementos_temporales[i])
    return len(bolillas_descartadas)


#carton = [1,43,56,7,42,0,9,10]
#EJ 3.19
texto : str = 'Hello, Welcome to demofile.txt\nThis file is for testing purposes and for learning to be a good programmer.\nGood Luck to everyone'
def separar_palabras(palabras: str) -> list[str]:
    palabra: str = ""
    lista_palabra : list[str] = []
    for i in range(len(palabras)):
        if  ('a' <= palabras[i] <= 'z') or ('A' <= palabras[i] <= 'Z'):
            palabra += palabras[i]
        else:
            if palabra:
                lista_palabra.append(palabra)
                palabra = ""
    if palabra:
        lista_palabra.append(palabra)
    return lista_palabra

def agrupar_por_longitud(nombre_archivo: str) -> dict:
    res : dict[int, int] = {}
    palabras = separar_palabras(nombre_archivo)
    for j in range(len(palabras)):
        longitud_palabra = len(palabras[j])
        if longitud_palabra not in res:
            res[longitud_palabra] = 1
        else:
            res[longitud_palabra] += 1
    return res

#EJ 3.21
def frecuencias(nombre_archivo: str) -> dict:
    res : dict = {}
    palabras = separar_palabras(nombre_archivo)
    for i in range(len(palabras)):
        if palabras[i] not in res:
            res[palabras[i]] = 1
        else:
            res[palabras[i]] += 1
    return res

def la_palabra_mas_frecuente(nombre_archivo: str) -> str:
    res : str = ""
    palabra_frecuente : int = 0
    cantidad_frecuente : int = 0
    frec = frecuencias(nombre_archivo)
    for palabra, numero in frec.items():
        if numero >= cantidad_frecuente:
            cantidad_frecuente = numero
            palabra_frecuente = palabra #para llamar al string la posicion mas frecuente
    return palabra_frecuente


    

        

