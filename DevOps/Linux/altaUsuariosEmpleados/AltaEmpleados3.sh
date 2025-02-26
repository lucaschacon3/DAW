#!/bin/bash
echo "Introduce el nombre del grupo a crear: "
read grupo
echo "Introduce el número de empleados que tendrá el grupo: "
read numero
foo="XX"
sudo groupadd $grupo
for (( i=1; i<=$numero; i++ ))
do
	sudo useradd "empleado$i" -p "empleado$i$foo" -g $grupo 
done
