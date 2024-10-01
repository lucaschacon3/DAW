#!/bin/bash

#Realizar un scrip que reciba varios parametros y nos diga cuantos de esos parametros son de directorios y cuantos son archivos. $# contador que indica cuantos parametros se pasan.

if [[ $# == 0 ]]
then 
    echo No se han introducido parámetros
else
    fic=0
    dir=0
    while [ $# -gt 0 ]
    do 
        if [[ -d $1 ]] 
        then
            dir=$(( $dir + 1 ))
        elif [[ -f $1 ]]
        then
            fic=$(( $fic + 1 ))
        else
            echo El parámetro "$1" no existe
        fi
        shift
    done
    echo Se han pasado "$fic" ficheros y "$dir" directorios
fi


