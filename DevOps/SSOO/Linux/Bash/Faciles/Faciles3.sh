#!/bin/bash

if [ $# -eq 1 ]
	then
	    grep '^[AEIOUaeiou]' $1  > salida.txt
else
	echo "No has introducido nada o num parametros erroneo"
fi