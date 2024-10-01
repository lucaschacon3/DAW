#!/bin/bash

if [ $# -ne 0 ]
then
	cont=$#;
	while [ $# -gt 0 ]
	do
		if [ -d $1 ]
		then
			echo "$1 es un directorio"
		elif [ -f $1 ]
		then
			echo "$1 es un archivo"
		else
			echo "$1 no es ni archivo ni directorio"
		fi
		shift
	done
	echo "se han pasado $cont argumentos"	
else
	echo "No has introudcido nada"
fi
