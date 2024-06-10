# Ejercicio 1
#
#  problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
#    requiere: {e pertenece a s }
#    asegura: {res es la posición de la última aparición de e en s}
#  }

#ej:
#s = [1,2,34,56,7,453,9,6,0,2]
#e = 2
#res = 9

def ultima_aparicion(s: list[int], e: int) -> int:
    res: int = 0
    intermedio: int = 0
    for i in range(len(s)):
        if s[i] == e:
            res = i
    return res

# Ejercicio 2
#
#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

def elementos_exclusivos( s: list[int], t: list[int]) -> list[int]:
    suma : list[int] = s + t
    res = []
    for i in range(len(suma)):
        count = 0
        for j in range(len(suma)):
            if suma[i] == suma[j]: #cuenta cuantas veces aparece un elemento en otra lista identica
                count += 1
        if count == 1:
            res.append(suma[i])
    return res

#ejemplo:
#s = [1,2,35,5,9,5,0]
#t = [1,67,95,4,8,0,5]
#s + t = [1,2,35,5,9,5,0,1,67,95,4,8,0,5]
#borrar repetidos = [2,35,9,67,95,4,8]

# Ejercicio 3
#
# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

#  Por ejemplo, dados los diccionarios
#    aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}
#  se debería devolver res=2

aleman : dict[str,str] = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
ingles : dict[str,str] = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}

def contar_traducciones_iguales( ing: dict[str,str], ale: dict[str, str]) -> int:
    res: int = 0
    for clave, valor in ing.items():
        if clave in ale.keys() and valor in ale[clave]:
                res += 1
    return res

# Ejercicio 4
#
# Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, 
# y sus valores la cantidad de veces que cada uno de esos números aparece en s

#  problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
#    requiere: -
#    asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
#  }

#  Por ejemplo, dada la lista
#  lista = [-1,0,4,100,100,-1,-1]
#  se debería devolver res={-1:3, 0:1, 4:1, 100:2}
#  
lista = [1,3,5,6,0,78,4,3,2,54,7,990,-4,2,-3,0,3]
def convertir_a_diccionario(s: list[int]) -> dict[int,int]:
    frecuencia : dict[int,int] = {}
    valor : int = 0
    for i in range(len(s)):
        valor = 0
        for j in range(len(s)):
            if s[i] == s[j]:
                valor += 1
        frecuencia[s[i]] = valor
    return frecuencia

print(convertir_a_diccionario(lista))
