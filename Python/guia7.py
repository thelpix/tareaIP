import math
import random

#EJ 1.1
def pertenece(s: list[int], e: int) -> bool: #fijarse si en la lista, esta un elemento que sea e
    for i in range(len(s)):
        if e == s[i]:
            return True
    return False
#EJ 1.2
def divide_a_todos(s: list[int], e: int) -> bool: #usar for y preguntar para dar falso
    for i in range(len(s)):
        if s[i] % e != 0:
            return False
    return True

#EJ 1.3
def suma_total(s: list[int]) -> int:
    res: int = 0
    for i in range(len(s)):
        res += s[i]
    return res

#EJ 1.4
def ordenados(s: list[int]) -> bool:
    for i in range(len(s)-1): #excepto el ultimo
        if s[i] > s[i+1]:
            return False
    return True

#EJ 1.5
def palabra_mayor_a_7(palabras: list[str]) -> bool:
    for i in range(len(palabras)):
        if len(palabras[i]) > 7:
            return True
    return False

#EJ 1.6
def es_palindromo(texto: str) -> bool: #espejear, si el primer elemento es igual al ultimo, asi hasta converger en el impar
    for i in range(len(texto)):
        if texto[i] != texto[(len(texto)-1)-i]:
            return False
    return True

#EJ 1.7
def hay_mayuscula(palabra: str) -> bool:
    for i in range(len(palabra)):
        if 'a' <= palabra[i] <= 'z':
            return True
    return False

def hay_minuscula(palabra: str) -> bool:
    for i in range(len(palabra)):
        if 'A' <= palabra[i] <= 'Z':
            return True
    return False

def hay_digito(palabra: str) -> bool:
    for i in range(len(palabra)):
            if '0' <= palabra[i] <= '9':
                return True
    return False

def fortaleza_contra(contraseña: str) -> str: #funcion auxiliar de si hay mayuscula,minuscula, o numero
    if (len(contraseña) < 5):
        return "ROJA"
    elif len(contraseña) > 8 and hay_mayuscula(contraseña) and hay_minuscula(contraseña) and hay_digito(contraseña):
        return "VERDE"
    else:
        return "AMARILLA"   
    
#EJ 1.8
def saldo_actual(historial: list[tuple[str,int]]) -> int:
    saldo : int = 0
    for i in range(len(historial)):
        if historial[i][0] == "I":
            saldo += historial[i][1]
        else:
            saldo -= historial[i][1]
    return saldo

#EJ 1.9
def borrar_repetidas(palabra: str, letra: str) -> str: #borra todas y reposiciona la letra en la ultima posicion, ej: "hola" -> "olah"
    nueva_palabra : str = ""
    for i in range(len(palabra)):
        if palabra[i] != letra:
            nueva_palabra += palabra[i]
    nueva_palabra += letra
    return nueva_palabra

def letras_distintas_3(palabra: str) -> bool:
    palabra_original : str = palabra
    for i in range(len(palabra_original)):
        palabra = borrar_repetidas(palabra, palabra_original[i]) ##borrar todas las letras repetidas dejando 1 sola, para contar las distintas
    if len(palabra) >= 3:
        return True
    else:
        return False

#EJ 2.2
def pares_poner_0(numeros: list[int]):
    for i in range(len(numeros)):
        if i % 2 == 0:
            numeros[i] = 0

def nuevos_pares_poner_0(numeros: list[int]) -> list[int]:
    output : list[int] = []
    for i in range(len(numeros)):
        if i % 2 == 0:
            output.append(0)
        else:
            output.append(numeros[i])
    return output

#EJ 2.3
def es_vocal(letra:str) -> bool:
    if (letra == "A" or letra == "a" or letra == "e" or letra == "E" or letra == "i" or letra == "I" or letra == "o" or letra == "O" or letra == "u" or letra == "U"):
        return True
    else:
        return False

def sin_vocales(palabra: str) -> str:
    nueva_palabra : str = ""
    for i in range(len(palabra)):
        if not es_vocal(palabra[i]):
            nueva_palabra += palabra[i]
    return nueva_palabra

#EJ 2.4
##REMPLAZAR vocales por -
def reemplaza_vocales(s: str) -> str:
    nueva_palabra : str = ""
    for i in range(len(s)):
        if es_vocal(s[i]):
            nueva_palabra += "-"
        else:
            nueva_palabra += s[i]
    return nueva_palabra

#EJ 2.5
def da_vuelta_str(s: str) -> str:
    res: str = ""
    for i in range(len(s)):
        res += s[len(s)-1-i]
    return res

#EJ 2.6
##si pertenece s[i] a la salida, es que ya habia una letra en la salida, entonces si ya pertenece, no la sumo.
def eliminar_repetidos(s: str) -> str:
    res: str = ""
    for i in range(len(s)):
        if not (s[i] in res):
            res += s[i]
    return res

#EJ 3
def aprobado(notas: list[int]) -> int:
    promedio: int = 0
    for i in range(len(notas)):
        if notas[i] < 4:
            return 3
        else:
            promedio += notas[i]
    promedio = int(promedio/len(notas))
    if promedio >= 4 and promedio < 7:
        return 2
    else:
        return 1

#EJ 4.1
def nombres_estudiantes() -> list[str]:
    res: list[str] = []
    nombres:str = input("Escribí el nombre de tus estudiantes: ")
    while nombres != "listo": #el bucle se vuelve a ejecutar si mismo (no como el if que una vez ejecutado sigue la funcion)
        res.append(nombres)
        nombres = input("Escribí el nombre de tus estudiantes: ")
    return res

#EJ 4.2
def monedero() -> list[tuple[str,int]]:
    res: list[tuple[str,int]] = []
    creditos: str = input("Ingrese C para cargar, D para descontar, X para finalizar: ")
    while creditos != "X":
        if creditos == "C":
            pesos: int = int(input("Ingrese el monto a cargar: "))
            res.append((creditos, pesos))
        elif creditos == "D":
            pesos: int = int(input("Ingrese el monto a descontar: ")) * (-1) 
            res.append((creditos, pesos))
        creditos: str = input("Ingrese C para cargar, D para descontar, X para finalizar: ")
    return res

#EJ 4.3
def juego_7_medio() -> list[int]:
    historial : list[int] = []
    puntos : float = 0
    seguir : str = "S"
    while seguir == "S" and puntos <= 7.5:
        carta: int = random.choice([0,1,2,3,4,5,6,7,10,11,12])
        print("Te toco un " + str(carta))
        historial.append(carta)
        if carta <= 7:
            puntos += carta
        else:
            puntos += 0.5
        if puntos > 7.5:
            print("Perdiste")
            return print(historial)
            seguir : str = "P"
        else:
            seguir = input("Contador: " + str(puntos) + " P para Plantar, S para Sacar: " )
    return print(historial)


