#!/bin/bash
clear

if [ $# -lt 4 -a $# -gt 1 ];then
    if [ $1 == $2 -a $2 == $3 ];then
        echo "Son las tres palabras iguales"
    elif [ $1 != $2 -a $2 != $3 -a $1 != $3 ];then
        echo "Son las tres palabras distintas"
    elif [ $1 == $2 -a $2 != $3 ];then
        echo "La palabra 1 y 2 son iguales"
        echo "La palabra 1 y 2 son distintas a la 3"
    elif [ $1 != $2 -a $2 == $3 ];then
        echo "La palabra 2 y 3 son iguales"
        echo "La palabra 2 y 3 son distintas a la 1"
    elif [ $1 == $3 -a $2 != $3 ];then
        echo "La palabra 1 y 3 son iguales"
        echo "La palabra 1 y 3 son distintas a la 2"
    fi

else
    echo "Error al introducir los parametros"
fi