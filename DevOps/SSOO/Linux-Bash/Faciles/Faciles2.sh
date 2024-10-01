#!/bin/bash

if [ $# -ne 0 ]
then
    if [ $1 == $2 ] && [ $2 == $3 ]
then
	echo "son todas iguales"

    elif [ $1 == $2 ]
then
	echo "la primera y segunda son iguales"

    elif [ $1 == $3 ]
then
	echo "la primera y tercera son iguales"

    elif [ $2 == $3 ]
then
	echo "la segunda y tercera son iguales"

    else

	echo "ninguna es igual"

    fi

else

	echo "no has introducido nada"

fi
