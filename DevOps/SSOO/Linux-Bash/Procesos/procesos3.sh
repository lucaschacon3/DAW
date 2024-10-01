#!/bin/bash

echo -e " ______________________________________________________________
|                                                             |
| 1- Mostrar los 10 procesos qué utilizan más memoria         |
| 2- Mostrar los 10 procesos que utilizan más CPU             |
| 3- Salir                                                    |
| Elija una opción del menú:                                  |
|_____________________________________________________________|
"
read opcion

while [ if $pocion != 0 ]
do
    case $opcion in

	    1)ps -aux --width 30 --sort -rss | head;;

	    2)ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head;;
    
        3)echo "Adios, que tenga un buen día"
          exit;;
    esac
echo -e " ______________________________________________________________
|                                                             |
| 1- Mostrar los 10 procesos qué utilizan más memoria         |
| 2- Mostrar los 10 procesos que utilizan más CPU             |
| 3- Salir                                                    |
| Elija una opción del menú:                                  |
|_____________________________________________________________|
"
read opcion
done
