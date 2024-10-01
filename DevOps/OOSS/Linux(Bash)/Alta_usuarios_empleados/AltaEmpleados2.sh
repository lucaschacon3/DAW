#!/bin/bash

#CONTRASEÑAS FUNCIONANDO

echo -n "Nombre del grupo:"
read grupo

#creamos grupo
sudo groupadd $grupo

#controlamos el numero de usuarios introducido
nUsuarios=0
while [ $nUsuarios -lt 1 ]
do
	echo -n "Nº usuarios a crear(min.1):"
	read nUsuarios
done

#ejecutamos las adiciones de usuarios al grupo y sus contraseñas
contador=1

while [ $contador -le $nUsuarios ]
	do
		#creamos el usuario y lo añadimos al grupo
 		sudo useradd -m usuario$contador -g $grupo
		#creamos la contraseña para el usuario previamente creado 
		#al comando 'passwd' se le pasa por tuberia  dos veces la contraseña con un '\n' cada vez
		#para que se detecte el salto de linea al pulsar enter tras meter la contraseña y la contraseña
		#de confirmacion
 		echo -e usuario$contador'XX''\n'usuario$contador'XX''\n' | sudo passwd usuario$contador
 		((contador++))
	done