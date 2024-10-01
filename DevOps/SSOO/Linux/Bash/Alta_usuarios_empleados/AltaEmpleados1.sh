#!/bin/bash

echo "Introduzca el nombre del grupo"

read grupo

sudo groupadd $grupo

echo "Grupo añadido satisfactoriamente"

echo "Introduzca el número de empleados"

read num

while [ $num -le 0 ]
    do
 	    if [ $num -le 0  ]
	        then
		        echo "ERROR: Introduzca un número diferente de 0"
		        echo "Introduzca un número (entero mayor que 0) de empleados"
		        read num
	    fi
    done

cont=0

while [ $cont -le $num ]
    do
	    cont=$((cont+1))
	    if [ $cont -le $num ]
	        then
	            sudo useradd empleado$cont -p 'empleado'$cont'xx' -g $grupo
                echo "Empleados añadidos satisfactoriamente"
	    fi
    done
