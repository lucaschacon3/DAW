#!/bin/bash

if [ $# = 1 ] #si el numero de paramatros = 1
 then
    cp $1 /tmp
    rm $1
else
    echo "ERROR: al introducir el parametro"
fi
