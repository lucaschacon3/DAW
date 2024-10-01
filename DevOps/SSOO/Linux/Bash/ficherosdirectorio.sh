#!/bin/bash
clear
if [ $# -lt 2 -a $# -gt 0 ];then
    if [ -d $1  ];then
      echo "Es un directorio"

    elif [ -e $1 ]; then
        echo "Es un fichero"
    fi

else
    echo "Error al introducir los parametros"
fi