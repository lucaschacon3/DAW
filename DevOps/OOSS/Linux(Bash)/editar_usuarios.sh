#!/bin/bash

clear

echo "1. Alta"
echo "2. Baja"
echo "3. Modificación"
echo "4. Salir"

read op

if [ $op -eq "1" ]; then
    echo $op "Has entrado en alta"
    addusser
elif [ $op -eq "2" ]; then
    echo $op "Has entrado en baja"
elif [ $op -eq "3" ]; then
    echo $op "Has entrado en modifcacion"
else
    echo $op "Has salido"
fi