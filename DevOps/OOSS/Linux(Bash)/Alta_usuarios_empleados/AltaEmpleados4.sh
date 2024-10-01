#!/bin/bash

#Nombre del grupo
#Cuántos usuarios quieres crear
#Crear grupo
#Crear los usuarios que te pida
#--Nombre de usuario: EMpleado1, empleado2 ...
#Meterlos dentro del grupo
#Asignar ocntraseña por defecto
#--Contraseña por defecto: empleadoNxx

echo "Buenos días"
echo "Escriba un nombre para el grupo:"
echo \n
read nombregrupo
groupadd $nombregrupo
echo \n
echo "Vamos a proceder a crear los usuarios de los empleados"
echo "Tenga en cuenta que el nombre del usuario será: empleado (número empleado)"
echo "de modo que el nombre del primer empleado será: empleado1 y así sucesivamente"
echo \n
echo "¿Cuántos empleados desean tener su usuario?"
read numempleados
i=1
xx=xx
while [ $i -gt $numempleados ]
do
   sudo useradd "empleado$i" -p "empleado$i$xx" -g $nombregrupo 
   $i=((i+1))
done
echo \n
echo "Todos los usuarios han sido creados correctamente"

