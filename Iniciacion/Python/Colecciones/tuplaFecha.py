
fecha=(25,"diciembre",2017)
print(fecha)
print("La fecha es: ", fecha[0], "/", fecha[1], "/", fecha[2])

empleado=["paco", 53, (11, 1999)] #tuplas dentro de lista 
print(empleado)
empleado.append((1, 2016))
print(empleado)

alumno=("pedro",[7, 9])#listas dentro de tuplas
print(alumno)
alumno[1].append(10)
print(alumno)

def DiaMesAno():
    tupla=()
    dia=input("Introduce el dia: ")
    mes=input("Introduce el dia: ")
    ano=input("Introduce el dia: ")
    tupla=(dia,mes,ano)
    return tupla

def ImprimeDiaMesAno():
    print(DiaMesAno())

ImprimeDiaMesAno()
