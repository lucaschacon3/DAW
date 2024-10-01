#!/bin/bash

#se requiere un argumento que sera el nombre del directorio
#donde se copiaran los archivos: ~/Desktop/$1
if [ $# -ne 1 ];then
	echo $0: [directorioDestinoFicheros]
	exit 1
fi	 
	 

#creamos el directorio de destino
mkdir ~/Desktop/$1

#creamos variable para contar numero de archivos copiados
nFic=0

#procesamos solo los ficheros de /etc
for fichero in `ls -A /etc`
do
	if [ -f /etc/$fichero ];then
		sudo cp /etc/$fichero ~/Desktop/$1
		nFic=$(( nFic + 1 ))
	fi
done

echo Numero archivos copiados: $nFic