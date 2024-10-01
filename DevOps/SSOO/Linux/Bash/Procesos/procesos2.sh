#!/bin/bash

opcion=1
while [ $opcion -ne 0 ]
	do
	#aunque se ve como partido, al ejecutarlo el menu queda alineado
		echo "+------------------------+
| 1.Top 10 procesos(ram) |
| 2.Top 10 procesos(cpu) |
| 0.Salir                |
+------------------------+"
		echo -n "Opcion: "
		read opcion
		echo
		
		case $opcion in
		
			1)ps aux --sort -%mem --width 50 | head -n 10; echo;;
		
			2)ps aux --sort -%cpu --width 50 | head -n 10; echo;;
		
			0)echo -ne "\ngracias " ; whoami; echo; exit 0;;
		
			*)echo no;;
		esac	
	done
