#!/bin/bash

#se requiere un argumento que sera el nombre del directorio
#donde se procesaran los ficheros
if [ $# -ne 1 ];then
	echo $0: [directorioFicheros]
	exit 1
fi	 

#si el directorio no existe se sale
if [ ! -d $1 ];then
	echo $0: '$1' directorio inexistente
	exit 1
fi	 

#procesamos los ficheros solo si contienen un 3
#y en ese caso les cambiamos la extension
for fichero in ls -A ${1}*3*
do
	if [ -f $fichero ];then
		mv $fichero $1/$(basename $fichero .txt).md
	fi
done