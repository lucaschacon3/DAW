dic={}
for i in range(2):
    dni=int(input("Introduce numeros del dni: "))
    nombre=input("Introduce el nombre: ")
    dic[dni]=nombre

for key,valor in dic.items():
    print(key,":",valor)

dniABuscar = int(input("Introduce DNI a buscar: "))
if dniABuscar in dic: 
    print(dic[dniABuscar])
else:
    print("Ese DNI no esta")
