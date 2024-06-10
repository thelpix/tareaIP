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

print(elementos_exclusivos([1,2,35,5,9,5,0],[1,67,95,4,8,0,5]))
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

# recorro las keys (claves) de ingles y me fijo a la vez si pertenece a la lista de keys (claves) de aleman Y si 
# el valor de la clave en ambas listas es igual. OJO: si pongo los dos operadores logicos en orden inverso (o sea
# digamos si pongo primero la igualdad y luego el pertenece), como no me estoy asegurando de que la clave EXISTE
# en el diccionario de palabras en aleman, el programa SE ROMPE o algo asi en realidad no se bien que pasa pero
#  no esta bueno.

