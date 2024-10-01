#!/bin/bash

#se le pasa un parametro que es el fichero a procesar
#el borrado de ficheros solo funciona en dos circuntancias:
	#1.si en la lista, el fichero figura con una ruta absoluta
	#2.si el fichero esta en el directorio en el que ejecutamos el script
 
if [ $# -ne 1 ];then
	echo $0: un argumento
	exit 1;
fi
if [ ! -e $1 ];then
	echo $0: el fichero no existe
	exit 1;
fi	

echo Achivos eliminados:
#se procesa el contenido linea a linea en busca de las fechas, de cada fichero
#se eliminan los ficheros listados cuya ultima modificación fuese hace más de una semana, 7 días
while read linea
	do
		find $linea -type f -mtime +7 -print
		find $linea -type f -mtime +7 -delete
	done < $1