#!/bin/bash
clear

contrasena="1234"
posible_contrasena=""
echo "Introduce la contraseña: "
read posible_contrasena

if [ $contrasena -eq $posible_contrasena ]; then
    echo "Contraseña correcta"
else
    echo "Contraseña incorrecta"
fi

