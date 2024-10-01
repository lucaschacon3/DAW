#! /bin/bash
clear


if [ $# -gt 0 -a $# -lt 3 -a -d $1 -a -d $2 ];then
   echo "Los directorios existen"
else
   echo "Los directorios no existen"
fi

