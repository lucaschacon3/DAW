#tuplas
tupla=(1,2,3)
lista=list(tupla)#pasar de tupla a lista para modificar
lista.append(4)
tupla=tuple(lista)#pasar de lista tupla para no poder modificar
print(tupla)

#diccionarios
frutas={"manzana":3,"platanos":5,"melon":12}
print(frutas)

def mostrar(paises):
    for key in paises:
        print(key, paises[key])

paises={"españa":40000000, "chile":50000000, "senegal":30000000}
mostrar(paises)


#if “pais” in paises.keys(): (Para saber si la key existe en el diccionario)
#diccionario2=diccionario.copy() (Para copiar diccionario en otro)

diccionario = {"color": "rojo", "ropa": "gorra"}
for clave, valor in diccionario.items():  
    print("El valor de la clave %s es %s" % (clave, valor)) 

