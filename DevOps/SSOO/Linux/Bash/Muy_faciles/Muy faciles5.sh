#!/bin/bash	 

#creamos dos contadores
nFicheros=0
nDirectorios=0

#contamos ficheros y directorios de /etc
for elemento in `ls -A /etc`
do
	#si es fichero
	if [ -f /etc/$elemento ];then
		nFicheros=$(( nFicheros + 1 ))
	#si es directorio
	elif [ -d /etc/$elemento ];then
		nDirectorios=$(( nDirectorios + 1 ))
	fi
done

echo "Numero de ficheros en /etc: " $nFicheros
echo "Numero de directorios en /etc: " $nDirectorios