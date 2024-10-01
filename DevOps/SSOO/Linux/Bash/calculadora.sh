#!/bin/bash
clear


echo "Dame el primer operando"
read num1
echo "Dame el segundo operando"
read num2


echo "Que quieres hacer?:"
echo "1. SUMA"
echo "2. RESTA"
echo "3. MULTIPLICACION"
echo "4. DIVISION"
echo "5. SALIR"


echo "Introduce una opcion del 1 al 4: "
read opcion

while [ $opcion -ne 5 ]
    do 
       case $opcion in
        1)echo "Pulsaste opcion 1"
            suma=$(($num1+$num2))
            echo "La suma es:" $suma;;
            
        2)echo "Pulsaste opcion 2"
            resta=$(($num1-$num2))
            echo "La resta es:" $resta;;
        3)echo "Pulsaste opcion 3"
            multiplicacion= $(($num1*$num2))
            echo "La multiplicacion es:" $multiplicacion;;
        4)echo "Pulsaste opcion 4"
            division=$(($num1/$num2))
            echo "La division es:" $division;;
        *)echo "Pulsaste opcion fuera de rango";;
     esac
    done
echo "HAS SALIDO"





