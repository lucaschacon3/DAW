#!/bin/bash
fechaActual=$(date +%s)
Semana=604800
while read -r line
do
	fechaUltima=$(date -r $line +%s)
	diferencia=$(($fechaActual - $fechaUltima))
	if [ $diferencia -gt $Semana ]
		then echo "$line tiene una fecha de modificacion superior a 7 días, se procederá a eliminar"
		else echo "$line no tiene una fecha de modificacion superior a 7 días, no se eliminará"
	fi
done < rutas
