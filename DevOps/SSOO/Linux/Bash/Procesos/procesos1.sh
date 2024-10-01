#!/bin/bash
echo "Menú de procesos"
echo "1.Mostrar los 10 procesos que utilizan más memoria"
echo "2.Mostrar los 10 procesos que utilizan más CPU"
echo "3.Salir"
echo "Seleccione una opción"
read opcion
case $opcion in
1) ps aux --width 10 --sort -%mem |head;;
2) ps aux --width 10 --sort -%cpu |head;;
3) echo "Hasta luego!" 
  exit;;
*) echo "opcion inválida"
   bash procesos;;
esac
