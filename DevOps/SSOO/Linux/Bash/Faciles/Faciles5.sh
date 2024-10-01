#!/bin/bash

#obligatorio dos argumentos
if [ $# -ne 2 ];then
	echo "$0: dos parametros-->> [fichEntrada] [fichSalida]"
	exit 1
fi

#si $1 no es fichero, salimos
if [ ! -f $1 ];then
	echo $0: "'"$1"'" no es un fichero
	exit 1
fi

#leemos el fichero que le pasamos por la entrada estandar al bucle while
#cada iteracion de read lee una linea
while read linea
do
	#si la linea comienza por vocal se manda por la salida al fichero en $2 
	#para el inicio de la cadena se usa "^"
	#el fichero se crea en el directorio actual
	grep '^[AEIOUaeiou]' > $2
done < $1
