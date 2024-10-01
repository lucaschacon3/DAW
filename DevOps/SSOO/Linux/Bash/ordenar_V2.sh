#!/bin/bash
clear
rm archivo.txt
touch archivo.txt
if [ $1 == "asc" -o $1 == "desc" ]
 then
    opc=$1
	shift
	while [ $# -gt 0 ]
	  do
		echo $1 >> archivo.txt
		shift
	done
    echo "Parametros ordenados"
	if [ $opc == "asc" ]
      then
		sort archivo.txt
    else
        sort -r archivo.txt
	fi
else
	echo "Parametro no comprendido"
fi
