import random

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

def nombres_estudiantes() -> list[str]:
    res: list[str] = []
    nombres:str = input("Escribí el nombre de tus estudiantes: ")
    while nombres != "listo": #el bucle se vuelve a ejecutar si mismo (no como el if que una vez ejecutado sigue la funcion)
        res.append(nombres)
        nombres = input("Escribí el nombre de tus estudiantes: ")
    return res

#print(nombres_estudiantes())

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

#print(monedero())

def siete_medio() -> list[int]:
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
                  

    else:
        carta = random.radint(1,12)



    
