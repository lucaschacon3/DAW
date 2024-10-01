#!/bin/bash

#Crear un script que lea un archivo de entrada, y guarde en otro archivo de salida, las líneas que comienzan con una vocal (mayúscula o minúscula).
#Recibir los nombres de los archivos por parámetros.

if [[ $# == 1 ]]
then
    #Creamos el fichero donde se copiarán las líneas
    touch lineasVocales
    grep '^[AEIOUaeiou]' "$1" > lineasVocales
elif [[ $# == 2 ]]
then
    grep '^[AEIOUaeiou]' "$1" > $2
else
    echo Ha de introducir uno o dos ficheros
fi


