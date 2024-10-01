#!/bin/bash	 

#mostramos numero de parametros pasados
echo "+--------------------------------------+"
echo "|   Numero de parametros pasados: $#   "

#creamos contador para el bucle
contador=1
#guardamos el valor fijo del numero de parametros para el nº de iteraciones
numParametros=$#
#contadores para el numero de archivos y de directorios
numDirectorios=0
numFicheros=0

#mientras que el numero de iteraciones sea menor que el de parametros
#procesamos
while [ $contador -le $numParametros ]
do

	#sumamos ficheros o directorios
	if [ -f $1 ];then
		numFicheros=$(( numFicheros + 1 ))
	elif [ -d $1 ];then
		numDirectorios=$(( numDirectorios + 1 ))
	fi
	
	#avanzamos un parametros
	shift
	
	#sumamos 1 al contador
	contador=$(( contador + 1 ))
	
done

#indicamos numero de fich y dir
echo "|   Numero de ficheros: " $numFicheros
echo "|   Numero de directorios: " $numDirectorios
echo "+--------------------------------------+"