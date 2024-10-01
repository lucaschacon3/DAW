#!/bin/bash

#se requiere un argumento que sera el nombre del directorio
#donde se crearan los ficheros: ~/Desktop/$1
if [ $# -ne 1 ];then
	echo $0: [directorioDestinoFicheros]
	exit 1
fi	 

#creamos el directorio
mkdir ~/Desktop/$1

#creamos los 40 archivos .txt
for (( i=1 ; i <= 40 ; i++ ))
do
	fichero=$i.txt
	#para los 9 primeros, anteponemos un 0 para el orden
	if [ $i -lt 10 ];then
		fichero=0$i.txt
	fi
	
	touch ~/Desktop/$1/$fichero
	
done