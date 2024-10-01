#!/bin/bash

#se requiere un argumento que sera el nombre del directorio
#donde están los ficheros los ficheros: ~/Desktop/$1
if [ $# -ne 1 ];then
	echo $0: [directorioFicheros]
	exit 1
fi	 

#si el directorio no existe se sale
if [ ! -d $1 ];then
	echo $0: '$1' directorio inexistente
	exit 1
fi

#comprime solo los ficheros 25 y 27 de ese directorio $1
gzip $1/2{5,7}*
	