def CargarDic():
    dic = {}
    for i in range(3):  
        es = input("Introduce palabra en español: ")
        en = input("Introduce la palabra en inglés: ")
        dic[en] = es
    
    return dic

def ImprimirDic(dic):
    for clave, valor in dic.items(): 
        print(clave + ": " + valor) 

def BuscarPalabra(dic):
    palabra = input("Introduce palabra a buscar en inglés: ")
    if palabra in dic: 
        print(dic[palabra])
    else:
        print("Esa palabra no existe en el diccionario")

dic = CargarDic()
ImprimirDic(dic)
BuscarPalabra(dic)
