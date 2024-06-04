import math
from random import randint
from queue import Queue as Cola

#ej 13
def generar_nros_al_azar(cantidad: int, desde:int, hasta:int) -> Cola[int]:
    c: Cola[int] = Cola() #crear
    lista_c : list[int] = []
    for i in range(cantidad): #bucle de numeros aleatorios
        num :int = randint(desde, hasta)
        c.put(num)
        lista_c.append(c.get())
    return lista_c

#ej 19
#funcion auxiliar que convierte str en una lista de strs
def separar_str(texto: str) -> list[str]:
    nombre_archivo : list[str] = []
    palabra : str = ""
    for i in range(len(texto)): #hasta que encuentre un vacio
        if texto[i] != " ":
            palabra += texto[i]
        else:
            nombre_archivo.append(palabra)
            palabra = ""
    if palabra:
        nombre_archivo.append(palabra)
    return nombre_archivo

'''            
def agrupar_por_longitud(nombre_archivo: str) -> dict[int, int]: #hola que tal es nombre_archivo
    #nombre_archivo : str = separar_str(nombre_archivo)
    archivo = open(nombre_archivo)
    longitudes: dict[int, int] = {}
        for linea in archivo.readlines():
            for palabra in linea.split():
                if len(palabra) in longitudes
'''

