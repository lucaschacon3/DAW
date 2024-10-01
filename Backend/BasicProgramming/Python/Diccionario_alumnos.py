dic={}
lista=[]
introduceAlumno=True
introduceMateria=False

while introduceAlumno==True:
    codAlumno=input("Introduce codigo alumno: ")
    nombre=input("Introduce nombre: ")
    materia=input("Introduce materia: ")
    nota=int(input("Introduce nota: "))
    
    lista=[nombre, materia, nota]
    dic[codAlumno]= lista

    op=input("Desea cargar los datos de otro alumno [s/n]")
    if op!="s" or op!="S":
        introduceAlumno= False

for key,lista in dic.items():
    print(key,":",lista)
