archivo= open("ejercicio1.txt","w+")
archivo.write("hola hola")
archivo.close()

#OTRA FORMA

from io import open
with open("ejercicio1.txt","w+")as archivo:
   archivo.write("hola")