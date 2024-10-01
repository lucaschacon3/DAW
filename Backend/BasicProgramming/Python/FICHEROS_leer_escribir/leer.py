archivo= open("ejercicio1.txt","r+")
print(archivo.read())
archivo.close()

#OTRA FORMA

from io import open
with open("ejercicio1.txt","r+")as archivo:
   print(archivo.read)