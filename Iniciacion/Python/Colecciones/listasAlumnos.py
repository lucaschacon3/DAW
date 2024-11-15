def main():
    nombres=[]
    notas=[]

    for i in range(0,5,1):
        nombre=input("Introduce nombre del alumno: ")
        nombres.append(nombre)
        nota=int(input("Introduce nota del alumno: "))
        notas.append(nota)

    for i in range(0, 5,1):
        print("El alumno",nombres[i], "ha sacado un",notas[i])

    print("Hay",suspensos(notas), "suspensos")

def suspensos(notas):
    contSuspensos=0
    for i in range (0,5,1):
        if notas[i]<5:
            contSuspensos= contSuspensos+1
    return contSuspensos

main()